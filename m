From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:47:51 +0200
Subject: [Buildroot] [PATCH v2 05/14] xdriver_xf86-video-imx-viv: bump
 version to 5.0.11-p8.4
In-Reply-To: <CAAMH-yvnwAdtfHfaMez7CZOnYd-SNQAd6ey7XnbLrF0bg21UPg@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <acc40a04b76b5069de297330cc9207d20f69a9a1.1465578220.git.awebster@arcx.com>
 <CAAMH-yvnwAdtfHfaMez7CZOnYd-SNQAd6ey7XnbLrF0bg21UPg@mail.gmail.com>
Message-ID: <20160615224751.230faf38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Jun 2016 15:20:11 +0200, Gary Bisson wrote:

> > @@ -1,31 +0,0 @@
> > -From 80c419dddf6483873503d90694c4b4ae34ffa5e4 Mon Sep 17 00:00:00 2001
> > -From: Otavio Salvador <otavio@ossystems.com.br>
> > -Date: Wed, 2 Dec 2015 13:50:57 +0000
> > -Subject: [PATCH] Remove 'dix' internal header usage
> > -Organization: O.S. Systems Software LTDA.
> > -
> > -The 'swaprep.h' is an internal Xorg header and is not being installed
> > -anymore. The swap features are provided by the 'misc.h' header now.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>  
> 
> I think you need to add your SOB in the patch like:

You're commenting on the patch that is *removed* so it's not really
where a change should be done. However, I've added the reference to the
upstream commit in the patch added by Andrew, indeed.

> Also, should we add a dependency on ARM_EABIHF since it depends on
> imx-gpu-viv? I'm never a 100% sure when you need to propagate those
> dependencies.

You need to propagate the dependencies when you're doing a select, i.e:

config BR2_PACKAGE_FOO
	depends on BR2_ARM_EABIHF

config BR2_PACKAGE_BAR
	select BR2_PACKAGE_FOO

is wrong, because BR2_PACKAGE_BAR should replicate the "depends on
BR2_ARM_EABIHF".

However, in the case here, xdriver_xf86-video-imx-viv does:

	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11

so we're good (i.e it doesn't "select" the imx-gpu-viv package).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
