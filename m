From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Dec 2015 19:24:01 +0100
Subject: [Buildroot] [PATCH v2] qt5/qt5webchannel: add qwebchannel.js
 installation in /var/www
In-Reply-To: <1450890245-16195-1-git-send-email-corjon.j@ecagroup.com>
References: <1450890245-16195-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20151223182401.GA3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2015-12-23 18:04 +0100, Julien Corjon spake thusly:
> To use webchannel in an application qwebchannel.js is needed but this file was not
> installed.
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I was having a look at our current package, and there's
something really odd that struck me. If the Qt5base examples are
enabled, then we define QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES but we
never use it.

As it seems you're using qt5webchannels, would you care having a look at
this examples stuff, please?

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Replace installation path choise with /var/www (suggested by Thomas)
> ---
>  package/qt5/qt5webchannel/qt5webchannel.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
> index cfb6da9..bd4257f 100644
> --- a/package/qt5/qt5webchannel/qt5webchannel.mk
> +++ b/package/qt5/qt5webchannel/qt5webchannel.mk
> @@ -35,6 +35,11 @@ define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
>  	$(QT5_LA_PRL_FILES_FIXUP)
>  endef
>  
> +define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
> +        $(INSTALL) -m 0644 -D $(@D)/src/webchannel/qwebchannel.js \
> +		$(TARGET_DIR)/var/www/qwebchannel.js
> +endef
> +
>  ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
>  define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
>  	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebChannel $(TARGET_DIR)/usr/qml/
> @@ -56,6 +61,7 @@ endif
>  define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
>  	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
>  	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
> +	$(QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.5.0
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
