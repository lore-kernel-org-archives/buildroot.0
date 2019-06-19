From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 18:00:43 +0200
Subject: [Buildroot] [PATCH 10/27] package/snort: work around gcc bug
 85180
In-Reply-To: <20190614210346.121013-11-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-11-giulio.benetti@micronovasrl.com>
Message-ID: <20190619180043.3bcc6ae4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:29 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
> shows up when building snort with optimization but not when building
> with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
> force using -O0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d24/d2412710f6cfbfc069e7858e507e28555baafa3e/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/snort/snort.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
