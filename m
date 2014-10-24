From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Oct 2014 16:57:09 -0700
Subject: [Buildroot] [PATCH] snowball-hdmiservice: Use github call
In-Reply-To: <1413136827-31792-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413136827-31792-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141024235709.GF14818@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-12 20:00 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Note: this patch also removes trailing spaces+tab, which is not readily
visible in a mail, you should have stated so in the commit log, somethig
like:

    Also get rid of traling spaces+tabs.

Regards,
Yann E. MORIN.

> ---
>  package/snowball-hdmiservice/snowball-hdmiservice.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
> index f254414..267b5ad 100644
> --- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
> +++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
> @@ -5,13 +5,13 @@
>  ################################################################################
>  
>  SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
> -SNOWBALL_HDMISERVICE_SITE = https://github.com/igloocommunity/hdmiservice
> +SNOWBALL_HDMISERVICE_SITE = $(call github,igloocommunity,hdmiservice,$(SNOWBALL_HDMISERVICE_VERSION))
>  SNOWBALL_HDMISERVICE_LICENSE = MIT
>  SNOWBALL_HDMISERVICE_LICENSE_FILES = debian/copyright
>  SNOWBALL_HDMISERVICE_INSTALL_STAGING = YES
>  
>  define SNOWBALL_HDMISERVICE_BUILD_CMDS
> -	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" 	
> +	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
>  endef
>  
>  define SNOWBALL_HDMISERVICE_INSTALL_STAGING_CMDS
> -- 
> 2.1.1
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
