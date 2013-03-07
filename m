From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Mar 2013 17:17:21 -0300
Subject: [Buildroot] [PATCH] packages/flex: remove unnecessary
	BR2_PACKAGE_FLEX_LIBFL
Message-ID: <1362687441-500-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_FLEX_LIBFL knob was removed by
bd72a13a4ca3033bacbaf9e9a2b424acf149f83d so remove it from the packages
that used it since it's completely unnecessary.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gob2/Config.in        | 1 -
 package/ipsec-tools/Config.in | 1 -
 package/libcue/Config.in      | 1 -
 package/linux-pam/Config.in   | 1 -
 package/radvd/Config.in       | 1 -
 5 files changed, 5 deletions(-)

diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index cbe30d6..4a09c41 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GOB2
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_BISON
 	help
 	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 6f6dc37..06a5a56 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
diff --git a/package/libcue/Config.in b/package/libcue/Config.in
index e5e2e16..6121746 100644
--- a/package/libcue/Config.in
+++ b/package/libcue/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBCUE
 	bool "libcue"
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	help
 	  CUE Sheet Parser Library
 
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 7cfd814..7a4ae94 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	help
 	  A Security Framework that Provides Authentication for Applications
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index d0d9d70..98dbae2 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RADVD
 	# libdaemon uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_LIBDAEMON
 	depends on BR2_INET_IPV6
 	help
-- 
1.8.1.5
