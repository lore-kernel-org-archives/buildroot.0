From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 20:48:08 -0700
Subject: [Buildroot] [PATCH] package: add mosh 1.2.4
In-Reply-To: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426736888-29437-6-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/Config.in      |  1 +
 package/mosh/Config.in | 15 +++++++++++++++
 package/mosh/mosh.mk   | 14 ++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/mosh/Config.in
 create mode 100644 package/mosh/mosh.mk

diff --git a/package/Config.in b/package/Config.in
index 95ec454..950d36b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1153,6 +1153,7 @@ endif
 	source "package/modem-manager/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
+	source "package/mosh/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
new file mode 100644
index 0000000..a05c711
--- /dev/null
+++ b/package/mosh/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MOSH
+	bool "mosh"
+	select BR2_PACKAGE_OPENSSH
+	select BR2_PACKAGE_PERL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_PERL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Remote terminal application that allows roaming, supports intermittent
+	  connectivity, and provides intelligent local echo and line editing of
+	  user keystrokes.
+
+	  Mosh is a replacement for SSH. It's more robust and responsive,
+	  especially over Wi-Fi, cellular, and long-distance links.
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
new file mode 100644
index 0000000..c4f2c07
--- /dev/null
+++ b/package/mosh/mosh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# mosh
+#
+################################################################################
+
+MOSH_VERSION = 1.2.4
+MOSH_SITE = http://mosh.mit.edu
+MOSH_SOURCES = mosh-$(MOSH_VERSION).tar.gz
+MOSH_DEPENDENCIES = host-protobuf-c ncurses openssh openssl perl protobuf zlib
+MOSH_LICENSE = GPLv3+
+MOSH_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.3.3
