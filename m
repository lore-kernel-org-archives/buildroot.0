From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 24 Mar 2017 18:19:55 +0530
Subject: [Buildroot] [PATCH 6/6] libubox: enable static build
In-Reply-To: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1490359795-18362-6-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upstream has added the support to build the static libraries.
update comment for BR2_STATIC_LIBS for other packages having
dependency on libubox.

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 package/libubox/Config.in     | 4 ----
 package/ubus/Config.in        | 2 +-
 package/ustream-ssl/Config.in | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/libubox/Config.in b/package/libubox/Config.in
index 25ef4bb..ba10f8d 100644
--- a/package/libubox/Config.in
+++ b/package/libubox/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBUBOX
 	bool "libubox"
-	depends on !BR2_STATIC_LIBS
 	help
 	  This library originates from the OpenWrt project to
 	  handle the configuration file infrastructure, but can
@@ -8,6 +7,3 @@ config BR2_PACKAGE_LIBUBOX
 	  than OpenWrt.
 
 	  http://nbd.name/gitweb.cgi?p=luci2/libubox.git;a=summary
-
-comment "libubox needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index c14f6a8..84e13f8 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_UBUS
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
-	depends on !BR2_STATIC_LIBS # libubox
+	depends on !BR2_STATIC_LIBS
 	help
 	  IPC/RPC bus that allows communication between processes.
 
diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index 540e436..a12c37b 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_USTREAM_SSL
 	bool "ustream-ssl"
-	depends on !BR2_STATIC_LIBS #libubox
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
-- 
2.6.2
