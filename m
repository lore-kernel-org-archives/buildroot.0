From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Feb 2017 20:38:03 +0000
Subject: [Buildroot] [Bug 9651] libxcb-1.12 built Error
In-Reply-To: <bug-9651-163@https.bugs.busybox.net/>
References: <bug-9651-163@https.bugs.busybox.net/>
Message-ID: <bug-9651-163-MNMPuwsahD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9651

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I have successfully built the following defconfig (based on yours):

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_HOSTNAME="skamilinux"
BR2_TARGET_GENERIC_ISSUE="Welcome to SkamiLinux !"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US hu hu_HU"
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBERATION=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB=y
BR2_PACKAGE_LIBDRM=y
BR2_PACKAGE_LIBDRM_INTEL=y
BR2_PACKAGE_LIBDRM_RADEON=y
BR2_PACKAGE_LIBDRM_AMDGPU=y
BR2_PACKAGE_LIBDRM_NOUVEAU=y
BR2_PACKAGE_LIBDRM_VMWGFX=y
BR2_PACKAGE_MTDEV=y
BR2_PACKAGE_LIBEVDEV=y
BR2_PACKAGE_LIBFFI=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_PACKAGE_PCRE=y
BR2_PACKAGE_PCRE_UCP=y
BR2_PACKAGE_GOOGLEFONTDIRECTORY=y
BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_GZIP=y
BR2_TARGET_ROOTFS_SQUASHFS=y
# BR2_TARGET_ROOTFS_TAR is not set

So I believe your error is most likely due to a partial build.

Can you double check that you still get this error after doing "make clean all"
? Thanks.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
