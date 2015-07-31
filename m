From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2015 08:04:41 +0200
Subject: [Buildroot] configs/marvell_ca9_armv7_le_hfp_defconfig
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD8F64@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD8F64@svr-wa-exch1.atg.lc>
Message-ID: <20150731080441.31efc9a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tommy,

On Thu, 30 Jul 2015 17:08:16 -0700, Lee, Tommy wrote:

> My host is Ubuntu-14.04LTS which meets the Buildroot system
> requirements. I am using buildroot-2015.05 to build the Linux system
> for the Marvell ARMADA A38x DB-88F6820-GP board. The first make
> process issue is that the defconfig file listed on the subject line
> does not originally exist in the configs folder. I copied this file
> from Marvell's old (2012.11-2015_T1.0) Buildroot/configs folder to
> the buildroot-2015.05 /configs folder.

This may not work immediately: from 2012 to 2015, a lot of changes have
been made to Buildroot. So a configuration that was working with
Buildroot 2012.11 may not be directly usable with Buildroot 2015.05.

> My .config file has the following line:
> 
> BR2_LINUX_KERNEL_DEFCONFIG="marvell_ca9_armv7_le_hfp_defconfig"

This is a reference to a Marvell-specific kernel defconfig.

> '/home/tclee/Downloads/jul30thu15/buildroot-2015.05/output/build/linux-4.0.4/arch/arm/configs/

and you're using a mainline 4.0.4 kernel, which obviously doesn't have
this Marvell-specific defconfig.

So you have to make a choice:

 * Either you use the mainline kernel, and the defconfig for Armada 38x
   is called mvebu_v7_defconfig.

 * Or you use Marvell specific kernel, in which case you need to change
   the Buildroot option giving the location of the kernel sources so
   that Buildroot fetches the Marvell specific kernel instead of the
   mainline one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
