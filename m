From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Dec 2011 10:01:13 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <201112131818.53512.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 13 Dec 2011 18:18:53 +0100")
References: <4EDE32C3.7020400@neotion.com> <201112131818.53512.arnout@mind.be>
Message-ID: <87ehw7msrq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Tuesday 06 December 2011 16:20:35 Emmanuel BOUAZIZ wrote:
 >> On the PXE server, I put these kernel parameters: append vga=0x305 fbcon=scrollback:4096k initrd=rootfs.squashfs

 Arnout>  Hm, my assumption that you would only use an initramfs with a 
 Arnout> cpio archive was clearly wrong.  So perhaps we should execute the 
 Arnout> ROOTFS_CPIO_ADD_INIT hook unconditionally for all filesystems?

This is initrd, not initramfs (which isn't really recommended anymore).
As far as I can see, devtmpfs does get mounted for initrd's
(init/do_mounts.c:prepare_namespace()).

-- 
Bye, Peter Korsgaard
