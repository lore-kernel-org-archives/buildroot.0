From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 17:42:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-04-04
In-Reply-To: <20210405093012.2186140228@smtp2.osuosl.org>
References: <20210405093012.2186140228@smtp2.osuosl.org>
Message-ID: <20210405174219.1f530665@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 05 Apr 2021 09:30:00 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>                  at91bootstrap | CVE-2020-11683   | https://security-tracker.debian.org/tracker/CVE-2020-11683  
>                  at91bootstrap | CVE-2020-11684   | https://security-tracker.debian.org/tracker/CVE-2020-11684  

These two CVEs in fact don't affect at91bootstrap in version 1.16.x.
The NVD database doesn't distinguish the old at91bootstrap (1.x) and
the new one (3.x). Those CVEs are marked to affect all versions up to
3.9.2, but in fact the problematic code was added in 3.7.2.

I originally thought of solving this by adding an
AT91BOOTSTRAP_IGNORE_CVES variable, but thinking more about it, the CVE
entries should be adjusted to indicate that only version >= 3.7.2 and <
3.9.2 are affected. I have sent an e-mail to the NVD folks about this.
We'll see if they respond.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
