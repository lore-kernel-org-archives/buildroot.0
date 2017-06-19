From: Stephan Bauroth <der_steffi@gmx.de>
Date: Mon, 19 Jun 2017 13:42:45 +0200
Subject: [Buildroot] [uboot-tools] inherit OVERRIDE_SRCDIR from uboot
Message-ID: <0b3e7e25-4937-c143-567b-017d29de795a@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear List,

I stumbled upon a compilation breakage in host-uboot-tools when uboot 
itself is built from a local directory with the help of 
UBOOT_OVERRIDE_SRCDIR. During building, host-uboot-tools fails with:

<code>
scripts/kconfig/conf  --silentoldconfig Kconfig
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
</code>

Adding UBOOT_TOOLS_OVERRIDE_SRCDIR to local.mk pointing to the same repo 
as UBOOT_OVERRIDE_SRCDIR solves this issue. Maybe uboot-tools should 
inherit the override? I can't think of a situation where one would want 
to use his own version of uboot but not for the tools.

greetings,
Stephan
