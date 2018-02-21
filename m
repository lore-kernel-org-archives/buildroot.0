From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Feb 2018 22:35:10 +0000
Subject: [Buildroot] [Bug 10796] Cannot generate cpio image without
 selecting CONFIG_BLK_DEV_INITRD
In-Reply-To: <bug-10796-163@https.bugs.busybox.net/>
References: <bug-10796-163@https.bugs.busybox.net/>
Message-ID: <bug-10796-163-yfNxlUBGbU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10796

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Indeed, linux/linux.mk contains:

        $(if $(BR2_TARGET_ROOTFS_CPIO),
                $(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))

Which forces CONFIG_BLK_DEV_INITRD to be set when you're generating a cpio
image of the filesystem.

What is your use-case for generating a cpio image, but not enabling
CONFIG_BLK_DEV_INITRD ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
