From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 17:06:13 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <5600612C.5060300@mind.be>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
Message-ID: <20150923170613.75f5e7e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Sep 2015 21:57:32 +0200, Arnout Vandecappelle wrote:

>  So you'll have to configure buildroot yourself. Start with selecting
> BR2_cortex_a9 for the architecture, configure the toolchain as you like. Then
> for the kernel, select an in-tree defconfig and fill in "mvebu_v7" for the
> defconfig name. Also select an in-tree device tree and fill in armada-388-gp.
> 
>  Thomas Petazzoni actually worked on this board I think. Thomas, why didn't you
> submit a defconfig? :-P

I actually did a bit more than working on this board, since we (Free
Electrons) did the support for the Armada 38x SoC in the mainline Linux
kernel.

The reason why I didn't submit a defconfig is because there is no
full-featured publicly available bootloader for these platforms. The
bootloader provided by Marvell is not publicly available (you have to
be a customer, and use an account to access their Extranet and download
the U-Boot sources). There is now some U-Boot support in the mainline
U-Boot, but I haven't tried it yet.

So I could submit a huge bunch of defconfigs for all the Armada 370,
XP, 375, 38x and 39x platforms that I have (it would probably be 15 to
20 defconfigs), but they would only differ by the name of the Device
Tree in the defconfig. All the rest would be exactly the same. So I
wasn't sure it was really worth adding 15 to 20 more defconfigs for a
configuration that doesn't include the bootloader and where all
configurations would be almost identical.

That being said, if there is some interest in this, I can definitely do
it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
