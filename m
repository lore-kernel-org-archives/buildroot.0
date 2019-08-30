From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Aug 2019 10:12:39 +0000
Subject: [Buildroot] [Bug 12156] buildroot-2019.08-rc3 does not build for Pi
 Zero W
In-Reply-To: <bug-12156-163@https.bugs.busybox.net/>
References: <bug-12156-163@https.bugs.busybox.net/>
Message-ID: <bug-12156-163-oOTAl1LnjQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12156

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Are you sure this is a clean build? I cannot reproduce it here:

INFO: vfat(boot.vfat): adding file 'bcm2708-rpi-0-w.dtb' as
'bcm2708-rpi-0-w.dtb' ...
INFO: vfat(boot.vfat): cmd: "MTOOLS_SKIP_CHECK=1 mcopy -bsp -i
'/home/peko/source/buildroot/output-rpi/images/boot.vfat'
'/home/peko/source/buildroot/output-rpi/images/bcm2708-rpi-0-w.dtb' '::'"
(stderr):
INFO: vfat(boot.vfat): adding file 'rpi-firmware/bootcode.bin' as
'rpi-firmware/bootcode.bin' ...

And the file is there as it should be:
find -name bcm2708-rpi-0-w.\*
./build/linux-custom/arch/arm/boot/dts/bcm2708-rpi-0-w.dtb
./build/linux-custom/arch/arm/boot/dts/bcm2708-rpi-0-w.dts
./build/linux-headers-custom/arch/arm/boot/dts/bcm2708-rpi-0-w.dts
./images/bcm2708-rpi-0-w.dtb
git describe                                                                    
2019.08-rc3-3-g268bdf0360

-- 
You are receiving this mail because:
You are on the CC list for the bug.
