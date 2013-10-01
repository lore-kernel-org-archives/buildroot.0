From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  1 Oct 2013 11:59:31 +0200
Subject: [Buildroot] [PATCH 1/1] zsh: new package
Message-ID: <1380621571-21921-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/Config.in     |    1 +
 package/zsh/Config.in |   10 ++++++++++
 package/zsh/zsh.mk    |   14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/zsh/Config.in
 create mode 100644 package/zsh/zsh.mk

diff --git a/package/Config.in b/package/Config.in
index 86fbce2..0cbcbda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -921,6 +921,7 @@ source "package/at/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bash/Config.in"
 source "package/dash/Config.in"
+source "package/zsh/Config.in"
 endif
 source "package/dialog/Config.in"
 source "package/dtach/Config.in"
diff --git a/package/zsh/Config.in b/package/zsh/Config.in
new file mode 100644
index 0000000..fd63aa9
--- /dev/null
+++ b/package/zsh/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ZSH
+	bool "zsh"
+	select BR2_PACKAGE_NCURSES
+	help
+	  zsh is a shell designed for interactive use, although it is also
+	  a powerful scripting language. Many of the useful features of bash,
+	  ksh, and tcsh were incorporated into zsh; many original features
+	  were added.
+
+	  http://zsh.sourceforge.net/
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
new file mode 100644
index 0000000..ca865a4
--- /dev/null
+++ b/package/zsh/zsh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# zsh
+#
+################################################################################
+
+ZSH_VERSION=5.0.2
+ZSH_SITE=http://downloads.sourceforge.net/project/zsh/zsh/$(ZSH_VERSION)
+ZSH_LICENSE = MIT-like
+ZSH_LICENSE_FILES = LICENCE
+
+ZSH_DEPENDENCIES = ncurses
+
+$(eval $(autotools-package))
-- 
1.7.10.4
