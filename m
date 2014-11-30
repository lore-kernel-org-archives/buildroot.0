From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 15:47:37 +0100
Subject: [Buildroot] [PATCHv3 04/74] radvd: use <pkg>_INSTALL_INIT_SYSV
In-Reply-To: <1417357142-14307-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130144737.GI4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> This commit changes the radvd to use the <pkg>_INSTALL_INIT_SYSV
> mechanism instead of using a post install target hook. We also use a
> full destination path when calling $(INSTALL).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/radvd/radvd.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
> index e0d4f69..e65d74a 100644
> --- a/package/radvd/radvd.mk
> +++ b/package/radvd/radvd.mk
> @@ -12,10 +12,8 @@ RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  # For radvd-01-drop-check.patch & radvd-02-drop-stack-protector.patch
>  RADVD_AUTORECONF = YES
>  
> -define RADVD_INSTALL_INITSCRIPT
> -	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
> +define RADVD_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d/S50radvd
>  endef
>  
> -RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
> -
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
