From: Guy Ka <guyarkam@gmail.com>
Date: Fri, 22 Jan 2021 16:47:08 -0500
Subject: [Buildroot] RISCV32 How to avoid the generation of compressed
 instructions
Message-ID: <CAEYXRPniVPF2VZze00+vhCvy-qZTG6QerUm1u0Ez61v+coGKqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I would like to build a RISCV32 system. My underlying hardware does not
support compressed instructions. Using latest Buildroot (90a82161) from Jan
21
Outgoing from make qemu_riscv32_virt_defconfig
I modified
Target Options => Target Architecture Variant => Custom and I made sure
that "C compressed Instructions" is unchecked.
When I build the system, I still see compressed instructions in the kernel
and in the boot loader and as a matter of fact, I see the line
Boot HART ISA rv32imafdcsu during the OpenSbi boot up.
I see the following lines in my config file
BR2_RISCV_ISA_RVI=y
BR2_RISCV_ISA_RVM=y
BR2_RISCV_ISA_RVA=y
BR2_RISCV_ISA_CUSTOM_RVM=y
BR2_RISCV_ISA_CUSTOM_RVA=y
# BR2_RISCV_ISA_CUSTOM_RVF is not set
# BR2_RISCV_ISA_CUSTOM_RVC is not set

Could it be that the ISA options are not forwarded to the kernel/bootloader?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210122/ccfd041e/attachment.html>
