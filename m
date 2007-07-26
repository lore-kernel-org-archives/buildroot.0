From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 16:23:18 +0200
Subject: [Buildroot] Redundant kernel patches in the snapshot from 20070718
Message-ID: <1185459798.1044.43.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am a bit confused to where I should put the kernel patch, there seems
to be two places expecting the same file.

toolchain/kernel-headers/kernel-headers-new.makefile expects them to be
in toolchain/kernel-headers.

target/linux/Makefile.in expects them to be in
$(BR2_BOARD_PATH)/kernel-patches.

AFAICT this is redundant, what is the need to put the same patches in a
board specific folder? Should the target/linux/Makefile.in first do the
patches in toolchain/kernel-headers and then
$(BR2_BOARD_PATH)/kernel-patches if it exists?

-- 
Mvh
Hans-Christian Egtvedt
