From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 22:02:57 +0100
Subject: [Buildroot] [PATCH 11/11] package/socat: drop optional readline
 dependency
In-Reply-To: <20191113151724.12155-12-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-12-peter@korsgaard.com>
Message-ID: <20191113210257.GR3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> socat is licensed under GPL-2.0, which is not license compatible with
> readline (GPL-3.0+), so drop the optional dependency and add a comment
> explaining why.
> 
> This also matches how socat is packaged in Debian, where the man page has
> the following snippet added:
> 
> READLINE
> 
>   Uses GNU readline and history on stdio to allow editing and reusing input lines (example).
>   Due to licensing restrictions the readline feature is disabled in Debian.  See BUGS.
>   You can use STDIO instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/socat/socat.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index c6f99c2afa..9e747e08fa 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -27,6 +27,8 @@ endif
>  # automake, so we can't use the normal autoreconf logic.
>  
>  SOCAT_DEPENDENCIES = host-autoconf
> +# incompatibile license (GPL-3.0+)
> +SOCAT_CONF_OPTS = --disable-readline
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  SOCAT_DEPENDENCIES += openssl
> @@ -34,12 +36,6 @@ else
>  SOCAT_CONF_OPTS += --disable-openssl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_READLINE),y)
> -SOCAT_DEPENDENCIES += readline
> -else
> -SOCAT_CONF_OPTS += --disable-readline
> -endif
> -
>  define SOCAT_RUN_AUTOCONF
>  	(cd $(@D); $(HOST_DIR)/bin/autoconf)
>  endef
> -- 
> 2.20.1
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
