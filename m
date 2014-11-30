From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:53:16 +0100
Subject: [Buildroot] [PATCHv3 64/74] samba: install configuration file
 unconditionally
In-Reply-To: <1417357142-14307-65-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-65-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130175316.GT4124@free.fr>
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
>  package/samba/samba.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/samba/samba.mk b/package/samba/samba.mk
> index 92bbe4e..0e4db95 100644
> --- a/package/samba/samba.mk
> +++ b/package/samba/samba.mk
> @@ -177,10 +177,7 @@ SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
>  endif
>  
>  define SAMBA_INSTALL_CONFIG
> -	# install config
> -	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
> -		$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
> -	fi
> +	$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf
>  endef
>  
>  SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_CONFIG
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
