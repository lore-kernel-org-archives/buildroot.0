From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 23:29:46 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150305232946.3620697e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  5 Mar 2015 17:44:09 -0300, Gustavo Zacarias wrote:
> Now with support for AD DC, ADS and clustering features.
> All dropped patches are upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Ok, I'm going to be annoying on this one, but since this is something
we generally ask all developers to do, I think we should ask you to do
it too.

>  ifeq ($(BR2_PACKAGE_ACL),y)
> -	SAMBA4_CONF_OPTS += --with-acl-support
> -	SAMBA4_DEPENDENCIES += acl
> +SAMBA4_CONF_OPTS += --with-acl-support
> +SAMBA4_DEPENDENCIES += acl
>  else
> -	SAMBA4_CONF_OPTS += --without-acl-support
> +SAMBA4_CONF_OPTS += --without-acl-support
>  endif
>  
>  ifeq ($(BR2_PACKAGE_CUPS),y)
> -	SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
> -	SAMBA4_CONF_OPTS += --enable-cups
> -	SAMBA4_DEPENDENCIES += cups
> +SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
> +SAMBA4_CONF_OPTS += --enable-cups
> +SAMBA4_DEPENDENCIES += cups
>  else
> -	SAMBA4_CONF_OPTS += --disable-cups
> +SAMBA4_CONF_OPTS += --disable-cups
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBAIO),y)
> -	SAMBA4_CONF_OPTS += --with-aio-support
> -	SAMBA4_DEPENDENCIES += libaio
> +SAMBA4_CONF_OPTS += --with-aio-support
> +SAMBA4_DEPENDENCIES += libaio
>  else
> -	SAMBA4_CONF_OPTS += --without-aio-support
> +SAMBA4_CONF_OPTS += --without-aio-support
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
> -	SAMBA4_CONF_OPTS += --enable-avahi
> -	SAMBA4_DEPENDENCIES += avahi
> +SAMBA4_CONF_OPTS += --enable-avahi
> +SAMBA4_DEPENDENCIES += avahi
>  else
> -	SAMBA4_CONF_OPTS += --disable-avahi
> +SAMBA4_CONF_OPTS += --disable-avahi
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GAMIN),y)
> -	SAMBA4_CONF_OPTS += --with-fam
> -	SAMBA4_DEPENDENCIES += gamin
> +SAMBA4_CONF_OPTS += --with-fam
> +SAMBA4_DEPENDENCIES += gamin
>  else
> -	SAMBA4_CONF_OPTS += --without-fam
> +SAMBA4_CONF_OPTS += --without-fam
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GETTEXT),y)
> -	SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
> -	SAMBA4_DEPENDENCIES += gettext
> +SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
> +SAMBA4_DEPENDENCIES += gettext
>  else
> -	SAMBA4_CONF_OPTS += --without-gettext
> -endif
> -
> -ifeq ($(BR2_PACKAGE_GNUTLS),y)
> -	SAMBA4_CONF_OPTS += --enable-gnutls
> -	SAMBA4_DEPENDENCIES += gnutls
> -else
> -	SAMBA4_CONF_OPTS += --disable-gnutls
> +SAMBA4_CONF_OPTS += --without-gettext
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM)$(BR2_PACKAGE_NCURSES_TARGET_MENU)$(BR2_PACKAGE_NCURSES_TARGET_PANEL),yyy)
> -	SAMBA4_DEPENDENCIES += ncurses
> +SAMBA4_DEPENDENCIES += ncurses
>  else
> -	SAMBA4_CONF_OPTS += --without-regedit
> +SAMBA4_CONF_OPTS += --without-regedit
>  endif

This cleanup of the indentation is definitely good, but has nothing to
do with the bump to 4.2.0. It should be part of a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
