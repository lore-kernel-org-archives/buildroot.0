From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 18:21:41 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "package/swupdate: add patch to
 fix build issue with some toolchains"
In-Reply-To: <1445691845-17624-1-git-send-email-bjorn.forsman@gmail.com>
References: <1445691845-17624-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20151024162141.GD3632@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn, All,

On 2015-10-24 15:04 +0200, Bj?rn Forsman spake thusly:
> This patch caused an unfortunate regression that prevents any handlers
> from being registered (runtime issue). This means swupdate cannot
> perform any update. Upstream has reverted it.
> 
> See discussion:
> https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ
> 
> This reverts commit a8cc6eeec5a665db5689083312beef14a9afbafa.
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/swupdate/swupdate.hash | 1 -
>  package/swupdate/swupdate.mk   | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
> index 96ebedf..eb7722c 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,4 +1,3 @@
>  # Locally calculated
>  sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
> -sha256	ec633171e6a893506fad6b96fb2b258d60a023c03be5520b968a1d5cc6bafe6e  c3467290925b2a833a68d9db12c198fdca752e32.patch
>  sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 68f6e2c..bcdc764 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -9,7 +9,6 @@ SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>  SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
>  SWUPDATE_LICENSE_FILES = COPYING
>  SWUPDATE_PATCH = \
> -	https://github.com/sbabic/swupdate/commit/c3467290925b2a833a68d9db12c198fdca752e32.patch \
>  	https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
>  
>  # swupdate bundles its own version of mongoose (version 3.8) and
> -- 
> 2.5.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
