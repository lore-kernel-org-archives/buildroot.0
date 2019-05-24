From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 22:17:17 +0200
Subject: [Buildroot] [PATCH v2 07/12] package/gst-ffmpeg: re-enable
 package if BUG_85180 is present
In-Reply-To: <20190521133932.81841-8-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-8-giulio.benetti@micronovasrl.com>
Message-ID: <20190524221717.7bb838db@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 15:39:27 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling first files.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> This package has been excluded from building if BUG_85180 is present.
> Bug shows up building gst-ffmpeg with optimization but not when building
> with -O0.
> 
> In config.mk if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 by:
> - add --disable-optimizations to EXTRA_OPTS
> - passing -O0 to CFLAGS in CONF_ENV
> Then remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180' and its
> comment if not available from Config.in
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/gstreamer/gst-ffmpeg/Config.in     | 4 ----
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 5 +++++
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to master after tweaking the CFLAGS logic and improving the
commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
