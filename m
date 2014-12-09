From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 Dec 2014 15:39:01 +0000
Subject: [Buildroot] [PATCH 1/1] screen: add support for 256 colors
In-Reply-To: <1418138819-19772-1-git-send-email-tbultel@free.fr>
References: <1418138819-19772-1-git-send-email-tbultel@free.fr>
Message-ID: <54871795.2010403@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On 12/09/2014 03:26 PM, Thierry Bultel wrote:

>  define SCREEN_INSTALL_SCREENRC
> -	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
> +	if [ ! -f $(TARGET_DIR)/etc/screenrc ]; then \
> +		$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc; \
> +	fi
>  endef
>  
>  SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC

This part is not related with adding support for 256 colors, so, why
don't you send a separate patch for it? Or at least, state in your
commit message you are fixing a little issue with the 'screenrc' file
installation. But I would say that a separate patch would be better.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
