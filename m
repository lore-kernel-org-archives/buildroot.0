From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 11:32:29 +0200
Subject: [Buildroot] [PATCH] ci20_defconfig: disable madd instructions
 to avoid FPU bug
In-Reply-To: <68e76d80-a505-e029-941a-fe43d9780536@imgtec.com>
References: <20161018122421.64118-1-Vincent.Riera@imgtec.com>
 <20161018145413.37ae0751@free-electrons.com>
 <68e76d80-a505-e029-941a-fe43d9780536@imgtec.com>
Message-ID: <20161019113229.02a9d8c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 09:47:03 +0100, Vicente Olivert Riera wrote:

> We could add an Ingenic XBurst entry in the MIPS CPU selection, and then
> add that -mno-fused-madd option to the wrapper based on that selection.
> 
> If you are OK with that, please let me know and I'll cook the patch.

If I understand correctly:

 - JZ4780 is the SoC
 - XBurst is the core
 - MIPS32r2 is the ISA

So indeed, it makes sense to add an option for XBurst, in order to
mimic what we do on ARM.

Ideally, we should mimic what we do on ARM, and only list in
"Target architecture variants" the cores and not the ISA. How many
vendors are doing MIPS cores, and how many cores are they doing?

If you look at ARM, we have the following situation:

 - Freescale, TI, Atmel, Marvell, Qualcomm, Nvidia, etc. are doing SoCs
   They are way too many for Buildroot to have a list of them.

 - Very few vendors are doing cores. Most of the SoC vendors are using
   the cores from ARM. For example, we have ARM926, Cortex-A7, Cortex-A8,
   Cortex-A53, etc.

   Those are the ones that are listed in "Target Architecture Variant",
   and we use the selected option to know the ISA.

 - ISAs are ARMv4, ARMv5, ARMv6, ARMv7, ARMv8, with a few variants.

So having a similar model for MIPS would be ideal.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
