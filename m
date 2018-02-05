From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Feb 2018 10:24:48 +0000
Subject: [Buildroot] [Bug 10726] Current libglib2.mk creates broken libglib2
 binary when using glibc 2.26
In-Reply-To: <bug-10726-163@https.bugs.busybox.net/>
References: <bug-10726-163@https.bugs.busybox.net/>
Message-ID: <bug-10726-163-z3LC4wxpli@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10726

--- Comment #1 from Matthias <porto.rio@gmx.net> ---
Please find attached a buildroot-config for a minimal qemu image which
reproduces the problem.
It was created and tested with the sequence below.

> cd tmp/
> tar xvf ../dl/buildroot-2017.11.2.tar.bz2
> make qemu_arm_versatile_defconfig
> make menuconfig
[activate eudev, glibc and udisks]
> make
> qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
# /usr/libexec/udisks-daemon 
Invalid byte sequence in conversion input

(udisks-daemon:112): GLib-CRITICAL **: g_error_new_literal: assertion 'message
!= NULL' failed
Segmentation fault

-- 
You are receiving this mail because:
You are on the CC list for the bug.
