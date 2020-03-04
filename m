From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Mar 2020 14:10:14 +0000
Subject: [Buildroot] [Bug 12521] RISCV RV32IA selected, RV64GC output
In-Reply-To: <bug-12521-163@https.bugs.busybox.net/>
References: <bug-12521-163@https.bugs.busybox.net/>
Message-ID: <bug-12521-163-9dqIQyR3cP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12521

--- Comment #4 from Mark Corbin <mark@dibsco.co.uk> ---
Hello

The configuration that you posted won't build due to a missing entry for the
location of your kernel configuration file (BR2_LINUX_KERNEL_DEFCONFIG).

The default RISC-V configuration for the 5.0.13 kernel is for a 64-bit build,
so you would need to provide an appropriate kernel config fragment to change
this to 32-bit. Note that there is now an 'rv32_defconfig' in the kernel tree
(since the 5.1 release).

However, the minimum ISA requirement for the 5.0.13 kernel is RV32im and later
kernels require RV32ima (see arch/riscv/Makefile), so it seems that you
wouldn't actually be able to build an RV32ia (or RV32i) kernel anyway.

Regards

Mark

-- 
You are receiving this mail because:
You are on the CC list for the bug.
