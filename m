From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:51:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: fix build due to gcc
 bug 68485
In-Reply-To: <20190601102032.28968-1-fontaine.fabrice@gmail.com>
References: <20190601102032.28968-1-fontaine.fabrice@gmail.com>
Message-ID: <20190620215126.18bc3e11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Jun 2019 12:20:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
> building opencv with optimization but not when building with -O0. To
> work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
> -O0.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/17fff0f312ebd520ba3341976ba56fd8c85ee376
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opencv/opencv.mk | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
