From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 16:12:38 +0100
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
Message-ID: <509BCBE6.8060505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 10:56, Antony Vennard wrote:
> I'm not using initramfs - I'm using the ISO 9660 target which as far as I can see produces an initrd, a kernel and an
> ext2 raw image which it mounts as a ramdisk.

  Right!  I completely forgot that!  The iso9660 target is currently broken
(and has been for quite some time already).  For the time being, you have to
manually copy fs/cpio/init to the target (either copy it to $1/init in the
post-build script, or copy it to skeleton/init and do a clean build).

  Or, you could modify fs/iso9660/iso9660.mk and Config.in to use a cpio
archive as rootfs instead of an ext2.  If you do that and it works, please
post a patch for inclusion in buildroot, thanks!

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
