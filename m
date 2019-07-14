From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 15:15:02 +0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix 'menuconfig' handling
In-Reply-To: <20190714124400.29431-1-arnout@mind.be>
References: <20190714124400.29431-1-arnout@mind.be>
Message-ID: <20190714131502.GC8912@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-07-14 14:44 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The CommentsMenusPackagesOrder check builds the 'state' to track the
> depth of menus and conditions. However, a menuconfig doesn't create a
> menu by itself - it is always followed by a condition that implies the
> menu. As a result, when unwinding the 'state', the level will be wrong.
> 
> Fix this by checking for menu followed by a space, so it no longer
> matches menuconfig.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/251214899

No, it does not fix it totally. It only fixes the python traceback.

The Kodi issues is till present.

Hint: the Kodi package is the only one that indents the "source" lines
with a TAB.

Regards,
Yann E. MORIN.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> ---
>  utils/checkpackagelib/lib_config.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index f0edb9993d..94faf1b0fc 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -73,7 +73,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>  
>      def check_line(self, lineno, text):
>          if text.startswith("comment") or text.startswith("if") or \
> -           text.startswith("menu"):
> +           text.startswith("menu "):
>  
>              if text.startswith("comment"):
>                  if not self.state.endswith("-comment"):
> -- 
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
