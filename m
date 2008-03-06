From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 6 Mar 2008 08:51:33 +0100
Subject: [Buildroot] I really need some help
References: <1CD05B980C94AC408B37C82BBABAA3E60A91DDB1@mtsexchange.dc.multitech.prv>
Message-ID: <009f01c87f5e$e93ef5d0$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> I have been trying for the past 2+ months to successfully complete a
> buildroot session for a AT91SAM9260EK. I first installed buildroot via
> svn. Then I then did a "make at91sam9260pf_defconfig" to get baseline
> config files. 

The "pf" is for parallel flash and will not work on the EK since it does not have any parallel flash.
You should use "make at91sam9260dfc_defconfig" and a dataflash card for this board.

If you want to use the internal dataflash, then you need to fix U-Boot and at91bootstrap,
but it might be easier to download the binaries from www.linux4sam.org

Is "SuperModem-2.6.22.1" your project name?


For: "atd.c:498:2: error: #error "No mail command specified." error message:

If you do not need the "at" package, you can just disable it in menuconfig.
If you need it, then you need to look at "atd.c" somewhere
in the build_arm_wchar/at-3.1.10 to find out why you get the error message.

You should also ensure that the files 
/etc/shadow
/etc/passwd
/usr/share/udhcpc/default.script

are in your root file system.


> Then I ran a "make configured" in order to get a baseline
> codeset. I ran "make menuconfig" in the kernel directory in order to
> update the kernel config from what defconfig installed, otherwise I kept
> getting prompted about missing config info during the make. The only
> change I made to the kernel config was to add USB ACM support so I could
> talk to a USB wireless module. I have tried both 2.6.22.1 and 2.6.22.10
> kernels.



 
Best Regards
Ulf Samuelsson                ulf at atmel.com
