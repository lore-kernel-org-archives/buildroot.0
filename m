From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:30:30 +0200
Subject: [Buildroot] [git commit] connman: fix missing dbus configuration
	files
Message-ID: <20151017143123.3CBC881D54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bed86b001967b29285fb462611455ef47fe70b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without connman.conf in /etc/dbus-1/system.d/, connmand cannot take
its name on the dbus system bus and will fail to start with a
permission denied error.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/connman.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 87d81ce..3b14a80 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -12,6 +12,7 @@ CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPTS += \
+	--with-dbusconfdir=/etc \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
