From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jul 2019 22:34:01 +0200
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix order of packages checking
In-Reply-To: <20190715065253.6072-1-jerzy.m.grzegorek@gmail.com>
References: <20190715065253.6072-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190715203401.GO29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

On 2019-07-15 08:52 +0200, Jerzy Grzegorek spake thusly:
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>

Please provide more information in the commit log. See below...

> ---
>  utils/checkpackagelib/lib_config.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index f0edb9993d..a135355f9a 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -72,8 +72,8 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>          return len(self.state.split('-')) - 1
>  
>      def check_line(self, lineno, text):
> -        if text.startswith("comment") or text.startswith("if") or \
> -           text.startswith("menu"):
> +        if text.startswith("comment ") or text.startswith("if ") or \
> +           text.startswith("menu "):

I guess this superseds Arnout's own patch?
    http://lists.busybox.net/pipermail/buildroot/2019-July/254466.html

>              if text.startswith("comment"):
>                  if not self.state.endswith("-comment"):
> @@ -103,7 +103,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>  
>          elif text.startswith('\tsource "package/'):
>              level = self.get_level()
> -            new_package = text[17: -(len(self.filename)-5):]
> +            new_package = text[17: -(len(self.filename)-self.filename.index("Config")+3):]

I fail to see how the two changes are related. This should be explained
in the commit log. If they are not fixing the same thing, it should be
two commits.

Regards,
Yann E. MORIN.

>              # We order _ before A, so replace it with .
>              new_package_ord = new_package.replace('_', '.')
> -- 
> 2.17.1
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
