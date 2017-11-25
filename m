From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:50:47 +0100
Subject: [Buildroot] [PATCH] utils/diffconfig: add diffconfig utility
In-Reply-To: <20171104203644.4045-1-marcus.folkesson@gmail.com>
References: <20171104203644.4045-1-marcus.folkesson@gmail.com>
Message-ID: <20171125135047.503d4fda@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Nov 2017 21:36:44 +0100, Marcus Folkesson wrote:
> Diffconfig is a simple utility for comparing two configuration files.
> See usage in the script for more info.
> 
> Borrowed from the Linux kernel source code and adapted to Buildroot.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  DEVELOPERS       |   3 ++
>  utils/diffconfig | 136 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 139 insertions(+)
>  create mode 100755 utils/diffconfig

I've applied to next. However, I must say I've personally not be very
convinced by the output of this tool. If you generate the .config
corresponding to an empty defconfig on one side, and the following
defconfig on the other side:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BELLAGIO=y
BR2_PACKAGE_FFMPEG=y
# BR2_TARGET_ROOTFS_TAR is not set

You will get a very, very, very noisy output with "diffconfig". And
comparately, the diff between the defconfigs is a lot more readable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
