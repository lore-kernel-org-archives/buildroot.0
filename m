From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Wed, 23 Sep 2015 10:58:15 -0700
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <20150923170613.75f5e7e4@free-electrons.com>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be> <20150923170613.75f5e7e4@free-electrons.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C34BEE@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,



Please view my in-line replies.



Tommy



-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Sent: Wednesday, September 23, 2015 8:06 AM
To: Arnout Vandecappelle
Cc: Lee, Tommy; buildroot at busybox.net
Subject: Re: [Buildroot] Building system for the Marvell's ARMADA A385 borad to resolve the VLAN trunk issue



Hello,



On Mon, 21 Sep 2015 21:57:32 +0200, Arnout Vandecappelle wrote:



>  So you'll have to configure buildroot yourself. Start with selecting

> BR2_cortex_a9 for the architecture, configure the toolchain as you

> like. Then for the kernel, select an in-tree defconfig and fill in

> "mvebu_v7" for the defconfig name. Also select an in-tree device tree and fill in armada-388-gp.

>

>  Thomas Petazzoni actually worked on this board I think. Thomas, why

> didn't you submit a defconfig? :-P



I actually did a bit more than working on this board, since we (Free

Electrons) did the support for the Armada 38x SoC in the mainline Linux kernel.



I received from my project management the Marvell's A385 package in July. Then I started the work on the board in the package - DB-88F6820-GP. What I have achieved is the success of building and booting the Linux-4.0.4 system on the DB-88F6820-GP board. The system is built with mvebu_v7_defconfig and armada-385-db-ap.dts.



My current problem, as I mentioned in my preceding email, is that the eth0 and eth1 interfaces cannot be enabled, but eth2 at the boot time.



The interest point is that the kernel and DTB images in Marvell's USB storage device can enable these two interfaces: eth0 at the boot time; eth1 via the /etc/network/interfaces editing and the "ifup eth1" process.



The reason why I didn't submit a defconfig is because there is no full-featured publicly available bootloader for these platforms. The bootloader provided by Marvell is not publicly available (you have to be a customer, and use an account to access their Extranet and download the U-Boot sources). There is now some U-Boot support in the mainline U-Boot, but I haven't tried it yet.



Up to now I am just a user of the U-Boot-1.73 on the DB-88F6820-GP board. Once I receive the board from my project management I definitely need to build one which is specific to the board.



So I could submit a huge bunch of defconfigs for all the Armada 370, XP, 375, 38x and 39x platforms that I have (it would probably be 15 to

20 defconfigs), but they would only differ by the name of the Device Tree in the defconfig. All the rest would be exactly the same. So I wasn't sure it was really worth adding 15 to 20 more defconfigs for a configuration that doesn't include the bootloader and where all configurations would be almost identical.



There are three DTB files in Marvell's USB storage device. I have tried all of them with my 4.0.4 system zImage. However, the problem of the network interfaces still occurs. The reason for my tries is that Marvell must use one of them to succeed in the eth0 boot-time enabling.



That being said, if there is some interest in this, I can definitely do it.



I am trying to resolve the problem now with Marvell's package as reference. I believe the problem is on the kernel configuration, not DTB.



Listed here are contents of Marvell's package:



ARMADAsoftware

ARMADAsoftware.rar

DB-88F6820-GP

DB-88F6820-GP.rar

gcc-linaro-arm-linux-gnueabihf-4.8-2013.05_linux

gcc-linaro-arm-linux-gnueabihf-4.8-2013.05_linux.tar.bz2

linux-3.10.70-2015_T1.1.tar.gz

net-snmp-5.7.3

net-snmp-5.7.3.tar

RN_Linux_3.10_2015_T1.1_PQ.pdf

u-boot-2013.01

u-boot-2013.01.tar.bz2



You probably like to know the details of them partially.



Best regards,



Thomas

--

Thomas Petazzoni, CTO, Free Electrons

Embedded Linux, Kernel and Android engineering http://free-electrons.com

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150923/f3b28485/attachment.html>
