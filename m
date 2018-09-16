From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 10:22:36 +0200
Subject: [Buildroot] [PATCH v2] gpm: fix major() build failure due to
 glibc 2.28
In-Reply-To: <20180915132359.85323-1-giulio.benetti@micronovasrl.com>
References: <20180915132359.85323-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180916102236.27bdcec9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Sep 2018 15:23:59 +0200, Giulio Benetti wrote:
> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> and therefore <sys/sysmacros.h> must be included explicitly when major()
> is used.
> 
> This commit adds a patch to directly include <sys/sysmacros.h> into
> open_console.c file where major() macro is used.
> 
> Patch has been taken from gpm upstream commit:
> https://github.com/telmich/gpm/commit/b350aee4ea5785a75cb6ad770f6b768c506ebb70
> 
> Fixes:
> http://autobuild.buildroot.net/results/f53/f5373a567de619375746f1dcfe312971b85bb810/
> http://autobuild.buildroot.net/results/227/227a7edf9304d85645d3e7fa0f930fe2e9b6e752/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../gpm/0005-fix-building-w-newer-glibc.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/gpm/0005-fix-building-w-newer-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
