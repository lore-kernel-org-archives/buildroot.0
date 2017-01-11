From: paul <paul.arssov@sbcglobal.net>
Date: Wed, 11 Jan 2017 13:57:48 -0800
Subject: [Buildroot] orange-pi build not working
Message-ID: <5876AA5C.2010904@sbcglobal.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ,

I did pull the current 'buildroot' from git, and did a build with the 2 
configs provided for orange pi boards -
orangepi_pc_defcongfig
orangepi_one_defcongfig

Here are the results of testing for both types of builds -
1. The hdmi supports is not enabled - nothing comes on screen
2. The 'orange-pi' boards have dedicated serial port for boot logging; 
the very first boot completes successfully - through the serial port I 
am able to log-in as root, and run commands; for ex. 'uname -a' returns 
'4.9.0' kernel;
3. After first reboot, and any other boot the board reaches to the point 
of starting the kernel but does not go any further.

Here is the output from the serial port logging -
------------
	..........
Scanning mmc 0:1...

Found U-Boot script /boot.scr

reading /boot.scr

300 bytes read in 14 ms (20.5 KiB/s)

## Executing script at 43100000

reading zImage

3545792 bytes read in 189 ms (17.9 MiB/s)

reading sun8i-h3-orangepi-pc.dtb

13056 bytes read in 24 ms (531.3 KiB/s)

## Flattened Device Tree blob at 43000000

    Booting using the fdt blob at 0x43000000

    Using Device Tree in place at 43000000, end 430062ff



Starting kernel ...
----------------

Questions -
1. Why is the hdmi port not enabled?
2. Why does it boot completely only time, and then stops at 'Starting 
kernel ...' ?


Thanks,
Paul.
