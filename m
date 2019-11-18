From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:15:31 +0100
Subject: [Buildroot] [PATCH] package/libfcgi: bump to version 2.4.2
In-Reply-To: <20191118125434.105949-1-louis.rannou@smile.fr>
References: <20191118125434.105949-1-louis.rannou@smile.fr>
Message-ID: <20191118211531.5322485f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Mon, 18 Nov 2019 13:54:34 +0100
Louis Rannou <louis.rannou@smile.fr> wrote:

> FCGI is abandonned (https://repo.or.cz/fcgi2.git). Replace it by a maintained
> fork (https://github.com/FastCGI-Archives/fcgi2).
> 
> Most of the patches are already in the latest version.

Ideally, it would be nice to have a more detailed description of the
status of the patches, with for each patch that is removed, a link to
the corresponding upstream commit.

> diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
> index 98aa2ecf8f..9c82bf1085 100644
> --- a/package/libfcgi/libfcgi.hash
> +++ b/package/libfcgi/libfcgi.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9	fcgi-2.4.0.tar.gz
> +sha256	180ba6148fc56fedf60132600bdc444a5faf0618b1fede4d6462289b5d4cafff	libfcgi-2.4.2.tar.gz

Are you sure about this hash ? Because when I applied your patch and
try to build, I get:

ERROR: libfcgi-2.4.2.tar.gz has wrong sha256 hash:
ERROR: expected: 180ba6148fc56fedf60132600bdc444a5faf0618b1fede4d6462289b5d4cafff
ERROR: got     : 1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc

Also, did you try building the reverse dependencies of libfcgi after
this version bump? There's only 3 reverse dependencies, so it should be
pretty easy to do a quick build. For example this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LUA=y
BR2_PACKAGE_WSAPI_FCGI=y
BR2_PACKAGE_BOINC=y
BR2_PACKAGE_FCGIWRAP=y
# BR2_TARGET_ROOTFS_TAR is not set

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
