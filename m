From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 May 2021 15:42:20 +0300
Subject: [Buildroot] [PATCH] package/libesmtp: move SITE to s.b.n
Message-ID: <1e5b1cb87073bca9b79ce1d4083c88942270516d.1622119340.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original site is gone, and the author is no longer providing
tarballs:

  https://libesmtp.github.io/notes.html

Change website link to the current official page.

Fixes:
http://autobuild.buildroot.net/results/d788315bf708c31e14ba5fb35dccf94753d5f78a/
http://autobuild.buildroot.net/results/83bfdd8e5f897b4d4be81c4c16106feb4e17bd50/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libesmtp/Config.in   | 2 +-
 package/libesmtp/libesmtp.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index f3ed521d220e..db2dc8ec9c1e 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBESMTP
 	help
 	  Library for sending emails through SMTP.
 
-	  http://brianstafford.info/libesmtp
+	  https://libesmtp.github.io
 
 comment "libesmtp needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index dcffaceddc3c..1f5cdec1918b 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -6,7 +6,7 @@
 
 LIBESMTP_VERSION = 1.0.6
 LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
-LIBESMTP_SITE = http://brianstafford.info/libesmtp
+LIBESMTP_SITE = http://sources.buildroot.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
-- 
2.30.2
