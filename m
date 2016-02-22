From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 22:56:31 +0100
Subject: [Buildroot] [PATCH] zmqpp: bump to version 4.1.2
In-Reply-To: <56CB4A82.6000506@zacarias.com.ar>
References: <1455800827-19066-1-git-send-email-gustavo@zacarias.com.ar>
 <20160220001405.79f8eda5@free-electrons.com>
 <56CB4A82.6000506@zacarias.com.ar>
Message-ID: <20160222225631.6db1588a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Mon, 22 Feb 2016 14:50:58 -0300, Gustavo Zacarias wrote:

> Care to provide a defconfig for this?
> I've tested the three possible combinations (static, shared, both) 
> without issue.

Sure, I'm testing:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ZMQPP=y
# BR2_TARGET_ROOTFS_TAR is not set

I'm testing on today's next branch (at
d86a987a8f6aa445ec11eaa00d14d5177ae45166) + your zmqpp bump.

I've re-done the build to verify, and I'm still seeing the same build
issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
