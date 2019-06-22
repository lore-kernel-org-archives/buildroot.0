From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:48:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.4.3
In-Reply-To: <1561208392-11096-1-git-send-email-pjtexier@koncepto.io>
References: <1561208392-11096-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190622174831.1d877d9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 14:59:52 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Also change the site location, see:
>  - https://release-monitoring.org/project/5128/

Nope, changing the site location is not a good idea, see below.

> -WHOIS_VERSION = 5.4.0
> -WHOIS_SITE = http://snapshot.debian.org/archive/debian/20181026T220636Z/pool/main/w/whois
> +WHOIS_VERSION = 5.4.3
> +WHOIS_SITE = http://ftp.debian.org/debian/pool/main/w/whois

The problem with ftp.debian.org URLs is that they are not stable. As
Debian moves forward, whois 5.4.3 will become no longer packaged in
Debian, and will disappear from ftp.debian.org. snapshot.debian.org
URLs however are stable. So we should continue to use a
snapshot.debian.org URL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
