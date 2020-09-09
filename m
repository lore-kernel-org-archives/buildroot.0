From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 08:49:12 +0200
Subject: [Buildroot] [PATCH v2 0/6] Add support for Kendryte K210 RISC-V
 boards
In-Reply-To: <20200908113324.1022230-1-damien.lemoal@wdc.com> (Damien Le
 Moal's message of "Tue, 8 Sep 2020 20:33:18 +0900")
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
Message-ID: <87sgbr5tsn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Damien Le Moal <damien.lemoal@wdc.com> writes:

 > This patch series adds support for building bootable images for RISC-V
 > boards based on the Kendryte K210 SoC which is supported by the Linux
 > kernel since version 5.8.0. This SoC has no MMU supported by Linux and
 > requires uClibc flatbin binaries as gcc does not yet support FDPIC
 > executables for RISC-V.

 > The first four patches adjust buildroot configuration to allow building
 > uClibc static no-MMU libraries for RISC-V. The last and fifth patch adds
 > buildroot defconfig for the Kendryte K210 as well as uClibc and busybox
 > configuration.

 > Building is as simple as:
 > make kendryte_k210_defconfig
 > make

 > Which generate the output/image/loader.bin bootable image.

Nice! With 2020.08 out the door and kernel 5.8 added, this was next on
my todo list, so great timing ;)

-- 
Bye, Peter Korsgaard
