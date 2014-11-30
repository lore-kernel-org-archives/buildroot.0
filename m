From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:18:13 +0100
Subject: [Buildroot] [PATCHv3 50/74] sound-theme-borealis: add error
 handling to for loop
In-Reply-To: <1417357142-14307-51-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-51-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171813.GD4124@free.fr>
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
>  package/sound-theme-borealis/sound-theme-borealis.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
> index a2f29a9..9242837 100644
> --- a/package/sound-theme-borealis/sound-theme-borealis.mk
> +++ b/package/sound-theme-borealis/sound-theme-borealis.mk
> @@ -11,7 +11,7 @@ SOUND_THEME_BOREALIS_SOURCE = \
>  
>  define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
>  	for f in $(@D)/*.ogg ; do \
> -		$(INSTALL) -D -m 0644 $$f $(TARGET_DIR)/usr/share/sounds/borealis/stereo/`basename $$f` ; \
> +		$(INSTALL) -D -m 0644 $$f $(TARGET_DIR)/usr/share/sounds/borealis/stereo/`basename $$f` || exit 1; \
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
