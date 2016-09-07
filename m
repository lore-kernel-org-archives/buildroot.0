From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Wed, 7 Sep 2016 09:42:39 +0200
Subject: [Buildroot] ISO format improvements
Message-ID: <20160907094239.64e13e29@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

We are building a custom ISO image as part of our build process, and
I'd like to contribute our 'improvements' upstream.

Major features of our ISO image:

- both EFI and BIOS boot system
- bootable as 'iso' (CD), or when dd'd to a usb stick
- has some data on the ISO itself (outside of the initramfs)

xorriso (as opposed to the currently used genisoimage) has builtin
support for all this.

About the EFI part, one need to build a FAT image with the necessary
stuff.

I'm sending this mail in order to plan together the various steps
necessary to achieve the upstream integration.

I see multiple tracks:

1. build a FAT EFI bootable image format (to be used as dependency later
   on)

   At the moment, we achieve that with the mkfs.vfat, mmd and mcopy. the
   image only contains syslinux.efi (+ ldlinux.e64 + config), the
   kernel, and the cpio image.

2. the switch to xorriso.

   I remember some time ago that it was a wished step anyway that
   would allow to get rid of cmake on the host-system (very slow to
   build).

3. some modification to the iso9660.mk to allow initramfs + 'read-only
   data' on the disc.

   Either call a script that copy the right data, or use an overlay
   directory, maybe a combination of both ?

What do you guys think ? Is that something that is wished at all ? Did
I missed some obvious ways to generate what I wish with the current
setup ? What's the best way to move on ?

Best Regards,
Ben.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160907/f171c920/attachment.asc>
