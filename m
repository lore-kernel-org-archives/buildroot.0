From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 15:18:09 +0000 (UTC)
Subject: [Buildroot] [Bug 8036] alsa-lib headers problem that prevents to
 compile alsa dependent projects
In-Reply-To: <bug-8036-163@https.bugs.busybox.net/>
References: <bug-8036-163@https.bugs.busybox.net/>
Message-ID: <20150603151809.81CAF81E12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8036

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-03 15:18:08 UTC ---
The Buildroot .config you provided does not have alsa-utils enabled, so it is
not possible that you got this error.

Also, can you confirm that you get the error after a full "make clean all"
cycle?

I've just tried building the following defconfig, which includes the amidi
alsa-utils, and it builds fine:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ALSA_UTILS=y
# BR2_PACKAGE_ALSA_UTILS_ALSACTL is not set
# BR2_PACKAGE_ALSA_UTILS_ALSAMIXER is not set
BR2_PACKAGE_ALSA_UTILS_AMIDI=y
# BR2_TARGET_ROOTFS_TAR is not set

Can you give more details?

Also, please reproduce with the official Buildroot, without any patches. We
cannot debug modified versions of Buildroot for which we don't have the source
code.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
