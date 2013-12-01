From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 01 Dec 2013 01:59:59 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
 install firmware files in target/boot/
In-Reply-To: <20131129190153.GA4639@free.fr>
References: <20131128205515.GB3337@free.fr>
 <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
 <20131129092715.24d2b199@skate> <20131129190153.GA4639@free.fr>
Message-ID: <529A8A0F.7010905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/13 20:01, Yann E. MORIN wrote:
> 3) bootloaders for case (b) will have to:
>     (a) install their files, and a manifest of those files, in a known
>         location
>     (b) that location should be platform-agnostic, so that genimages will
>         find it; $(BINARIES_DIR)/boot-files/  looks like a good candidate.
>
> genimages should be prepared to generate a partition with a filesystem
> filled by copying files listed in a manifest file.
> (Relatively easy, I think.)

  Yeah, it's just adding a flag that tells genimages that fs_root is 
relative to the images directory instead of the target directory.

  I think it is safe to assume that the bootloaders of this type will put 
their output files in a directory, rather than flat in the images 
directory. So a manifest is not really needed. Although... If you want to 
create a partition with SPL + U-Boot + uImage, you 'll have to specify 
these three explicitly.

  Regards,
  Arnout

>
> The kind of bootloaders I know that fit in this category are
> rpi-firmware and grub. There may have others.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
