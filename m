From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 09:52:42 +0200
Subject: [Buildroot] [PATCH 1/1] libsoxr: new package
In-Reply-To: <1397867553-7107-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1397867553-7107-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140419095242.4f405cdd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Sat, 19 Apr 2014 02:32:33 +0200, Hadrien Boutteville wrote:
> Building tests fails mainly because of the cross-compilation, so they
> are disabled for the moment.
> 
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>

Thanks, this is looking good. A few comments below.


> diff --git a/package/libsoxr/Config.in b/package/libsoxr/Config.in
> new file mode 100644
> index 0000000..ad6f8dd
> --- /dev/null
> +++ b/package/libsoxr/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_LIBSOXR
> +	bool "libsoxr"

Really no toolchain dependencies? Can you test this package with the
following toolchain configurations:

 http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-linux-uclibc.config
  -> this one tests !MMU

 http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config
  -> this one tests !MMU and static library only

 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config
  -> this one tests the absence of thread support

 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config
  -> and this one tests a minimal toolchain


> diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
> new file mode 100644
> index 0000000..c0fb72b
> --- /dev/null
> +++ b/package/libsoxr/libsoxr.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libsoxr
> +#
> +################################################################################
> +
> +LIBSOXR_VERSION = 0.1.1
> +LIBSOXR_SITE = git://git.code.sf.net/p/soxr/code

The project apparently provides a tarball. Could you use the tarball
instead of the Git repository?

> +LIBSOXR_LICENSE = LGPLv2.1

According to the LICENSE file, the license is LGPLv2.1+

> +LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
> +LIBSOXR_INSTALL_STAGING = YES

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
