From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Sep 2012 01:10:43 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <CAAfyv35PHKbCht56tRcswvT4Gyy57e_0v0uSnGnk2mvjQ-zR=Q@mail.gmail.com>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <5058EF56.3070208@mind.be>
 <CALR4fEJzZPa+CAeCvuFrFZoNwO562+6_LDEM8xP2a15dy1YJuA@mail.gmail.com>
 <CAAfyv365AxzAfJSP3rnhbgKoDKMq19AyUnZkkSW54uerXCOYTg@mail.gmail.com>
 <505A21D6.7060808@mind.be>
 <CAAfyv36do0+Cf+ZYyj67Sypt13UzfM2TRyx9-Pwq_28fVgsWsw@mail.gmail.com>
 <505A390C.7080704@mind.be>
 <CAAfyv35PHKbCht56tRcswvT4Gyy57e_0v0uSnGnk2mvjQ-zR=Q@mail.gmail.com>
Message-ID: <505A50F3.1060605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 23:50, Belisko Marek wrote:
> I would prefer to keep boot.tar.gz format. Imagine somebody who build
> RPI config and in images directory he will have 6 files. How he should
> know without reading
> elinux.org or rpi webpage what and which should be copied where ? With
> boot.tar.gz we can keep it in
> consistent format and if the name will be boot.tar.gz then average
> user will understand
> this should go to boot SD card partition. But this is just my opinion.

  Compare to any other defconfig: it will produce a number of files in the images
directory.  For instance, a typical TI OMAP will have MLO, u-boot.img, uImage
and rootfs.ext2.  The first three should go into the FAT partition, the last
on into an ext2 partition.  For RPi it's the same thing, except that the
number of images is a bit larger.

  That said, it's a good idea to have a readme.txt in the board directory to
explain how to put everything into a bootable image.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
