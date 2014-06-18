From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Jun 2014 10:21:35 -0300
Subject: [Buildroot] [PATCH 1/3] dbus: don't forcibly disable static builds
Message-ID: <1403097697-15782-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's there for some historical reason and breaks libpcap with dbus
support for static linkage scenarios (like the one used by tcpreplay).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index f8824ee..fc446b1 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -24,7 +24,6 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--disable-selinux \
 		--disable-xml-docs \
 		--disable-doxygen-docs \
-		--disable-static \
 		--disable-dnotify \
 		--localstatedir=/var \
 		--with-xml=expat \
@@ -90,7 +89,6 @@ HOST_DBUS_CONF_OPT = \
 		--disable-selinux \
 		--disable-xml-docs \
 		--disable-doxygen-docs \
-		--disable-static \
 		--enable-dnotify \
 		--without-x \
 		--with-xml=expat
-- 
1.8.5.5
