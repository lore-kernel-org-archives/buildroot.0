From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 15:32:10 +0100
Subject: [Buildroot] [PATCH 1/1] build with GCC 4.8
In-Reply-To: <1392379760-18464-1-git-send-email-syntheticpp@gmx.net>
References: <1392379760-18464-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20140214153210.4574d0ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

Thanks for your contribution!

The commit title should indicate the package on which the modification
is made.

On Fri, 14 Feb 2014 13:09:20 +0100, Peter K?mmel wrote:
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>  package/ti-gfx/ti-gfx-newclkapi.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-newclkapi.patch
> index 8f50c7e..29ad20d 100644
> --- a/package/ti-gfx/ti-gfx-newclkapi.patch
> +++ b/package/ti-gfx/ti-gfx-newclkapi.patch
> @@ -14,7 +14,7 @@ Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
>  +#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
>  +int clk_disable_unprepare(struct clk *clk)
>  +{
> -+	return clk_disable(clk);
> ++	clk_disable(clk); return 0;

And your commit log should have more details to explain how
the change you're doing is related to GCC 4.8. I guess something like:
"clk_disable() and clk_enable() return void, and therefore they return
value is not compatible with the return value of the stub
clk_disable_unprepare() and clk_prepare_enable() functions".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
