From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 00:53:26 +0100
Subject: [Buildroot] [PATCH 06/18] libtirpc: new package
In-Reply-To: <045efa9091a2b75fca45da07eeeb107d90418771.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <045efa9091a2b75fca45da07eeeb107d90418771.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095AE76.70301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:47, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
[snip]
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> new file mode 100644
> index 0000000..0172f0d
> --- /dev/null
> +++ b/package/libtirpc/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBTIRPC
> +	bool "libtirpc"
> +	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC

  This line is removed again in the next patch.

> +	help
> +	  Libtirpc is a port of Sun's Transport-Independent RPC
> +	  library to Linux.
> +
> +	  http://sourceforge.net/projects/libtirpc/
> +
> +config BR2_RPC_SUPPORT_AVAILABLE
> +       bool
> +       default y if (BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_PACKAGE_LIBTIRPC)
> diff --git a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch

  What's the upstream status of the patches?  I guess at least this one will not be accepted
upstream...

[snip]
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> new file mode 100644
> index 0000000..32fbeb5
> --- /dev/null
> +++ b/package/libtirpc/libtirpc.mk
> @@ -0,0 +1,17 @@
> +#############################################################
> +#
> +# libtirpc
> +#
> +#############################################################
> +
> +LIBTIRPC_VERSION = 0.2.2
> +LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
> +LIBTIRPC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)

  http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)

> +LIBTIRPC_LICENSE = BSD-3c
> +LIBTIRPC_LICENSE_FILES = COPYING
> +
> +LIBTIRPC_INSTALL_STAGING = YES
> +LIBTIRPC_AUTORECONF = YES
> +LIBTIRPC_DEPENDENCIES = host-pkg-config

  host-pkgconf

> +
> +$(eval $(autotools-package))


  Maybe test your patch :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
