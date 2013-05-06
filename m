From: Nathan Lynch <ntl@pobox.com>
Date: Mon,  6 May 2013 11:12:55 -0500
Subject: [Buildroot] [PATCH] chrony: new package
Message-ID: <1367856775-4502-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 package/Config.in        | 1 +
 package/chrony/Config.in | 5 +++++
 package/chrony/chrony.mk | 6 ++++++
 3 files changed, 12 insertions(+)
 create mode 100644 package/chrony/Config.in
 create mode 100644 package/chrony/chrony.mk

diff --git a/package/Config.in b/package/Config.in
index fe4f56b..d5719a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -670,6 +670,7 @@ source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/can-utils/Config.in"
+source "package/chrony/Config.in"
 source "package/connman/Config.in"
 source "package/crda/Config.in"
 source "package/ctorrent/Config.in"
diff --git a/package/chrony/Config.in b/package/chrony/Config.in
new file mode 100644
index 0000000..a42bd77
--- /dev/null
+++ b/package/chrony/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_CHRONY
+	bool "chrony"
+	help
+	  Chrony is a pair of programs which are used to maintain the
+	  accuracy of the system clock.
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
new file mode 100644
index 0000000..b9733f9
--- /dev/null
+++ b/package/chrony/chrony.mk
@@ -0,0 +1,6 @@
+CHRONY_VERSION = 1.27
+CHRONY_SITE = http://download.tuxfamily.org/chrony/
+CHRONY_LICENSE = GPLv2
+CHRONY_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.1.4
