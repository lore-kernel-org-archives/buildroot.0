From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 23 Nov 2007 14:50:53 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <20071123114301.6B7493004A@busybox.net>
References: <20071123114301.6B7493004A@busybox.net>
Message-ID: <4746CCAD.4030909@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2007-11-23 03:42:59 -0800 (Fri, 23 Nov 2007)
> New Revision: 20494
> 
> Log:
> Fix target install, install helper programs as well as strip executables
> 
> +	$(MAKE) DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIP)' \
> +		initdir=/etc/init.d -C $(DBUS_DIR)/dbus install-strip
> +	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0 \
> +		$(TARGET_DIR)/usr/lib/libdbus-1.la \
> +		$(TARGET_DIR)/usr/include/dbus-1.0 \
> +		$(TARGET_DIR)/usr/lib/pkgconfig

Hi jacmet,

Are you sure that you need to remove $(TARGET_DIR)/usr/lib/pkgconfig
there could be other *.pc as well?

Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
