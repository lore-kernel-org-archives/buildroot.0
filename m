From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Jul 2017 01:39:09 +0200
Subject: [Buildroot] [PATCH v5 3/5] fs/ext2: rename
	BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170704144729.19753-4-s.martin49@gmail.com> (Samuel Martin's
 message of "Tue, 4 Jul 2017 16:47:27 +0200")
References: <20170704144729.19753-1-s.martin49@gmail.com>
 <20170704144729.19753-4-s.martin49@gmail.com>
Message-ID: <87zicjzs9u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This change deprecates the ext2/3/4 rootfs size in blocks symbol in
 > favor of one that mimic the fs-size argument behavior of mkfs (i.e.
 > size in a human readable format accepting k, m, g or t suffix or their
 > upper-case variants).

 > +++ b/fs/ext2/ext2.mk
 > @@ -4,6 +4,11 @@
 >  #
 >  ################################################################################
 
 > +EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
 > +ifeq ($(BR2_TARGET_ROOTFS_EXT)-$(EXT2_SIZE),y-)
 > +$(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
 > +endif

Hmm, shouldn't that be BR2_TARGET_ROOTFS_EXT2 instead of
BR2_TARGET_ROOTFS_EXT?

-- 
Bye, Peter Korsgaard
