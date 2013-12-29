From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 18:50:52 +0100
Subject: [Buildroot] [PATCHv2 3/4] grub: align splashscreen handling
 with iso9660 code
In-Reply-To: <1388338428-19833-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388338428-19833-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131229175052.GM3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-29 18:33 +0100, Thomas Petazzoni spake thusly:
> This commit aligns the Grub handling of the splash screen with what is
> done in the ISO9660 code.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see below...

> diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
> index 3be4a74..d22df88 100644
> --- a/boot/grub/grub.mk
> +++ b/boot/grub/grub.mk
> @@ -82,7 +82,10 @@ GRUB_CONF_OPT = \
>  ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
>  define GRUB_INSTALL_SPLASH
>  	cp boot/grub/splash.xpm.gz $(TARGET_DIR)/boot/grub/
> -	$(SED) 's/^#splashimage/splashimage/' $(TARGET_DIR)/boot/grub/menu.lst
> +endef
> +else
> +define GRUB_INSTALL_SPLASH
> +	$(SED) '/^splashimage/d' $(TARGET_DIR)/boot/grub/menu.lst

Here you already use '/^splashimage/d' so it's not really at-par with
the code in iso9660. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
