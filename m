From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:49:03 +0100
Subject: [Buildroot] [PATCHv3 62/74] fluxbox: install session file
 unconditionally
In-Reply-To: <1417357142-14307-63-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-63-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130174903.GR4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/fluxbox/fluxbox.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
> index 21901d6..a0f9367 100644
> --- a/package/fluxbox/fluxbox.mk
> +++ b/package/fluxbox/fluxbox.mk
> @@ -24,8 +24,8 @@ FLUXBOX_CONF_OPTS += --disable-imlib2
>  endif
>  
>  define FLUXBOX_INSTALL_XSESSION_FILE
> -	[ -f $(TARGET_DIR)/root/.xsession ] || $(INSTALL) -m 0755 -D \
> -		package/fluxbox/xsession $(TARGET_DIR)/root/.xsession
> +	$(INSTALL) -m 0755 -D package/fluxbox/xsession \
> +		$(TARGET_DIR)/root/.xsession
>  endef
>  
>  FLUXBOX_POST_INSTALL_TARGET_HOOKS += FLUXBOX_INSTALL_XSESSION_FILE
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
