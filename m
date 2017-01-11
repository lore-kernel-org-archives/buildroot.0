From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Jan 2017 00:07:00 +0100
Subject: [Buildroot] orange-pi build not working
In-Reply-To: <5876AA5C.2010904@sbcglobal.net> (paul's message of "Wed, 11 Jan
 2017 13:57:48 -0800")
References: <5876AA5C.2010904@sbcglobal.net>
Message-ID: <87wpe1i4bv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "paul" == paul  <paul.arssov@sbcglobal.net> writes:

 > Hi ,
 > I did pull the current 'buildroot' from git, and did a build with the
 > 2 configs provided for orange pi boards -
 > orangepi_pc_defcongfig
 > orangepi_one_defcongfig

 > Here are the results of testing for both types of builds -
 > 1. The hdmi supports is not enabled - nothing comes on screen

That is expected. There is currently no support in the mainline Linux
kernel for the HDMI output on the H3 SoC used on these boards.

> 2. The 'orange-pi' boards have dedicated serial port for boot logging;
 > the very first boot completes successfully - through the serial port I
 > am able to log-in as root, and run commands; for ex. 'uname -a'
 > returns '4.9.0' kernel;
 > 3. After first reboot, and any other boot the board reaches to the
 > point of starting the kernel but does not go any further.

 > Here is the output from the serial port logging -
 > ------------
 > 	..........
 > Scanning mmc 0:1...

 > Found U-Boot script /boot.scr

 > reading /boot.scr

 > 300 bytes read in 14 ms (20.5 KiB/s)

 > ## Executing script at 43100000

 > reading zImage

 > 3545792 bytes read in 189 ms (17.9 MiB/s)

 > reading sun8i-h3-orangepi-pc.dtb

 > 13056 bytes read in 24 ms (531.3 KiB/s)

 > ## Flattened Device Tree blob at 43000000

 >    Booting using the fdt blob at 0x43000000

 >    Using Device Tree in place at 43000000, end 430062ff



 > Starting kernel ...

So no output at all after this? It sounds like your kernel image has
somehow gotten corrupted. How did you reboot?

Does it work again if you rewrite sdcard.img to the SD card?

-- 
Bye, Peter Korsgaard
