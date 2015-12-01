From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2015 23:25:52 +0100
Subject: [Buildroot] [PATCH 2/2] v4l2grab: new package
In-Reply-To: <1449007230-3175-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1449007230-3175-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1449007230-3175-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <565E1E70.30403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-12-15 23:00, Thomas Petazzoni wrote:
> From: Volkov Viacheslav <sv99@inbox.ru>
> 
> [Thomas:
>  - remove dependency on musl, since libv4l can now be built without
>    musl
>  - add missing Config.in comment for the toolchain dependencies
>  - add hash file.
>  - rework commit log.
>  - expand Config.in help text.]
> 
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[snip]
> +++ b/package/v4l2grab/v4l2grab.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# v4l2grab
> +#
> +################################################################################
> +
> +V4L2GRAB_VERSION = 7815752fafb8b797047e819a08a3b6e2f2880846
> +V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
> +V4L2GRAB_LICENSE = GPLv2+
> +V4L2GRAB_LICENSE_FILE = LICENSE

 I only see LICENSE.md in the repository. Oh, that's because it changed name
just two days ago. Perhaps it would be a good idea to bump to
0abed72532bee02e545a1924b6883c839d50febf now and fix the license file name,
since it will most likely be forgotten in the next bump.

 Regards,
 Arnout

> +# Fetched from github, no pre-generated configure script provided
> +V4L2GRAB_AUTORECONF = YES
> +V4L2GRAB_DEPENDENCIES = libjpeg libv4l

 You select BR2_PACKAGE_JPEG, not BR2_PACKAGE_LIBJPEG, so you should depend on
jpeg instead of libjpeg.

 With that fixed you can add my
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
