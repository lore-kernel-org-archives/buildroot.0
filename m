From: Matt Fornero <Matt.Fornero@mathworks.com>
Date: Wed, 29 Mar 2017 16:02:44 +0000
Subject: [Buildroot] [RFC 1/1] zynq-custom-fpga: new package
In-Reply-To: <94ae85f1-5639-1513-beda-30e0ce8c8f8c@gmail.com>
References: <1485273729-11541-1-git-send-email-matthew.weber@rockwellcollins.com>
 <11a78ea4-0887-c3a1-6f2e-3902e8429ef3@gmail.com>
 <BY2PR05MB96717CB18F2E29A2A50414598400@BY2PR05MB967.namprd05.prod.outlook.com>
 <94ae85f1-5639-1513-beda-30e0ce8c8f8c@gmail.com>
Message-ID: <BY2PR05MB9670D4D3490C7269538280798350@BY2PR05MB967.namprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Romain Naour [mailto:romain.naour at gmail.com]
> Sent: Tuesday, February 7, 2017 1:22 AM
...
> Actually, it would be easier to propose something if you can share an
> example of ps*_init_gpl.[c|h] files, because without it I can't really test your
> use case.

You can find some examples of the ps*_init files here:
https://github.com/mathworks/buildroot/tree/4e791a9430d/board/mathworks/zynq/boards/zed/boot/handoff
 
> That said, the aim of zync-custom-fpga is to allow patching/modifying u-boot
> sources for a very specific case (custom board), so why not using
> BR2_TARGET_UBOOT_PATCH ?

Using the BR2_TARGET_UBOOT_PATCH would be challenging-- the ps*_init_gpl files
are a direct output from the FPGA tool (Vivado); to generate a patch would
require a number of extra manual steps (essentially we'd need to manually insert
the files to generate the patch, then have buildroot use the patch to achieve
the same source code state).

Note that this is required for *any* board using the Zynq / Zynq MPSoC device
(very similar steps are required for Intel SoC FPGA parts); and the files
generated can change for a given PCB depending on how the FPGA is configured--
so this is not something that could easily be statically generated.

-Matt
