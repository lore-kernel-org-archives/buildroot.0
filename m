From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:52:49 +0200
Subject: [Buildroot] [git commit] package/dbus: select SELinux module
Message-ID: <20200904123951.B7C66801F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cea777f86a4b8ff1d67040b639004c8642f222b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the dbus SElinux module so that it will be compiled in the
refpolicy. This way, if an SELinux policy is generated, dbus will be
supported.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus/dbus.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 3c67625688..70f2c6fef4 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -20,6 +20,8 @@ endef
 
 DBUS_DEPENDENCIES = host-pkgconf expat
 
+DBUS_SELINUX_MODULES = dbus
+
 DBUS_CONF_OPTS = \
 	--with-dbus-user=dbus \
 	--disable-tests \
