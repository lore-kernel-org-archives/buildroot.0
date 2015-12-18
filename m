From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:40:11 +0100
Subject: [Buildroot] [PATCH 2/2] v4l2grab: new package
In-Reply-To: <566847AA.3040401@inbox.ru>
References: <1449007230-3175-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1449007230-3175-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <566847AA.3040401@inbox.ru>
Message-ID: <20151218224011.117e774b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, but there were still two remaining issues. See below.

On Wed, 9 Dec 2015 18:24:26 +0300, Viacheslav Volkov wrote:

> diff --git a/package/v4l2grab/v4l2grab.hash b/package/v4l2grab/v4l2grab.hash
> new file mode 100644
> index 0000000..e0a1797
> --- /dev/null
> +++ b/package/v4l2grab/v4l2grab.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 568d51512107226dab1ac809ab1ed4d544ce3f8f505b62c3b2177fb643c8157b v4l2grab-0abed72532bee02e545a1924b6883c839d50febf.tar.gz
> diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
> new file mode 100644
> index 0000000..12b4c3f
> --- /dev/null
> +++ b/package/v4l2grab/v4l2grab.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# v4l2grab
> +#
> +################################################################################
> +
> +V4L2GRAB_VERSION = 0abed72532bee02e545a1924b6883c839d50febf
> +V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
> +V4L2GRAB_LICENSE = GPLv2+
> +V4L2GRAB_LICENSE_FILE = LICENSE.md

This variable should have been named V4L2GRAB_LICENSE_FILES.

> +# Fetched from github, no pre-generated configure script provided
> +V4L2GRAB_AUTORECONF = YES
> +V4L2GRAB_DEPENDENCIES = libjpeg libv4l

And as noted by Arnout, we should not depend on libjpeg, but on jpeg.

I've fixed those two issues before applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
