From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 23:16:38 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/ffmpeg: re-enable package if
 BUG_85180 is present
In-Reply-To: <20190522135906.30796-3-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-3-giulio.benetti@micronovasrl.com>
Message-ID: <20190524231638.20182c30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 May 2019 15:59:01 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> This package has been excluded from building if BUG_85180 is present.
> Bug shows up building ffmpeg with optimization.
> 
> In config.mk if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 by:
> - add --disable-optimizations to FFMPEG_CONF_OPTS
> - passing -O0 to CFLAGS in FFMPEG_CONF_ENV
> Then remove 'depends on !BR2_microblaze' from Config.in
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> V1->V2:
> * use BUG_85180 instead of BUG_71124 since they are the same bug

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
