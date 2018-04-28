From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 17:59:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: add missing elfutils
 dependency with R600 driver
In-Reply-To: <20180428155252.27526-1-romain.naour@gmail.com>
References: <20180428155252.27526-1-romain.naour@gmail.com>
Message-ID: <20180428175952.43541f78@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 17:52:51 +0200, Romain Naour wrote:
> Commit "add dependency on elfutils for R600 with LLVM" [1] select
> elfutils package at Kconfig level without adding it the make dependency.
> 
> Enabling r600 support lead to a build issue when building from
> scratch with "make mesa3d":
> checking for RADEON... yes
> configure: error: r600 requires libelf when using llvm
> 
> elfutils dependency is needed by r600 with llvm support and radeonSI.
> 
> [1] 92fda8761aa8024be53a8edb8c102d1ba6401bce
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Valentin Korenblit <valentin.korenblit@smile.fr>

Perhaps introduce a BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS hidden Config.in
boolean, select it from the right drivers, and use that in the .mk
file ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
