From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Apr 2015 00:25:03 +0200
Subject: [Buildroot] [PATCH v4] gst1-imx: add package
In-Reply-To: <1427710343-23255-1-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Mon, 30 Mar 2015 12:12:23 +0200")
References: <1427710343-23255-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87y4m6fc1s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <bisson.gary@gmail.com> writes:

 > From: Gary Bisson <bisson.gary@gmail.com>
 > Open-source GStreamer 1.0 plugins for i.MX6 platforms.
 > More info at https://github.com/Freescale/gstreamer-imx

 > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
 > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
 > ---
 > Modifications v3->v4:
 > - Bump version to 0.10.1

> +config BR2_PACKAGE_GST1_IMX
 > +	bool "gst1-imx"
 > +	depends on BR2_LINUX_KERNEL
 > +	depends on BR2_arm # Only relevant for i.MX
 > +	depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
 > +	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 > +	depends on BR2_PACKAGE_LIBFSLVPUWRAP
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE

All these depends on are not really that nice, but after fiddling with
it for a while I also don't manage to get to anything better without
getting kconfig to complain about recursion issues, so lets leave it
like this.

> +	help
 > +	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
 > +	  i.MX6 platforms, with emphasis on video en/decoding using the VPU
 > +	  engine.
 > +
 > +	  This software supports only the i.MX6 SoC family and requires a
 > +	  kernel that includes the i.MX6 specific headers to be built.
 > +
 > +	  The software as a whole is currently in beta stage.

I've added the upstream URL here and committed, thanks.

-- 
Bye, Peter Korsgaard
