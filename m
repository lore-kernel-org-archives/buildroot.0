From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 21:15:30 +0000
Subject: [Buildroot] [Bug 10341] gdb install of py files when using
 buildroot toolchain includes build path
In-Reply-To: <bug-10341-163@https.bugs.busybox.net/>
References: <bug-10341-163@https.bugs.busybox.net/>
Message-ID: <bug-10341-163-ykC77kH36j@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10341

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Could you provide a defconfig that exhibits the problem?

The following defconfig builds host-gdb with Python support, but I don't have
this auto-load folder in host/share/gdb/.

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_PYTHON=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

-- 
You are receiving this mail because:
You are on the CC list for the bug.
