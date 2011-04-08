From: Michael Burghart <mb@michaelburghart.de>
Date: Fri, 08 Apr 2011 11:20:57 +0200
Subject: [Buildroot] Making kernel?
In-Reply-To: <BANLkTi=B66V0kxNEWwGs1Pgus=Y4JycR4A@mail.gmail.com>
References: <1302088845-15193-1-git-send-email-a@awn.dk>	<20110406153502.13c6affd@surf>	<4D9D5B9D.8090508@michaelburghart.de>	<4D9D6EDE.7050004@daccii.it>	<4D9D6F6B.6000801@michaelburghart.de>	<4D9D7131.3090705@itechcon.it>	<4D9D73C1.1070408@michaelburghart.de>	<4D9D75DB.2010005@itechcon.it>	<4D9D775A.5010506@michaelburghart.de>	<4D9D7EE5.6060200@itechcon.it>	<4D9DE9B2.1000100@michaelburghart.de>	<4D9DFE83.3080602@itechcon.it>	<4D9EA40C.2020208@michaelburghart.de>	<4D9EB897.4050507@michaelburghart.de>	<4D9EB9FB.2060909@michaelburghart.de>
	<BANLkTi=B66V0kxNEWwGs1Pgus=Y4JycR4A@mail.gmail.com>
Message-ID: <4D9ED379.5090903@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Am 08.04.2011 09:50, schrieb bruce bushby:
> I run my buildroot from "/opt/buildroot" , for my platform "arm" the configs
> are sitting in:
> /opt/buildroot/output/build/linux-2.6.38-rc5/arch/arm/configs/
> 
> Have you tried "make menuconfig" then select your kernel header and kernel
> versions and then specify a kernel "defconfig" for example
> "sam9_l9260_defconfig"

the problem was that it complaine about a missing file which I was just
about to create. Anyway, I took the standard defconfig file and it worked:

Now I got:

- -rw-r--r-- 1 root root  4180960  8. Apr 10:57 bzImage
- -rw-r--r-- 1 root root 11706368  8. Apr 10:30 rootfs.cpio
- -rw-r--r-- 1 root root 14252032  8. Apr 10:56 rootfs.ext2
- -rw-r--r-- 1 root root    40776  8. Apr 10:57 rootfs.initramfs
- -rw-r--r-- 1 root root 18929664  8. Apr 10:56 rootfs.iso9660
- -rw-r--r-- 1 root root 12052480  8. Apr 10:30 rootfs.tar

;-)

Just need to find out how to put that all together to get a bootable
system..

Thanks to all for your help so far!!!!
- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNntN5AAoJEEMkp/gkis19ifcIAJB+uhhqmlzmr6ZM17yEM3Bh
wYhh3RSLqWo/O70qa5KEOryxa8Si0Q219JQTD4VzDDinMLProyocJ79cM0oWNU/y
du2X1uo5oVBYUwcoRa2mQQiaghEpf5TrrTPC+ht5lRTdlhnsJDtKBLV4ANI0kMhR
FqIaHc5ZIQot7d88MgkR7vQWm2jIVG4P7TmjEfc7EqayB49QjKwDnlHSzMtib66j
vUJl1aebDu038iPPuDW1kli3ksuGKz2FF7704L533JK+MDfouyFGrSCoZ77XjTBo
eD4h7jYnKjZBHTjZbQmYQl9efbBanU6BwxjgbCSVhSVhzqSu5mNVIrfRq1Ul3tE=
=Nkg5
-----END PGP SIGNATURE-----
