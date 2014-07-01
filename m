From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 13:04:11 +0200
Subject: [Buildroot] [git commit] pwgen: new package
Message-ID: <20140701113220.F39F19D131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfbabec6ec7b3e50f755ad5f67af7c86d10a6b41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add _LICENSE_FILES]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/pwgen/Config.in |    7 +++++++
 package/pwgen/pwgen.mk  |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3f3b8d2..0e454dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1133,6 +1133,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
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
index 0000000..cdc2fd3
--- /dev/null
+++ b/package/pwgen/pwgen.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# pwgen
+#
+################################################################################
+
+PWGEN_VERSION = 2.06
+PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
+PWGEN_LICENSE = GPLv2
+PWGEN_LICENSE_FILES = debian/copyright
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
