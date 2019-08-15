From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 14:32:44 +0000
Subject: [Buildroot] [Bug 11341] Compiling qt5base-5.11.1 with libressl
 results in many 'was not declared in this scope' errors
In-Reply-To: <bug-11341-163@https.bugs.busybox.net/>
References: <bug-11341-163@https.bugs.busybox.net/>
Message-ID: <bug-11341-163-84C71mx8JA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11341

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Peter: building Qt5 (latest) with LibreSSL still fails, I can reproduce with
the current master and the following defconfig:

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
BR2_PACKAGE_QT5=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_PCRE=y
BR2_PACKAGE_PCRE_16=y
BR2_PACKAGE_PCRE_UTF=y
# BR2_TARGET_ROOTFS_TAR is not set

-- 
You are receiving this mail because:
You are on the CC list for the bug.
