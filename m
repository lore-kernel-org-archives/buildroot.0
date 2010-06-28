From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Jun 2010 09:22:00 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
In-Reply-To: <i08r0u$vue$1@dough.gmane.org> (Grant Edwards's message of "Mon, 
	28 Jun 2010 00:39:58 +0000 (UTC)")
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org> <87hbkp3sfz.fsf@macbook.be.48ers.dk>
	<i07kg9$jsp$1@dough.gmane.org> <20100627205714.507b5439@surf>
	<i08r0u$vue$1@dough.gmane.org>
Message-ID: <87fx0739lz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 >> Or a directory containing the hierarchy of files/directories to include
 >> in the initramfs.

 Grant> You're right.  I'd mis-read the help for the initramfs option.
 Grant> Doesn't that means you have to do one step of the build as root?
 Grant> I don't think I that's a viable option.

Either that, use fakeroot or use the cpio target.

 >>> > But yes, providing a way to generate the cpio archive without building a
 >>> > kernel would be nicer.
 >>> 
 >>> It works fine the way it is.  What's the reason for disabling the
 >>> buildign of a cpio file source list?
 >> 
 >> It was to fix bug #2119.

 Grant> I currently build with the initramfs option without having to build a
 Grant> kernel. Isn't there some way to fix bug 2119 without breaking a use
 Grant> case for existing users?

Yes, we could make the:

ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs

conditional on the kernel being built or not, but why are we having both
a cpio and initramfs target in the first place?

-- 
Bye, Peter Korsgaard
