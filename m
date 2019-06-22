From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:54:47 +0200
Subject: [Buildroot] [PATCH 4/4] package/libtorrent-rasterbar: work
 around gcc bug 85180
In-Reply-To: <20190618084535.75870-5-giulio.benetti@micronovasrl.com>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
 <20190618084535.75870-5-giulio.benetti@micronovasrl.com>
Message-ID: <20190622205447.00350d77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Jun 2019 10:45:35 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
> shows up when building libtorrent-rasterbar with optimization but not
> when building with -O0. To work around this, if
> BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/410/410e75676abc6bbabe9029ecda969e3d909f3e18/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
