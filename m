From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 17:58:12 +0100
Subject: [Buildroot] [PATCHv3 27/74] mpd: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1417357142-14307-28-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-28-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130165812.GG4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mpd/mpd.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 5448251..1eedcbc 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -232,10 +232,13 @@ define MPD_INSTALL_EXTRA_FILES
>  		$(INSTALL) -D package/mpd/mpd.conf \
>  			$(TARGET_DIR)/etc/mpd.conf; \
>  	fi
> -	$(INSTALL) -m 0755 -D package/mpd/S95mpd \
> -		$(TARGET_DIR)/etc/init.d/S95mpd
>  endef
>  
>  MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
>  
> +define MPD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/mpd/S95mpd \
> +		$(TARGET_DIR)/etc/init.d/S95mpd
> +endef
> +
>  $(eval $(autotools-package))
> -- 
> 2.1.0
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
