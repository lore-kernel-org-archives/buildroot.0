From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 21:58:24 +0200
Subject: [Buildroot] [PATCH v2 04/12] package/ddrescue: fix BUG_85180
 build timeout
In-Reply-To: <20190521133932.81841-5-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-5-giulio.benetti@micronovasrl.com>
Message-ID: <20190524215824.260450f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 15:39:24 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling first files.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> Bug shows up building ddrescue with optimization but not when building
> with -O0.
> 
> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
> CXXFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2af/2af69401acb76be3d3fd427d1c58fed3af33bf9b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/ddrescue/ddrescue.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master after tweaking the CFLAGS logic and the commit log.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
