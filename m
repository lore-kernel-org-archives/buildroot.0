From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 13:33:17 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-XbKPdQ9tp6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #3 from bilge at scriptfusion.com ---
The version is specified in the ticket (2016.11).

Here is the config.

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
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="ghost at 0.11.3"
BR2_PACKAGE_OPENSSL=y
BR2_TARGET_ROOTFS_TAR_XZ=y

This uses the toolchain available from
https://github.com/Docker-nano/crosstool-NG/releases/download/2.0.0/x86_64-nano-linux-uclibc.tar.xz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
