From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Aug 2019 09:30:40 +0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib:
 CommentsMenusPackagesOrder: only apply to top-level
In-Reply-To: <20190731230220.32266-1-arnout@mind.be>
References: <20190731230220.32266-1-arnout@mind.be>
Message-ID: <20190801073040.GB3548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-08-01 01:02 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The CommentsMenusPackagesOrder test is broken in various ways for files
> other than package/Config.in and package/Config.in.host. Therefore, the
> script gives bogus errors for various other Config.in files.
> 
> However, we don't really want to check those other files. Indeed, many
> of them have a non-alphabetical ordering for good reasons.
> 
> Therefore, skip the check for files other than package/Config.in and
> package/Config.in.host.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/251214899

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  utils/checkpackagelib/lib_config.py | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index f0edb9993d..7d7567ac67 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -72,6 +72,11 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>          return len(self.state.split('-')) - 1
>  
>      def check_line(self, lineno, text):
> +        # We only want to force sorting for the top-level menus
> +        if self.filename not in ["package/Config.in",
> +                                 "package/Config.in.host"]:
> +            return
> +
>          if text.startswith("comment") or text.startswith("if") or \
>             text.startswith("menu"):
>  
> -- 
> 2.21.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
