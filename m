From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:35:17 +0100
Subject: [Buildroot] [PATCHv3 54/74] dmraid: install init script
 unconditionally
In-Reply-To: <1417357142-14307-55-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-55-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130173517.GJ4124@free.fr>
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
>  package/dmraid/dmraid.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
> index 024b9b5..a6ed57f 100644
> --- a/package/dmraid/dmraid.mk
> +++ b/package/dmraid/dmraid.mk
> @@ -18,9 +18,8 @@ DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
>  DMRAID_DEPENDENCIES = lvm2
>  
>  define DMRAID_INSTALL_INIT_SYSV
> -	[ -f $(TARGET_DIR)/etc/init.d/S20dmraid ] || \
> -		$(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
> -			$(TARGET_DIR)/etc/init.d/S20dmraid
> +	$(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
> +		$(TARGET_DIR)/etc/init.d/S20dmraid
>  endef
>  
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
