From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2011 13:06:05 +0100
Subject: [Buildroot] [PATCH] Add package for Gnome NetworkManager
In-Reply-To: <4ED8BEB1.50500@gmail.com>
References: <1322824479-32767-1-git-send-email-zonque@gmail.com>
 <20111202130026.04528496@skate> <4ED8BEB1.50500@gmail.com>
Message-ID: <20111202130605.6f745c5a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 02 Dec 2011 13:04:01 +0100,
Daniel Mack <zonque@gmail.com> a ?crit :

> :) See the other thread. I solved it with a rmdir || echo "" for now,
> not to rely on the host's mkdir to have that particular feature.

It's already used in quite a few places in Buildroot:

$ git grep ignore-fail-on
package/hwdata/hwdata.mk:	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
package/libglib2/libglib2.mk:	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
package/libglib2/libglib2.mk:	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
package/logrotate/logrotate.mk:	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/logrotate.d
package/tinyhttpd/tinyhttpd.mk:	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/var/www

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
