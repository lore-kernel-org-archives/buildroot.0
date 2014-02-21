From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Feb 2014 23:11:28 +0100
Subject: [Buildroot] [PATCH] Config: default BR2_PACKAGE_OVERRIDE_FILE
 to $(CONFIG_DIR)/local.mk
In-Reply-To: <1391032104-18150-1-git-send-email-yann.morin.1998@free.fr>
References: <1391032104-18150-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140221221128.GA16700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-01-29 22:48 +0100, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The current default for BR2_PACKAGE_OVERRIDE_FILE points to:
>     $(TOPDIR)/local.mk
> 
> This works well for in-tree builds, but is not very useful for
> out-of-tree builds, when the Buildroot source tree may be shared for
> different concurrent builds.
> 
> Also, it seems to be more sensible to have local.mk alognside
> the .config file.
> 
> Hence, change the default for BR2_PACKAGE_OVERRIDE_FILE to point to:
>     $(CONFIG_DIR)/local.mk
> 
> Note that this does not change the current behaviour for in-tree
> builds, since in that case $(CONFIG_DIR) == $(TOPDIR).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Ping? For -next?

Note that it was acked by Arnout.

> ---
>  Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index 7ec7c2a..f8d6e23 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -488,7 +488,7 @@ config BR2_HAVE_DOCUMENTATION
>  
>  config BR2_PACKAGE_OVERRIDE_FILE
>  	string "location of a package override file"
> -	default "$(TOPDIR)/local.mk"
> +	default "$(CONFIG_DIR)/local.mk"
>  	help
>  	  A package override file is a short makefile that contains
>  	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR,

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
