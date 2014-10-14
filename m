From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 10:26:50 +0200
Subject: [Buildroot] [PATCH 6/8] package/tvheadend: Enable bundled build
In-Reply-To: <1413137610-21887-6-git-send-email-bernd.kuhls@t-online.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
 <1413137610-21887-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141014082649.GI3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-12 20:13 +0200, Bernd Kuhls spake thusly:
> host-python is needed to create a bundled version of the tvheadend binary which
> includes all files used by the web UI.
> 
> Having host-python alone as dependency is not enough, we need to add
> --enable-bundle to enable this functionality.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/tvheadend.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 9909b5c..c152717 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -31,6 +31,7 @@ TVHEADEND_CONF_OPTS += \
>  	--arch="$(ARCH)" \
>  	--cpu="$(BR2_GCC_TARGET_CPU)" \
>  	--python="$(HOST_DIR)/usr/bin/python" \
> +	--enable-bundle \
>  	--disable-dvbscan
>  
>  #----------------------------------------------------------------------------
> -- 
> 1.7.10.4
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
