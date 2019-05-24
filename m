From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 21:58:53 +0200
Subject: [Buildroot] [PATCH v2 05/12] package/flare-engine: fix
 BUG_85180 build timeout
In-Reply-To: <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
Message-ID: <20190524215853.4ee3ddbc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 15:39:25 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling last files.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> Bug shows up building flare-engine with optimization but not when
> building with -O0.
> 
> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 by:
> - setting CMAKE_BUILD_TYPE to Dummy to avoid CMakeLists.txt to impose
>   -O* and -g* flags

Why does flare-engine need this, but not jasper, which is also a
CMake-based package ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
