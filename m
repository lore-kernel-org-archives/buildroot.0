From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 12:38:51 +0200
Subject: [Buildroot] [PATCH] fs/ext2: explicitly set a NULL UUID
In-Reply-To: <1369737215-11993-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 28 May 2013 12:33:35 +0200")
References: <1369737215-11993-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ip23bd8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> "tune2fs -U clear" creates an invalid filesystem, that fsck.ext2
 Yann> whines about later:

 Yann>     $ make rootfs-ext2
 Yann>     [--SNIP--]

 Yann>     $ ./host/usr/sbin/fsck.ext4 images/rootfs.ext2
 Yann>     e2fsck 1.42.7 (21-Jan-2013)
 Yann>     Filesystem did not have a UUID; generating one.
 Yann>     images/rootfs.ext2: clean, 4616/5120 files, 53171/131072 blocks

 Yann>     $ ./host/usr/sbin/fsck.ext4 -f images/rootfs.ext2
 Yann>     e2fsck 1.42.7 (21-Jan-2013)
 Yann>     One or more block group descriptor checksums are invalid.  Fix<y>? yes
 Yann>     Group descriptor 0 checksum is 0x4131, should be 0x8bdb.  FIXED.
 Yann>     [--SNIP--]

 Yann> So we set an explicitly NULL UUID instead.

Committed, thanks.

-- 
Bye, Peter Korsgaard
