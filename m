From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 13:37:30 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-UVRmzaGps7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #3 from bilge at scriptfusion.com ---
Sorry, I don't know how to do run a rootfs without Docker. You can download the
compiled product from
https://github.com/Docker-nano/Node.js/blob/product/6.7/rootfs.tar.xz

If you prefer to build it yourself, here is the configuration.

BR2_x86_64=y
BR2_WGET="wget --passive-ftp -nd -t 3 -nv"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(HOME)/toolchain"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-nano-linux-uclibc"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="Docker-nano"
BR2_TARGET_GENERIC_ISSUE="Docker nano"
BR2_INIT_NONE=y
# BR2_TARGET_GENERIC_GETTY is not set
BR2_ROOTFS_OVERLAY="rootfs_overlay"
BR2_ROOTFS_POST_BUILD_SCRIPT="./post_build.sh"
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NODEJS=y
BR2_PACKAGE_NODEJS_NPM=y
BR2_TARGET_ROOTFS_TAR_XZ=y

This uses the toolchain available from
https://github.com/Docker-nano/crosstool-NG/releases/download/2.0.0/x86_64-nano-linux-uclibc.tar.xz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
