From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 18:54:19 +0200
Subject: [Buildroot] [PATCH 02/14] package/irrlicht: new package
References: <20170411222643.9770-1-romain.naour@gmail.com>
 <20170411222643.9770-2-romain.naour@gmail.com>
Message-ID: <r6901exniq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

afaics the irrlicht package only provides libirrlicht.so.
What about naming the package libirrlicht and move it to
"Target packages > Libraries > Graphics"?

Am Wed, 12 Apr 2017 00:26:31 +0200 schrieb Romain Naour:

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  ...-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch | 44 +++++++++++++++++
>  package/irrlicht/0002-remove-sys-sysctl.h.patch    | 38 +++++++++++++++

Did you send the patches upstream?

@Whoever will commit the patches to buildroot: The irrlicht source code
has DOS line endings, please adjust the patch files accordingly.

> diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
> new file mode 100644
> index 0000000..ab6187c
> --- /dev/null
> +++ b/package/irrlicht/irrlicht.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# irrlicht
> +#
> +################################################################################
> +
> +IRRLICHT_VERSION_MAJOR = 1.8
> +IRRLICHT_VERSION = $(IRRLICHT_VERSION_MAJOR).4
> +IRRLICHT_SOURCE = irrlicht-$(IRRLICHT_VERSION).zip
> +IRRLICHT_SITE = https://downloads.sourceforge.net/project/irrlicht/Irrlicht%20SDK/$(IRRLICHT_VERSION_MAJOR)/$(IRRLICHT_VERSION)
> +IRRLICHT_INSTALL_STAGING = YES
> +
> +# Bundled libraries: bzip2, libaesGladman, libpng, lzma, zlib,
> +IRRLICHT_LICENSE = bzip2 license, jpeg-license (BSD-3-Clause-like), Libpng, Zlib

Please mention the license of the irrlicht package itself.

Regards, Bernd
