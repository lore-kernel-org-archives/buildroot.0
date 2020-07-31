From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:32 +0200
Subject: [Buildroot] [PATCH 07/15] package/dbus: select SELinux module
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-8-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select the dbus SElinux module so that it will be compiled in the
refpolicy. This way, if an SELinux policy is generated, dbus will be
supported.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/dbus/dbus.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 3c6762568871..70f2c6fef48d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -20,6 +20,8 @@ endef
 
 DBUS_DEPENDENCIES = host-pkgconf expat
 
+DBUS_SELINUX_MODULES = dbus
+
 DBUS_CONF_OPTS = \
 	--with-dbus-user=dbus \
 	--disable-tests \
-- 
2.26.2
