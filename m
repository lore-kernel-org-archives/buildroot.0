From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:06:48 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/opensc: new package
In-Reply-To: <vtnyOPUcLKKBUVjtW_D5JrRC5N5DfTiqL8Iyiu1KSPxzgvAFbo61ULCtztMd-suIPR7Ab8eYMjQH6-XBjDs3Uxakebo-SY4fQhRhwBQ7u-g=@protonmail.com>
References: <vtnyOPUcLKKBUVjtW_D5JrRC5N5DfTiqL8Iyiu1KSPxzgvAFbo61ULCtztMd-suIPR7Ab8eYMjQH6-XBjDs3Uxakebo-SY4fQhRhwBQ7u-g=@protonmail.com>
Message-ID: <20201015230648.4e448ed8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Oct 2020 15:01:36 +0000
Yair Ben-Avraham via buildroot <buildroot@busybox.net> wrote:

> Open source smart card tools and middleware.
> OpenSC provides a set of libraries and utilities to work with smart cards. Its
> main focus is on cards that support cryptographic operations, and facilitate
> their use in security applications such as authentication, mail encryption and
> digital signatures. OpenSC implements the standard APIs to smart cards, e.g.
> PKCS#11 API, Windows? Smart Card Minidriver and macOS CryptoTokenKit.
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>

I was about to apply, but unfortunately the build fails with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OPENSC=y
# BR2_TARGET_ROOTFS_TAR is not set

The failure is:

pkcs15-asepcos.c: In function ?asepcos_do_store_pin.isra.3?:
pkcs15-asepcos.c:307:33: error: ?akn? may be used uninitialized in this function [-Werror=maybe-uninitialized]
  auth_info->attrs.pin.reference = akn;
                                 ^
cc1: all warnings being treated as errors

Since you're going to send a new iteration for this, could you also
make sure to update the DEVELOPERS file in the same patch to add
yourself as a maintainer for this package ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
