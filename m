From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 07:53:04 +0100
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509BDDDD.3040002@petroprogram.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
 <509BDDDD.3040002@petroprogram.com>
Message-ID: <50A1EE50.4010008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/11/12 17:29, Stefan Fr?berg wrote:
> If you ever want to use the maximum compression method supported by
> modern kernels (XZ compression)
> then change that initramfs generation command to this:
>
> find .  -not \( -path "./boot" -prune \) -print0 | cpio --null -ov --format=newc
>   | xz --check=crc32>  /livecd/initramfs.xz
>
> Without that --check=crc32 parameter you won't be able to boot
> XZ-compressed initramfs.

  It would be good to have this in buildroot.  Care to add a config option
BR2_TARGET_ROOTFS_CPIO_XZ?  Using host-xz, of course, since not all systems
have xz installed.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
