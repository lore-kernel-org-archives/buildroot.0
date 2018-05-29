From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 20:47:36 +0200
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <1527615682.2053.4.camel@rovoreed.com> (Mike Davies's message of
 "Tue, 29 May 2018 18:41:22 +0100")
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com>
 <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com>
Message-ID: <87po1e5mev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Davies <busybox_mail@rovoreed.com> writes:

 > Thanks for the reply.
 > Exactly the same error in 2018.05-rc2.

 > I have not tried it anything more recent than buildroot-2017.08 (so
 > that's a long time ago)

 > I am surprised no-one else has picked up on this.

 > If I select Python as a package to install on my target, then it builds
 > OK - but I don't want Python on my target.

 > For now, I guess a workaround is to select Python, and delete it in a
 > pre-image script.

That is odd. The presence or not of python for the target shouldn't have
any effect on host-python. You do not mean python3 for the target, do
you?


 >> ?> ca-certificates fails to build. Though I see there is some
 >> discussion
 >> ?> on the list, I'm unsure if it is connected to the build failing.
 >> ?> My real build needs a lot more stuff, but it can be trimmed down
 >> to
 >> ?> this for it to fail...
 >> 
 >> ?> tar -xzf /home/mike/Downloads/buildroot-2018.05-rc3.tar.gz
 >> ?> cd b*3
 >> ?> make raspberrypi3_64_defconfig
 >> ?> make menuconfig
 >> ?> Target Packages->Libraries->Crypto->CA Certificates
 >> ?> make

I tried it here and it builds without issues:

..
>>>   Executing post-image script board/raspberrypi3-64/post-image.sh
vfat(boot.vfat): adding file 'bcm2710-rpi-3-b.dtb' as 'bcm2710-rpi-3-b.dtb' ...
vfat(boot.vfat): adding file 'bcm2837-rpi-3-b.dtb' as 'bcm2837-rpi-3-b.dtb' ...
vfat(boot.vfat): adding file 'rpi-firmware/bootcode.bin' as 'rpi-firmware/bootcode.bin' ...
vfat(boot.vfat): adding file 'rpi-firmware/cmdline.txt' as 'rpi-firmware/cmdline.txt' ...
vfat(boot.vfat): adding file 'rpi-firmware/config.txt' as 'rpi-firmware/config.txt' ...
vfat(boot.vfat): adding file 'rpi-firmware/fixup.dat' as 'rpi-firmware/fixup.dat' ...
vfat(boot.vfat): adding file 'rpi-firmware/start.elf' as 'rpi-firmware/start.elf' ...
vfat(boot.vfat): adding file 'Image' as 'Image' ...
hdimage(sdcard.img): adding partition 'boot' (in MBR) from 'boot.vfat' ...
hdimage(sdcard.img): adding partition 'rootfs' (in MBR) from 'rootfs.ext4' ...
hdimage(sdcard.img): writing MBR

What Linux distribution/version are you using?

-- 
Bye, Peter Korsgaard
