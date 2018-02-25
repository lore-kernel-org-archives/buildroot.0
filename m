From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Feb 2018 16:05:06 +0000
Subject: [Buildroot] [Bug 10796] Cannot generate cpio image without
 selecting CONFIG_BLK_DEV_INITRD
In-Reply-To: <bug-10796-163@https.bugs.busybox.net/>
References: <bug-10796-163@https.bugs.busybox.net/>
Message-ID: <bug-10796-163-HTAEZx1iQB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10796

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
(In reply to adyke from comment #2)
CONFIG_BLK_DEV_INITRD does not link the cpio image into the kernel. It only
makes it possible that the bootloader passes a cpio image to the kernel. To
link it into the kernel, the option CONFIG_INITRAMFS_SOURCE must be non-empty.

Buildroot will set this option when you enable the "initial RAM filesystem
linked into linux kernel". However, when you unset this option again, the
CONFIG_INITRAMFS_SOURCE is *not* removed from the kernel configuration. Indeed,
Buildroot has no way to know if this was added by Buildroot itself, or if it
was set by the user to refer to an externally-generated initramfs. So I guess
you are in this situation.

The CONFIG_BLK_DEV_INITRD option is on in most defconfig and just has a few KB
overhead, so it is not worth removing this from linux.mk IMO. Therefore, I'm
marking this as WONTFIX.

If you disagree, or if you see some other problem, feel free to reopen.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
