From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 11 Apr 2007 17:01:44 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/devicetarget/device/x86/i386 too etc...
References: <20070411082200.973434808C@busybox.net>
Message-ID: <01ce01c77c4b$27966e70$254565d5@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While it is nice to have these things, I propose that we put the 
linux stuff in a subdirectory of its own.

I.E:  targets/linux

which should include a     "Config.in" and a "Makefile.in"

Also I think you do not want to store the LINUX26_KCONFIG in just
any place in your file system.
Is it not better to have the configurable, but normally  in the board directory? 

A more flexible way would be to have the default value to be

$(BR2_BOARD_PATH)/.config

I.E: 

config BR2_PACKAGE_LINUX_KCONFIG
 string ".config file"
 depends on BR2_PACKAGE_LINUX
 default "$(BR2_BOARD_PATH)/linux26.config"
 help
   kernel's .config to use  

We should also consider running
"make <board>_defconfig"
on the kernel as an option to providing the kconfig file.


Will send a patch which will do just this, (but not your latest patch)

Best Regards
Ulf Samuelsson
