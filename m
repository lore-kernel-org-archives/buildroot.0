From: Rosario Vumbaca <rosario.vumbaca@allieddata.com.au>
Date: Wed, 30 Aug 2017 10:07:31 +1000
Subject: [Buildroot] Genimage limitations?
Message-ID: <2f6624e0-deab-6420-995c-52c40bda9986@allieddata.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am a new user to Buildroot and I am creating an image for a 
RaspberryPi Compute Module on a custom carrier board.

It is well known that the RaspberryPi requires an "overlays" directory 
on the fat16/fat32 boot partition, with optional overlay files inside 
that directory.

For example: overlays/i2c-rtc.dtbo (a fairly fundamental overlay file!)

However

1. genimage doesn't seem to be able to create a directory on the target 
image

2. Or Alternatively to copy a single file to the target image with the 
directory structure intact.


- If I specify "rpi-firmware/overlays" in the genimage.cfg file, it 
keeps the directory tree intact but copies the entire overlays directory 
to the target image.

- If I specify the single file "rpi-firmware/overlays/i2c-rtc.dtbo" it 
copies only that file into the root, and fails to create the directory 
tree on the target image.

The behaviour of genimage in this regard seems to be undocumented and 
inconsistent.

I searched the mailing list archives, and read the (very minimal) 
genimage documentation but I can't find a solution, short of modifying 
the image after it is created.

Does anyone know if it is possible to do this with genimage, or if there 
is some other best practices technique that can be applied?

All I can think of is to mount and modify the vfat image after it is 
built, but this seems like a poor practice, especially when it could be 
done correctly when the image is first built.

Thanks,

Regards,

Rosario

-- 
Rosario Vumbaca
Electrical Engineer

Allied Data Systems Pty Limited
67/176 South Creek Road, Cromer NSW 2099 Australia
Tel. +61 2 9982 1510 | Fax. +61 2 9984 7807
E-mail: rosario.vumbaca at allieddata.com.au | Web: www.allieddata.com.au
