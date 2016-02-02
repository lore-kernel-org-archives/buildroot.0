From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 14:04:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/libraw1394: fix musl build
In-Reply-To: <1454171381-4556-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454171381-4556-1-git-send-email-bernd.kuhls@t-online.de>
 <1454171381-4556-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0A957.6020403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 17:29, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/33c/33cac2bda4890b6050c71734b2c36a77db3d3a09/
> http://autobuild.buildroot.net/results/9b5/9b56c1eb7a790d6df6665e8592004f20ed3f0693/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Since Peter doesn't like patches with stupid names in the DL directory, the
patch will have to be included directly in buildroot. It looks good to me. The
patch comment can be:

Use standard C integer types instead of glibc-specific ones

This fixes musl builds.


 With that, you can add my
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Please don't forget to send this patch upstream.

 Regards,
 Arnout

> ---
>  package/libraw1394/libraw1394.hash | 2 ++
>  package/libraw1394/libraw1394.mk   | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/libraw1394/libraw1394.hash b/package/libraw1394/libraw1394.hash
> index 3674ad7..b785995 100644
> --- a/package/libraw1394/libraw1394.hash
> +++ b/package/libraw1394/libraw1394.hash
> @@ -1,2 +1,4 @@
>  # From https://www.kernel.org/pub/linux/libs/ieee1394/sha256sums.asc
>  sha256	1bab9780189f9d1eb4e973df12679c04f979c21e024240fc98e536ff5b680ee9	libraw1394-2.1.1.tar.xz
> +# Locally computed
> +sha256	39369c65fbed7fccc2e6d8e645f258f101c414107d67238f10996e6c2009f20d	fix-types.patch
> diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
> index c9bc0b1..7123ac7 100644
> --- a/package/libraw1394/libraw1394.mk
> +++ b/package/libraw1394/libraw1394.mk
> @@ -7,6 +7,7 @@
>  LIBRAW1394_VERSION = 2.1.1
>  LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
>  LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
> +LIBRAW1394_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/libraw1394/fix-types.patch
>  LIBRAW1394_INSTALL_STAGING = YES
>  LIBRAW1394_LICENSE = LGPLv2.1+
>  LIBRAW1394_LICENSE_FILES = COPYING.LIB
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
