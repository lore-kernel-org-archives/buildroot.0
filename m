From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri,  3 Jul 2015 15:11:20 +0200
Subject: [Buildroot] [PATCH 1/7] Add package check: unit test library
In-Reply-To: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1435929086-21205-2-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
 package/Config.in        |  1 +
 package/check/Config.in  |  7 +++++++
 package/check/check.hash |  2 ++
 package/check/check.mk   | 20 ++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/check/Config.in
 create mode 100644 package/check/check.hash
 create mode 100644 package/check/check.mk

diff --git a/package/Config.in b/package/Config.in
index 13a7e74..72ec372 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1014,6 +1014,7 @@ menu "Other"
 	source "package/atf/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/check/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
diff --git a/package/check/Config.in b/package/check/Config.in
new file mode 100644
index 0000000..8e7e3bc
--- /dev/null
+++ b/package/check/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_CHECK
+	bool "host check"
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_PKGCONF
+	help
+	  Unit testing framework for C
+	  http://check.sourceforge.net/
diff --git a/package/check/check.hash b/package/check/check.hash
new file mode 100644
index 0000000..7d7e19b
--- /dev/null
+++ b/package/check/check.hash
@@ -0,0 +1,2 @@
+# Hash from: http://downloads.sourceforge.net/project/check/check/check-0.9.14.tar.gz
+sha1	4b79e2d485d014ddb438e322b64235347d57b0ff	check-0.9.14.tar.gz
diff --git a/package/check/check.mk b/package/check/check.mk
new file mode 100644
index 0000000..3c2021c
--- /dev/null
+++ b/package/check/check.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# check
+#
+################################################################################
+
+CHECK_VERSION = 0.9.14
+CHECK_SOURCE = check-$(CHECK_VERSION).tar.gz
+CHECK_SITE = http://downloads.sourceforge.net/project/check/check/$(CHECK_VERSION)/
+
+CHECK_DEPENDENCIES = libtool pkgconf
+
+CHECK_INSTALL_STAGING = YES
+CHECK_INSTALL_TARGET = NO
+
+CHECK_LICENSE =  LGPLv2.1
+CHECK_LICENSE_FILES = COPYING.LESSER
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
