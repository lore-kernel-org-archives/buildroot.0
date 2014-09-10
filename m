From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Sep 2014 22:09:49 +0200
Subject: [Buildroot] [PATCH 10/12] gcc: enable poison system directories
 option
In-Reply-To: <1408540005-26934-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140910200949.GD23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-20 15:06 +0200, Thomas Petazzoni spake thusly:
> This commit enables the poison system directories option, which is now
> available thanks to the gcc patches that have been added.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

When the previous patches have been fixed:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc-final/gcc-final.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 44b9561..b697e61 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -52,6 +52,7 @@ HOST_GCC_FINAL_CONF_OPT = \
>  	$(HOST_GCC_COMMON_CONF_OPT) \
>  	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
>  	$(DISABLE_LARGEFILE) \
> +	--enable-poison-system-directories \
>  	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
>  
>  # Disable shared libs like libstdc++ if we do static since it confuses linking
> -- 
> 2.0.0
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
