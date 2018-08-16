From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 22:00:45 +0200
Subject: [Buildroot] [PATCH] configs: solidrun_macchiatobin_marvell: fix
 u-boot build
In-Reply-To: <bc4ad6ef454508016634b1074fe83681946f4826.1534422853.git.baruch@tkos.co.il>
References: <bc4ad6ef454508016634b1074fe83681946f4826.1534422853.git.baruch@tkos.co.il>
Message-ID: <20180816220045.0a74a6af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 15:34:13 +0300, Baruch Siach wrote:
> U-Boot local libfdt headers conflict with host-dtc provided headers.
> Disable host-dtc, and backport two upstream U-Boot patches to fix build
> without external libfdt headers.
> 
> U-Boot build still fail when the host provides its own libfdt header
> (e.g., Debian libfdt-dev package), or when BR2_PACKAGE_HOST_DTC is
> enabled. Fixing that seems to require much more involved code changes.
> Fix the common case for now.
> 
> Fixes partially:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/88314956
> 
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

This issue is happening for 30-40 defconfigs. I don't think adding a
4500 lines patch for each defconfig is really the right solution,
especially because it also doesn't fix the situation of someone
building U-Boot outside of a pre-existing defconfig.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
