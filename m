From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2008 16:39:38 +0200
Subject: [Buildroot] built without large file support
In-Reply-To: <4874BD76.5030207@valcom.com> (Robert B. Williams's message of
	"Wed\, 09 Jul 2008 09\:30\:30 -0400")
References: <4874BD76.5030207@valcom.com>
Message-ID: <87k5fvw28l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert B Williams <rwilliams@valcom.com> writes:

Hi,

 Robert> Am trying to compile grub and it is complaining that large
 Robert> file support is turned off and that _FILE_OFFSET_BITS=64.  I
 Robert> guess one of these things needs to change....

Hmm, it looks like that should be handled by
grub.300-honor_UCLIBC_HAS_LFS.patch - Does that get applied?

 Robert>  From menuconfig I tried to enable large file support in the
 Robert> toolchain area....no affect.

You'll have to remove your *_build_* dirs and run make again to
rebuild your toolchain with large file support.

 Robert> 2nd:
 Robert> What do I need to do to boot linux with root filesystem in flash?

mtd + filesystem support in your kernel and then enable
cramfs/squashfs/jffs2 images under target.

-- 
Bye, Peter Korsgaard
