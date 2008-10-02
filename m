From: suffecool at comcast.net <suffecool@comcast.net>
Date: Thu, 02 Oct 2008 19:21:47 +0000
Subject: [Buildroot] menu configuration questions
Message-ID: <100220081921.29321.48E51F4B00041F6B0000728922007621940401010C0A00009A9C@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am new buildroot user and have a question regarding the configuration files.  I'm building for an ARM at91sam9260ek platform, but this should not matter.

To access/modify the main buildroot config options, I typed "make menuconfig".

To access/modify the uClibc config options, I typed "make uclibc-menuconfig".

To access/modify the busybox config options, I typed "make busybox-menuconfig".

To access/modify the linux config options, I typed "make linux26-menuconfig".

If this is NOT the correct way to do so, please let me know.

Okay, moving on.  Doing those four commands creates/overwrites the following files:

1.  buildroot/.config
2.  buildroot/toolchain_build_arm/uClibc-0.9.29/.config
3.  buildroot/project_build_arm/uclibc/busybox-1.12.1/.config
4.  buildroot/project_build_arm/uclibc/linux-2.6.24/.config

However, the top level buildroot .config is initially set so it points to the following config files:

uClibc:  points to toolchain/uClibc/uClibc-0.9.29.config  (but this can be modified)
busybox:  points to package/busybox/busybox-1.11.x.config  (but this can be modified)
kernel:  points to .config  (I think; see below)

I'm not really sure about the kernel config file.  From the buildroot Kernel configuration options menu, the first option shown is set to ".config".  No path is specified. What kernel .config file is it referencing?  The one located at "buildroot/project_build_arm/uclibc/linux-2.6.24/.config"?  Somewhere else?

The second option also appears to set a config file.  It is initially set to:
$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config

Based on my platform, this expands to:
target/device/Atmel/at91sam9260ek/at91sam9260ek-linux-2.6.24.config

That file does not exist.  I see at91sam9261ek and at91sam9263ek directories, but no 9260ek.  So it appears that second option points to a non-existent file.


One of my main questions is this: if typing "make uclibc-menuconfig" modifies the uClibc ".config" file, yet the master buildroot .config is referencing "toolchain/uClibc/uClibc-0.9.29.config", then none of my changes are being listened to.  It seems to me that typing "make uclibc-menuconfig" should modify the file referenced in the master buildroot .config, not the other one which has no effect.

The same thing happens with busybox.  Typing "make busybox-menuconfig" modifies the ".config" found in project_build_arm/uclibc/busybox-1.12.1, but the master buildroot .config is set to use the one in package/busybox/busybox-1.11.x.config.

I don't mind storing my uClibc, busybox, and kernel .config files at a different location if needed.  I just want to be able to access their additional features easily via buildroot.

Any guidance on this configuration headache would be appreciated.

--Kevin S.
