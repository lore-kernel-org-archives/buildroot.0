From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 15 Sep 2014 14:26:42 +0200
Subject: [Buildroot] [PATCH v2 2/2] Revert "libffi and python: need threads
	support"
In-Reply-To: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
References: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410784002-8659-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot now add a patch to libffi to fix support of threads. Thus, this
patch, is no more needed.

This reverts commit 77cf5b5a71aa54039f4dbc509a1c7cb40aa04934.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libffi/Config.in  | 4 ----
 package/python/Config.in  | 5 ++---
 package/python3/Config.in | 5 ++---
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 6edf570..7211f8f 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
@@ -8,6 +7,3 @@ config BR2_PACKAGE_LIBFFI
 	  interface description at run-time.
 
 	  http://sourceware.org/libffi/
-
-comment "libffi needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python/Config.in b/package/python/Config.in
index 8b27630..a0c78c6 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -3,16 +3,15 @@ config BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
 
 	  http://www.python.org/
 
-comment "python needs a toolchain w/ wchar, threads"
+comment "python needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_PYTHON
 
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 375390f..3e193c8 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -4,16 +4,15 @@ config BR2_PACKAGE_PYTHON3
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
 
 	  http://www.python.org/
 
-comment "python3 needs a toolchain w/ wchar, threads"
+comment "python3 needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_PYTHON3
 
-- 
1.9.1
