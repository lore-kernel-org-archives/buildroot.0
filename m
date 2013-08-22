From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 07:56:26 +0200
Subject: [Buildroot] initrd isn't needed for iso9660 when initramfs is
 used
In-Reply-To: <1377148166-21030-1-git-send-email-shmuelzon@gmail.com>
References: <1377148166-21030-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <5215A80A.9070006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 07:09, Assaf Inbal wrote:
> I'm not entirely sure of this patch.
> The problem is that, while initrd isn't needed when initramfs is used, the
> default menu for grub always includes the initrd directive and will fail to load
> when it's missing.

  Why do you want to use iso9660 with an initramfs? initramfs is only 
really useful for boat loaders that have a problem with passing an 
initrd, e.g. network boot.


  Regards,
  Arnout

> Perhaps we should have two grub menus? Or create it during build?
> Any ideas?
>
> Thanks,
> Assaf
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
