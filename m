From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Nov 2018 19:06:48 +0100
Subject: [Buildroot] [PATCH/next 1/3] keepalived: remove popt dependency
Message-ID: <20181119180650.30516-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

popt is not needed since version 1.3.1 and:
https://github.com/acassen/keepalived/commit/3452517c4f2b69badabf19fc06cc56db49d37603

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/Config.in     | 1 -
 package/keepalived/keepalived.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index 0140e62ae2..c71821545c 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_KEEPALIVED
 	depends on !BR2_STATIC_LIBS # uses libdl
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_POPT
 	help
 	  The main goal of the keepalived project is to add a strong &
 	  robust keepalive facility to the Linux Virtual Server
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index e8a280a19c..8756811e04 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -6,7 +6,7 @@
 
 KEEPALIVED_VERSION = 1.4.2
 KEEPALIVED_SITE = http://www.keepalived.org/software
-KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
+KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 # 0001-configure.ac-do-not-force-PIE.patch
-- 
2.17.1
