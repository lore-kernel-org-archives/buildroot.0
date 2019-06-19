From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:42:42 +0200
Subject: [Buildroot] [PATCH 13/27] package/kmsxx: work around gcc bug
 85180
In-Reply-To: <20190614210346.121013-14-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-14-giulio.benetti@micronovasrl.com>
Message-ID: <20190619214242.4ee45a7b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:32 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
> shows up when building kmsxx with optimization but not when building
> with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
> force using -O0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/360/360f19645e76314048c75424bb4b64da91742f47/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/kmsxx/kmsxx.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
