From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 15:59:28 +0100
Subject: [Buildroot] [PATCHv3 09/74] portmap: improve installation of
 binaries
In-Reply-To: <1417357142-14307-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130145928.GN4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> This commit explicits the permissions with which executables are
> installed, and also makes sure that the build is aborted is one of the
                                                           ^^
s/is/if/

> binary cannot be installed, instead of silently ignoring the error.

binaries

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/portmap/portmap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
> index d5d43bf..65ee551 100644
> --- a/package/portmap/portmap.mk
> +++ b/package/portmap/portmap.mk
> @@ -22,7 +22,7 @@ endef
>  
>  define PORTMAP_INSTALL_TARGET_CMDS
>  	for sbin in $(PORTMAP_SBINS); do \
> -		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
> +		$(INSTALL) -D -m 0755 $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin || exit 1; \
>  	done
>  endef
>  
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
