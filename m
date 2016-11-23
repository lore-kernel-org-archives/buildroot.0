From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Nov 2016 12:37:40 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-Hcgn6pIrv8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #13 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I just tested the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBI=y

and built it under a Fedora 24 machine, and it built just fine, with Buildroot
2016.08.1 (which uses fakeroot)

So I'm not sure why we have moved to pseudo because of this bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
