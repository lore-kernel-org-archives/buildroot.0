From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 21:05:10 +0100
Subject: [Buildroot] [PATCH] New package: sdparm
In-Reply-To: <4CFCC1D9.8070209@visionsystems.de>
References: <4CFCC1D9.8070209@visionsystems.de>
Message-ID: <20101206210510.5ef8ca45@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Mon, 06 Dec 2010 11:58:33 +0100
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> Index: b/package/sdparm/Config.in
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ b/package/sdparm/Config.in	2010-12-06 11:14:41.000000000
> +0100 @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_SDPARM
> +	bool "sdparm"
> +	help
> +	  Utility to accesses SCSI device parameters.

We generally put the URL of the project here in the help text.

> Index: b/package/sdparm/sdparm.mk
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ b/package/sdparm/sdparm.mk	2010-12-06 08:33:16.000000000
> +0100 @@ -0,0 +1,7 @@
> +SDPARM_VERSION = 1.06
> +SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
> +SDPARM_SITE = http://sg.danny.cz/sg/p/
> +SDPARM_INSTALL_STAGING = NO
> +SDPARM_INSTALL_TARGET = YES

You can get rid of those last two lines, they are the default behaviour.

Once you have fixed those two minors comment, you get my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter: it builds fine here with a minimal Buildroot toolchain (no
largefile, no IPv6, no locale, etc.).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
