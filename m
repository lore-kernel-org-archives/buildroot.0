From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 21:58:18 +0200
Subject: [Buildroot] [PATCH v2 03/12] package/chocolate-doom: fix
 BUG_85180 build timeout
In-Reply-To: <20190521133932.81841-4-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-4-giulio.benetti@micronovasrl.com>
Message-ID: <20190524215818.153fb2b1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 15:39:23 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling last files
> before linking.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> Bug shows up building chocolate-doom with optimization but not when
> building with -O0.
> 
> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
> CFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e57/e570839576be8963dc6bd36342e2f857da3c6146/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/chocolate-doom/chocolate-doom.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master after tweaking the CFLAGS logic and the commit log.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
