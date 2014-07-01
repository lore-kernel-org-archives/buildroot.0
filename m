From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jun 2014 21:44:05 -0300
Subject: [Buildroot] [PATCH] pwgen: new package
Message-ID: <1404175445-4316-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |  1 +
 package/pwgen/Config.in |  7 +++++++
 package/pwgen/pwgen.mk  | 12 ++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/pwgen/Config.in
 create mode 100644 package/pwgen/pwgen.mk

diff --git a/package/Config.in b/package/Config.in
index 1282c8a..9900271 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1137,6 +1137,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
 	source "package/psmisc/Config.in"
 endif
+	source "package/pwgen/Config.in"
 	source "package/quota/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
diff --git a/package/pwgen/Config.in b/package/pwgen/Config.in
new file mode 100644
index 0000000..7bbc1d6
--- /dev/null
+++ b/package/pwgen/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PWGEN
+	bool "pwgen"
+	help
+	  Pwgen is a small, GPL'ed password generator which creates passwords
+	  which can be easily memorized by a human.
+
+	  http://sourceforge.net/projects/pwgen/
diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
new file mode 100644
index 0000000..f0e66d2
--- /dev/null
+++ b/package/pwgen/pwgen.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# pwgen
+#
+################################################################################
+
+PWGEN_VERSION = 2.06
+PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
+PWGEN_LICENSE = GPLv2
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.5.5
