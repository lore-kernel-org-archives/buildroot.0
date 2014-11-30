From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 19:18:06 +0100
Subject: [Buildroot] [PATCHv3 73/74] mpd: install configuration file
 unconditionally
In-Reply-To: <1417357142-14307-74-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-74-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130181806.GC4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:19 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see a comment below...

> ---
>  package/mpd/mpd.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 1eedcbc..ba3bd59 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -228,10 +228,7 @@ MPD_CONF_OPTS += --disable-wavpack
>  endif
>  
>  define MPD_INSTALL_EXTRA_FILES
> -	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
> -		$(INSTALL) -D package/mpd/mpd.conf \
> -			$(TARGET_DIR)/etc/mpd.conf; \
> -	fi
> +	$(INSTALL) -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf

Maybe nice to make the access rights explicit with -m 0644, no?

Regards,
Yann E. MORIN.

>  endef
>  
>  MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
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
