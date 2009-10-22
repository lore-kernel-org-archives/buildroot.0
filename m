From: Dan Christensen <opello@opello.org>
Date: Wed, 21 Oct 2009 20:16:27 -0500
Subject: [Buildroot] [PATCH] Introduce support for using either e2fsimage of
	genext2fs
Message-ID: <6a52edd60910211816g12860f63xc2f70e1ee473a335@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I recently started using buildroot-2009.08 for a project using an AT91
series ARM CPU and wanted to boot off of an SD card. ?This was going
quite well until I ran into a few problems with U-Boot booting the
image I'd written to the SD card. ?It would boot fine off of FAT, and
an ext2 filesystem I'd created with mkfs.ext2, but not the filesystem
I copied to the card with dd.

So I started investigating the differences between the two images I
had with tune2fs, and it seems as though genext2fs makes a much
"simpler" ext2 filesystem than mkfs.ext2 does today. ?I'm not sure
about the history or if there is particular significance behind the
way it generates the filesystem, if there is any at all. ?This led me
to another tool called e2fsimage. ?e2fsimage seems to generate a
filesystem more like today's mkfs.ext2 generates.

The task of incorporating this additional tool into buildroot seemed
straight forward, but ultimately led to reorganizing the target/ext2/
directory quite a bit. ?I tried to follow the conventions that I'd
seen elsewhere, but wasn't sure what guidelines I should be following.

That being said, I would appreciate it if the following patch could be
reviewed for correctness. ?It worked for me (I could toggle between
genext2fs and e2fsimage) but I reworked quite a bit of the logic in
the makefiles and wouldn't be surprised if there were some bugs I
hadn't noticed.

Thanks, and I hope this is helpful.
Dan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2009.08-e2fsimage.patch
Type: application/octet-stream
Size: 20451 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091021/80321df8/attachment-0001.obj>
