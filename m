From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 22:17:26 +0100
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509BD78A.8050908@macrium.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
Message-ID: <509C2166.8050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 17:02, Antony Vennard wrote:
> I am using grub, and have modified my grub command line to use:
>
> title LiveCD
> kernel /vmlinuz vga=0x317
> initrd /initramfs.bz2
>
> The kernel has bz2, xz and gzip initramfs support built in - so all good
> there. However, the kernel complains there's no root parameter. What
> should I specify for this?

  If you build a cpio rootfs, you shouldn't need any additional command line
parameters because the kernel never gets to mounting the root filesystem.  It
just runs the /init in the initramfs.

  Using a cpio rootfs should also solve your problems with the device nodes,
because we provide a /init that mounts devtmpfs explicitly.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
