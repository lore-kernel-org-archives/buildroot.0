From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 18:55:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/screen: add linux-pam optional
 dependency
In-Reply-To: <20200321174546.195830-1-fontaine.fabrice@gmail.com>
References: <20200321174546.195830-1-fontaine.fabrice@gmail.com>
Message-ID: <20200321175519.GI4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-21 18:45 +0100, Fabrice Fontaine spake thusly:
> linux-pam is an optional dependency for more than 5 years:
> https://git.savannah.gnu.org/cgit/screen.git/commit/src/configure.ac?h=screen-v4&id=a8dc1fb5b47ee52c79884fc5270805a3a39cda4a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/screen/screen.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 055dc015c0..c1705f742d 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -14,6 +14,13 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
>  SCREEN_CONF_OPTS = --enable-colors256
>  SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +SCREEN_DEPENDENCIES += linux-pam
> +SCREEN_CONF_OPTS += --enable-pam
> +else
> +SCREEN_CONF_OPTS += --disable-pam
> +endif
> +
>  define SCREEN_INSTALL_SCREENRC
>  	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
>  endef
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
