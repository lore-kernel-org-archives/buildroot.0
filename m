From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 13:24:17 +0000
Subject: [Buildroot] [Bug 10861] Package batman_adv Makefile is missing
 include header directory
In-Reply-To: <bug-10861-163@https.bugs.busybox.net/>
References: <bug-10861-163@https.bugs.busybox.net/>
Message-ID: <bug-10861-163-A4EsbgU79F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10861

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I'm sorry, but I can't reproduce this problem with the version of batman-adv in
Buildroot today (2017.0.1). I.e the following defconfig builds fine:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.02-891-g046c5e2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BATMAN_ADV=y
BR2_PACKAGE_BATMAN_ADV_DEBUG=y
BR2_PACKAGE_BATMAN_ADV_NC=y
BR2_PACKAGE_BATMAN_ADV_BATMAN_V=y
# BR2_TARGET_ROOTFS_TAR is not set

If I bump batman-adv to 2018.1, I indeed need this header path to be added in
the compiler flags. But not with the existing 2017.0.1, so I'm a bit surprised
how you ran into this issue.

Could you share an example Buildroot configuration (preferably minimal) that
exhibits the problem ? Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
