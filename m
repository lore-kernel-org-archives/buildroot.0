From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Wed, 11 Apr 2018 15:02:51 +0200
Subject: [Buildroot] [PATCH 1/1] adding new package: reaver
Message-ID: <1523451771-29353-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Generic autotools package, easy to cross-compile but it is mandatory
to use the t6x github fork (latest Makefiles set).

Tested and used on RPI1 & RPI3.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/Config.in        |  1 +
 package/reaver/Config.in |  8 ++++++++
 package/reaver/reaver.mk | 15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/reaver/Config.in
 create mode 100644 package/reaver/reaver.mk

diff --git a/package/Config.in b/package/Config.in
index e48d0b4..2da8605 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1823,6 +1823,7 @@ endif
 	source "package/quagga/Config.in"
 	source "package/rabbitmq-server/Config.in"
 	source "package/radvd/Config.in"
+	source "package/reaver/Config.in"
 	source "package/rp-pppoe/Config.in"
 	source "package/rpcbind/Config.in"
 	source "package/rsh-redone/Config.in"
diff --git a/package/reaver/Config.in b/package/reaver/Config.in
new file mode 100644
index 0000000..703fa28
--- /dev/null
+++ b/package/reaver/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_REAVER
+	bool "reaver"
+	
+	select BR2_PACKAGE_LIBPCAP
+
+	help
+		Reaver performs brute force attacks against WPS pin numbers.
+		It is recommended to use "Aircrack-ng" along reaver, but not necessary.
diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
new file mode 100644
index 0000000..8e4e3c6
--- /dev/null
+++ b/package/reaver/reaver.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# reaver
+#
+################################################################################
+
+REAVER_VERSION = 9bae55bd30b6d46b42da3a09dc23c8b0f9341996
+REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
+REAVER_LICENSE = GPL-2.0+
+REAVER_LICENSE_FILES = docs/LICENSE
+
+REAVER_SUBDIR = src
+REAVER_INSTALL_TARGET = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
