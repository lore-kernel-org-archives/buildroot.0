From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 13:10:53 +0200
Subject: [Buildroot] [PATCH] package/apparmor: fixing installation os
 detection
In-Reply-To: <1587725243-7586-1-git-send-email-angelo@amarulasolutions.com>
References: <1587725243-7586-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20200424111053.GE5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2020-04-24 12:47 +0200, Angelo Compagnucci spake thusly:
> Actually the install target of some tools like the parser tries to do
> an os detection to understand what install and where.
> Incidentally, when the install is invoked on SuSE, this will trig a bug
> in parallel install which manifests as "target/lib/apparmor: File exists"
> error. For this problem, a patch is already sent upstream.
> 
> For buildroot instead, the os detection is useless so we disable it
> and use a generic install method.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b18c6a9ce67065dcb7968c6f473b3b403d2925d2
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/apparmor/apparmor.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index 311a797..9180fcd 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -15,7 +15,7 @@ APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
>  APPARMOR_DEPENDENCIES = libapparmor
>  
>  APPARMOR_TOOLS = parser
> -APPARMOR_MAKE_OPTS = USE_SYSTEM=1
> +APPARMOR_MAKE_OPTS = USE_SYSTEM=1 DISTRO=unknown
>  
>  ifeq ($(BR2_PACKAGE_APPARMOR_BINUTILS),y)
>  APPARMOR_TOOLS += binutils
> -- 
> 2.7.4
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
