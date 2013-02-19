From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Feb 2013 13:03:10 +0100
Subject: [Buildroot] [PATCH 2/4] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <512323E4.7000901@mind.be> (Arnout Vandecappelle's message of
 "Tue, 19 Feb 2013 08:04:04 +0100")
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <1a995bdbc65141cf4e8a540c41cb56f4a43fba5f.1361142401.git.yann.morin.1998@free.fr>
 <512323E4.7000901@mind.be>
Message-ID: <87wqu4h5oh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> if BR2_TARGET_ROOTFS_EXT2
 >> 
 >> +choice
 >> +	bool "ext generation"

 Arnout>  Given the way it appears in menuconfig, I think this will be hard to
 Arnout> understand for many users. Perhaps "ext generation (ext2, ext3 or
 Arnout> ext4)".

Or simply ext variant?

 >> +	default BR2_TARGET_ROOTFS_EXT2_2

 Arnout>  Although this matches the current default, doesn't it make
 Arnout> more sense to "bump" to ext4?

Possibly. It would break existing configs though.

 >> +config BR2_TARGET_ROOTFS_EXT2_2
 >> +	bool "ext2"
 >> +
 >> +config BR2_TARGET_ROOTFS_EXT2_3
 >> +	bool "ext3"
 >> +	select BR2_PACKAGE_HOST_E2FSPROGS

 Arnout>  We don't usually select the host package. On the other hand, the
 Arnout> support for user-selectable host packages is pretty recent, so we
 Arnout> don't have a real tradition for this.

 Arnout>  Peter?

I would argue that we should keep kconfig and makefiles consistent when
possible, so when we have a user selectable host package (kconfig
symbol), we should select it.

-- 
Bye, Peter Korsgaard
