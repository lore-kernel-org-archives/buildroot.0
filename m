From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 25 Sep 2012 10:41:13 -0500
Subject: [Buildroot] [PATCH] Added build configuration for Network UPS Tools
 (nut) package. Signed-off-by: Dallas Clement <dallas.a.clement@gmail.com>
Message-ID: <CAE9DZUTZPXWobHm=FYzE2Ph-CkLmtQ5CF4uHC54mqY2eiyJ8oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

package/Config.in     |    1 +
 package/nut/Config.in |    6 ++++++
 package/nut/nut.mk    |   10 ++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/nut/Config.in
 create mode 100644 package/nut/nut.mk

diff --git a/package/Config.in b/package/Config.in
index 083cad8..bf26419 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -590,6 +590,7 @@ source "package/noip/Config.in"
 source "package/ngircd/Config.in"
 source "package/ngrep/Config.in"
 source "package/ntp/Config.in"
+source "package/nut/Config.in"
 source "package/nuttcp/Config.in"
 source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
diff --git a/package/nut/Config.in b/package/nut/Config.in
new file mode 100644
index 0000000..18b2aed
--- /dev/null
+++ b/package/nut/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NUT
+       bool "nut"
+       help
+         Network UPS tools
+
+         www.networkupstools.org
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
new file mode 100644
index 0000000..7a0b7c6
--- /dev/null
+++ b/package/nut/nut.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# nut
+#
+#############################################################
+NUT_VERSION = 2.4.3
+NUT_SOURCE = nut-$(NUT_VERSION).tar.gz
+NUT_SITE = http://www.networkupstools.org/source/2.4/
+
+$(eval $(autotools-package))
