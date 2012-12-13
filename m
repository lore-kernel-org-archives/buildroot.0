From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 22:37:19 +0100
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <000901cdd883$889a6e70$99cf4b50$@co.uk>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk>
Message-ID: <50CA4A8F.1050002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/12 17:12, Ted Wood wrote:
> OK Next question:
>
> I?ve built a kernel image and a file system image.
>
> I?ve manually installed Grub 2 and a grub.cfg file which looks like this:
>
> menuentry ?Buildroot?
>
> {
>
> set root=?(hd0,msdos1)?
>
> echo ?Loading Kernel?)
>
> linux /boot/bzimage
>
> echo ?Loading Root FS?
>
> initrd /boot/rootfs.ext2
>
> }

  For an initrd, you should use a cpio filesystem rather than ext2:

- ext2 adds overhead that is completely unnecessary for a ramdisk;

- if you use anything else than static device management, the devtmps
will not be mounted automatically by the kernel; the cpio filesystem
adds a /init script that mounts it for you.

  I thought this was now clearly explained in the manual, is it not?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
