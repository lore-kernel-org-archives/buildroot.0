From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Feb 2018 21:38:06 +0000
Subject: [Buildroot] [Bug 10786] Linux fails to build unless make
 linux-menuconfig is run first
In-Reply-To: <bug-10786-163@https.bugs.busybox.net/>
References: <bug-10786-163@https.bugs.busybox.net/>
Message-ID: <bug-10786-163-gFp6rNHVTE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10786

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
You have CONFIG_INITRAMFS_SOURCE defined in your linux_defconfig, but you have
not enabled initramfs support in Buildroot. So obviously this cannot work.

If you enable initramfs support in Buildroot, then Buildroot will make sure to
have a dummy rootfs.cpio when the kernel is first built, will make sure to set
CONFIG_INITRAMFS_SOURCE to the correct value, and will rebuild the kernel image
at the end of the build with the final rootfs.cpio.

Therefore, there is no bug per se: there is just a mis-use of the initramfs
support.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
