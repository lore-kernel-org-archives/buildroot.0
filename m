From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 29 Jan 2007 00:18:31 +0100
Subject: [Buildroot] Toolchain/Busybox configuration for AVR32
Message-ID: <1170026311.21218.13.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author:	Ulf Samuelsson
Date:	2007-01-28

Log:
	Config.in and *.mk for AVR32 configurations

	Working configuration file for busybox.
		insmod not supported...
	Create patch directory
		toolchain/binutils/2.16.1-atmel.0.99.2/
		The file "empty" is a workaround to 
		create the directory and is not needed...
		Once the directory is part of the
		patchset, it can be removed.

	Use Atmel mirror to download preconfigured binutils.
	Patching vanilla binutils-2.16.1 was a nightmare!

	Ensure in all Config.in that:
		gcc-4.0.2
		binutils-2.16.1-atmel.0.99.2 (prepatched)
		uClibc-0.9.28
		busybox-1.2.2.1
		2.6.19.2 kernel headers
	is the only toolchain.
	There is nothing more modern around just yet :-(

	gdb is disabled, since it does not work

	The remining part to support AVR32 are the 
	* patchsets for the toolchain.
		
	* updated MTD

Modified:
	toolchain/binutils/2.16.1-atmel.0.99.2/empty
	toolchain/binutils/binutils.mk
	toolchain/binutils/Config.in
	toolchain/gcc/Config.in
	toolchain/gdb/Config.in
	toolchain/uClibc/Config.in
	toolchain/kernel-headers/Config.in
	package/busybox/Config.in
	package/busybox/busybox-1.2.2.1-avr32.config


Changeset:
	toolchain/binutils/2.16.1-atmel.0.99.2/empty
	toolchain/binutils/binutils.mk
	toolchain/binutils/Config.in
	toolchain/gcc/Config.in
	toolchain/gdb/Config.in
	toolchain/uClibc/Config.in
	toolchain/kernel-headers/Config.in
	package/busybox/Config.in
	package/busybox/busybox-1.2.2.1-avr32.config

Best Regards
Ulf Samuelsson


-------------- next part --------------
A non-text attachment was scrubbed...
Name: avr32_config.patch
Type: text/x-patch
Size: 29857 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070129/42478396/attachment-0001.bin 
