From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 18:52:33 +0100
Subject: [Buildroot] [PATCH v5 2/2] package/ffmpeg: bump to version 4.1.2
In-Reply-To: <20190323122818.32101-2-bernd.kuhls@t-online.de>
References: <20190323122818.32101-1-bernd.kuhls@t-online.de>
 <20190323122818.32101-2-bernd.kuhls@t-online.de>
Message-ID: <20190325185233.700819c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Mar 2019 13:28:18 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +config BR2_PACKAGE_FFMPEG_FFSERVER
> +	bool "Build ffserver"

That's a pretty bad title for Config.in.legacy, so I changed it to:

	bool "ffmpeg ffserver removed"

> +	depends on BR2_USE_MMU # fork()

Replicating this dependency is not necessary. However, "select
BR2_LEGACY" was missing.

I fixed those two issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
