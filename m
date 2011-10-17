From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2011 22:36:54 +0200
Subject: [Buildroot] [PATCH 3/9] Add openbox window manager
In-Reply-To: <1318603921-22899-4-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-4-git-send-email-will_wagner@carallon.com>
Message-ID: <20111017223654.5d1b9d9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 14 Oct 2011 15:51:55 +0100,
Will Wagner <will_wagner@carallon.com> a ?crit :

> +OPENBOX_VERSION:=3.4.11
> +OPENBOX_SOURCE:=openbox-$(OPENBOX_VERSION).tar.gz
> +OPENBOX_SITE:=http://openbox.org/dist/openbox/
> +
> +OPENBOX_DEPENDENCIES:=xlib_libX11 libglib2 pango libxml2

You should use = instead of :=, and put a space before and after =.

> +ifeq ($(BR2_PACKAGE_OPENBOX_SIMPLE),y)

Perhaps this should be called
BR2_PACKAGE_OPENBOX_INSTALL_SIMPLE_CONFIG ?

> +  define OPENBOX_SIMPLE_CONFIG

and OPENBOX_INSTALL_SIMPLE_CONFIG

> +    rm $(TARGET_DIR)/etc/xdg/openbox/menu.xml
> +    cp package/openbox/rc.xml $(TARGET_DIR)/etc/xdg/openbox/rc.xml

install -D -m 0644 package/openbox/rc.xml $(TARGET_DIR)/etc/xdg/openbox/rc.xml

> +    rm -rf $(TARGET_DIR)/usr/share/themes/*

Couldn't this possibly erase some 'themes' from other applications ?

> +    mkdir -p $(TARGET_DIR)/usr/share/themes/Clearlooks/openbox-3
> +    cp package/openbox/themerc $(TARGET_DIR)/usr/share/themes/Clearlooks/openbox-3/

install -D -m 0644 package/openbox/themerc $(TARGET_DIR)/usr/share/themes/Clearlooks/openbox-3/themerc

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
