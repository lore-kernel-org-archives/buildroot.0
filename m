From: sproon <sproon@hotmail.com>
Date: Tue, 23 Feb 2010 02:03:10 -0800 (PST)
Subject: [Buildroot]  E-Ink AM300 development Board
Message-ID: <27700904.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I am new to buildroot and I have been trying to figure out exactly how to
utilize the program properly for a while now. I am currently stuck on trying
to get the buildroot environment to make the linux kernel and drivers for
the am300 development board. Support for the board has been available for
some time and I am able to select the architecture, processor and
developement board on both the buildroot menuconfig and the
linux26-menuconfig.

When I try to run make it gives me the following error:

ging/include --sysroot=/home/sproon/buildroot/output/staging/ -isysroot
/home/sproon/buildroot/output/staging -mtune=xscale -march=armv5te
-mabi=aapcs-linux -msoft-float"	\
		LDFLAGS="-L/home/sproon/buildroot/output/staging/lib
-L/home/sproon/buildroot/output/staging/usr/lib
--sysroot=/home/sproon/buildroot/output/staging/"	\
		 \
		/usr/bin/make -j1 -C /home/sproon/buildroot/output/build/u-boot-2009.11	\
		am300_board_config
make[1]: Entering directory
`/home/sproon/buildroot/output/build/u-boot-2009.11'
make[1]: *** No rule to make target `am300_board_config'.  Stop.
make[1]: Leaving directory
`/home/sproon/buildroot/output/build/u-boot-2009.11'
make: *** [/home/sproon/buildroot/output/build/u-boot-2009.11/.configured]
Error 2

It seems that this stems from the BR2_TARGET_UBOOT_BOARDNAME option from the
das uboot option under kernel selection of the main menuconfig. At first I
thought that it just needed any name at all so I called it am300_board but
appartently this is not the case.

So my question is, what should I put as my board name, and how do I look
such a thing up in the future development process?

Thanks for any help,
Sproon
-- 
View this message in context: http://old.nabble.com/E-Ink-AM300-development-Board-tp27700904p27700904.html
Sent from the BuildRoot mailing list archive at Nabble.com.
