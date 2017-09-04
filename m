From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 23:50:55 +0200
Subject: [Buildroot] Orange Pi HDMI to VGA output
In-Reply-To: <CAOJD9H+8eSuY_Rm+E-yzCOTSe2KjohLz28fcvH1tv6RDLHefkg@mail.gmail.com>
 (apin prastya's message of "Sun, 13 Aug 2017 21:32:06 +0700")
References: <CAOJD9H+8eSuY_Rm+E-yzCOTSe2KjohLz28fcvH1tv6RDLHefkg@mail.gmail.com>
Message-ID: <878thum8u8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "apin" == apin prastya <apin.klas@gmail.com> writes:

 > Hello All,
 > I have successfully build the orangepi_one_defconfig. And able to boot and
 > output to serial console.
 > Its been a while I struggle with the HDMI output (I am using HDMI to VGA
 > converter) and no success to make the console output to HDMI.

 > Here what i have done so far :

 >    1. enable sunxi board on buildroot config and set the .fex to
 >    a20/orangepi.fex (attached orangepi.fex)
 >    2. modify the boot.cmd to : setenv bootargs console=ttyS0,115200
 >    console=tty0 console=tty1 hdmi.audio=EDID:0
 >    disp.screen0_output_mode=1280x720p60 root=/dev/mmcblk0p2 rootwait panic=10

 > Anyone has clue to enable HDMI output please let me know.
 > Thanks,

The orangepi_one_defconfig uses the mainline Linux kernel, which doesn't
support the HDMI output yet or use .fex files, so this won't work.

-- 
Bye, Peter Korsgaard
