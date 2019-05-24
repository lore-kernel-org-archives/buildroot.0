From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 22:07:31 +0200
Subject: [Buildroot] [PATCH v2 11/12] package/opus: fix BUG_85180 build
 timeout
In-Reply-To: <20190521133932.81841-12-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-12-giulio.benetti@micronovasrl.com>
Message-ID: <20190524220731.307f990d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 15:39:31 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling last files
> before linking.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> Bug shows up building opus with optimization but not when building with
> -O0.
> 
> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
> CFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/73d/73dc9610a13d6e14eec58d529617210d93d5dec4/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/opus/opus.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master after tweaking the CFLAGS logic and improving the
commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
