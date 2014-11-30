From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:08:40 +0100
Subject: [Buildroot] [PATCHv3 35/74] gnupg: don't both removing a man
	page
In-Reply-To: <1417357142-14307-36-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-36-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130170840.GO4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> The target-finalize target in the main Makefile removes
> $(TARGET_DIR)/usr/share/man entirely, so there's no point in having
> some package specific logic to remove man pages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In title:  s/both/bother/

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gnupg/gnupg.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
> index e7c403a..c0bf88c 100644
> --- a/package/gnupg/gnupg.mk
> +++ b/package/gnupg/gnupg.mk
> @@ -39,8 +39,7 @@ endif
>  
>  ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
>  define GNUPG_REMOVE_GPGV
> -	rm -f $(TARGET_DIR)/usr/bin/gpgv \
> -		$(TARGET_DIR)/usr/share/man/man1/gpgv.1
> +	rm -f $(TARGET_DIR)/usr/bin/gpgv
>  endef
>  GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGV
>  endif
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
