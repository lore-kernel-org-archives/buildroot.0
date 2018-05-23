From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 10:23:00 +0200
Subject: [Buildroot] [git commit] nasm: Fix compilation with GCC 8
In-Reply-To: <20180505092204.531518B51B@busybox.osuosl.org>
References: <20180505092204.531518B51B@busybox.osuosl.org>
Message-ID: <20180523102300.50015ac5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 May 2018 11:21:18 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=3aa64a0e828eca3669cbd1fa3fb9fef69dacf74e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> host-nasm fails to compile with GCC 8:
> 
> In file included from ./include/nasm.h:46,
>                  from asm/nasm.c:47:
> ./include/nasmlib.h:194:1: error: ?pure? attribute on function returning ?void? [-Werror=attributes]
>  void pure_func seg_init(void);
>  ^~~~
> 
> Pull a patch from upstream that removes the stale declaration of
> seg_init, which was eliminated a long time ago.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../nasm/0001-nasmlib-Drop-unused-seg_init.patch   | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch b/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch
> new file mode 100644
> index 0000000000..a18d121bfb
> --- /dev/null
> +++ b/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch
> @@ -0,0 +1,32 @@
> +From 5eb1838b4d3752fd863d19442943983a2a5ee87c Mon Sep 17 00:00:00 2001
> +From: Cyrill Gorcunov <gorcunov@gmail.com>
> +Date: Sat, 10 Feb 2018 00:33:41 +0300
> +Subject: [PATCH] nasmlib: Drop unused seg_init
> +
> +The helper has been eliminated in 2c4a4d5810d0a59b033a07876a2648ef5d4c2859
> +
> +https://bugzilla.nasm.us/show_bug.cgi?id=3392461
> +
> +Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>

Peter, could you apply this one to 2018.02.x, to fix
http://autobuild.buildroot.net/results/98a/98a89f7203377d2c8b2f47bfdf00243a8837500e/build-end.log ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
