From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:55:31 +0200
Subject: [Buildroot] [PATCH] zeromq: disable for static linking
In-Reply-To: <20160826212821.GA21305@waldemar-brodkorb.de>
References: <20160826212821.GA21305@waldemar-brodkorb.de>
Message-ID: <20160827145531.4c02452b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 23:28:21 +0200, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/3aa73620d0f1afcc82de93069c9693e1ca755bb9
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I disagree with this change because it seems more like a toolchain
issue than the package really needing dynamic library support.

And indeed, the following static only configuration that includes zeromq
builds perfectly fine:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2016.08-rc1-4-g07e8d1c.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ZEROMQ=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
