From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Oct 2016 13:51:58 +0000
Subject: [Buildroot] [Bug 9366] no link rootfs.ext4 -> rootfs.ext2
In-Reply-To: <bug-9366-163@https.bugs.busybox.net/>
References: <bug-9366-163@https.bugs.busybox.net/>
Message-ID: <bug-9366-163-BkI7vuZVqr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9366

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
You set BR2_TARGET_ROOTFS_EXT2_GZIP=y, so the symlink will be rootfs.ext4.gz ->
rootfs.ext2.gz instead of rootfs.ext4 -> rootfs.ext2. If you make such a change
you have to adapt the post-image script.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
