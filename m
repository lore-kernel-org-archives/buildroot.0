From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Dec 2011 22:11:08 +0100
Subject: [Buildroot] [git commit] package: add libesmtp
Message-ID: <20111221220349.CD52A8FAAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9326c9aabac95d43ac10937ff5ff2b4c2437eb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a library for sending email through SMTP.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/libesmtp/Config.in   |    6 ++++++
 package/libesmtp/libesmtp.mk |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index adebd4b..b6df18a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -336,6 +336,7 @@ source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
+source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
new file mode 100644
index 0000000..4e9e455
--- /dev/null
+++ b/package/libesmtp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBESMTP
+	bool "libesmtp"
+	help
+	  Library for sending emails through SMTP.
+
+	  http://www.stafford.uklinux.net/libesmtp
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
new file mode 100644
index 0000000..63f3192
--- /dev/null
+++ b/package/libesmtp/libesmtp.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libesmtp
+#
+#############################################################
+LIBESMTP_VERSION = 1.0.6
+LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
+LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
+LIBESMTP_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
