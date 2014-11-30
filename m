From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:13:08 +0100
Subject: [Buildroot] [PATCHv3 42/74] googlefontdirectory: add error
 handling to for loop
In-Reply-To: <1417357142-14307-43-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-43-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171308.GV4124@free.fr>
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
>  package/googlefontdirectory/googlefontdirectory.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
> index 076e654..0e60892 100644
> --- a/package/googlefontdirectory/googlefontdirectory.mk
> +++ b/package/googlefontdirectory/googlefontdirectory.mk
> @@ -16,7 +16,7 @@ define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
>  	for i in $(GOOGLEFONTDIRECTORY_FONTS); \
>  	do \
>  		$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$$i && \
> -		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf; \
> +		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf || exit 1; \
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
