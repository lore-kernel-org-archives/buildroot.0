From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:53:37 +0200
Subject: [Buildroot] [PATCH] package/openmpi: fix build failure due to
 Gcc Bug 68485
In-Reply-To: <20190530132341.62716-1-giulio.benetti@micronovasrl.com>
References: <20190530132341.62716-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190531225337.64b02a24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 May 2019 15:23:41 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Package openmpi manifests Microblaze Gcc Bug 68485 resulting in a build
> failure due to an Internal Compiler Error.
> 
> As done for other packages in Buildroot work around this Gcc Bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8f3/8f334427e7475154d69469f8ee4efab6df80e403/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/openmpi/openmpi.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
