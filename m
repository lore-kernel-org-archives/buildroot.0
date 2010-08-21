From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Aug 2010 18:46:57 +0200
Subject: [Buildroot] Stuff for the next release (2010.11)
Message-ID: <20100821184657.6f49a80f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just in order to avoid any duplication of work, here's what I've
started to work on for 2010.11, the future Buildroot release (once
2010.08 is released by the end of this month by Peter) :

 * Clean up all the target/device mess

   The general idea is that there will no longer be any configuration
   option for each particular board. Instead, we will just use
   defconfig files for each board that we support.

   The defconfig files will be minimized. Instead of having values for
   all options, only the non-default values will be stored. So
   basically, for a board defconfig, this boils down to: architecture
   definition, bootloader configuration and kernel configuration. Even
   the set of packages will not be considered part of a board defconfig
   (since a particular board can be used for various applications,
   requiring different set of packages).

   The support for all supported boards will be cleaned up and updated,
   with the goal of minimizing the number of kernel patches and target
   skeletons we are carrying.

   A new directory, boards/ will replace target/device. It will be used
   to store kernel and bootloader patches, or target skeletons.

 * Removed the mini_device_table thing.

 * Updated the package/config to 2.6.36-rc1. I'll update it to the
   final 2.6.36 when it's available.

   To do so, I've cleaned up the update process for package/config.
   Instead of a single big kconfig-to-buildroot2.patch (which nobody
   was keeping up-to-date anyway), I've created a Quilt stack of
   patches. It allowed to ease the transition from 2.6.30 to 2.6.36-rc1.

   The goal of upgrading to 2.6.36-rc1 was to benefit from the recent
   'savedefconfig' thing, which creates a minimal defconfig file.

The progress of this work can be seen at
http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=boards-cleanup.
Of course, this is all work in progress, but your comments are very
welcome.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
