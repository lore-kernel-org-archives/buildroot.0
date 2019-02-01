From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Feb 2019 12:59:50 +0100
Subject: [Buildroot] [PATCH] host-genimage: add host-mtools to
 dependency list
In-Reply-To: <20190201091304.31051-1-alexandru.ardelean@analog.com> (Alexandru
 Ardelean's message of "Fri, 1 Feb 2019 11:13:04 +0200")
References: <20190201091304.31051-1-alexandru.ardelean@analog.com>
Message-ID: <874l9n1zyh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandru" == Alexandru Ardelean <ardeleanalex@gmail.com> writes:

 > From: Alexandru Ardelean <ardeleanalex@gmail.com>
 > The mcopy command is needed to generate vfat images.
 > If the host system has mtools installed, all is fine, since `genimage`
 > would use it.

 > But since there is already a `host-mtools` build in the buildroot
 > packages, then this can be used instead.

 > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>

There are use cases for genimage that does not require mcopy, so this
isn't really nice.

But it is indeed true that a lot of genimage use cases require
host-dosfstools and host-mtools:

E.G. from raspberrypi_defconfig:

# Required tools to create the SD image
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


> ---
 >  package/genimage/genimage.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
 > index 393c3e9b94..18eea58af2 100644
 > --- a/package/genimage/genimage.mk
 > +++ b/package/genimage/genimage.mk
 > @@ -7,7 +7,7 @@
 >  GENIMAGE_VERSION = 10
 >  GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 >  GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 > -HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
 > +HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse host-mtools
 >  GENIMAGE_LICENSE = GPL-2.0
 >  GENIMAGE_LICENSE_FILES = COPYING
 
 > -- 
 > 2.17.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
