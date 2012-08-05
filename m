From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Aug 2012 12:04:25 +0200
Subject: [Buildroot] [v2] Improve MIPS support
Message-ID: <1344161069-19804-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of the patch set that clarifies MIPS support,
and especially MIPS64 support.

It has four patches:

 * First patch refactors some uclibc.mk to use the existing BR2_ENDIAN
   config option rather than doing the same work again.

 * Second patch reworks the config option for mips. It creates two
   separate two level architectures for MIPS and MIPS64, and then
   clarifies the ABI names and config options.

 * Third patch (from Gustavo) remove old MIPS64 related toolchain
   kludge

 * Fourth patch (from Gustavo) adds a defconfig to build a mips64
   system for Qemu

Changes since v1:

 * Addition of the first, third and fourth patches.
 * Separation of top-level mips64 architectures.
 * Simplification of uClibc code to find the architecture.

Best regards,

Thomas
