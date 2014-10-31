From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 31 Oct 2014 16:34:14 +0100
Subject: [Buildroot] [PATCH] dstat: propagate python dependencies
Message-ID: <1414769654-20569-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/dstat/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 62a392a..52fbb49 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DSTAT
 	bool "dstat"
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_USE_MMU # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	select BR2_PACKAGE_PYTHON
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
@@ -22,4 +23,4 @@ config BR2_PACKAGE_DSTAT
 
 comment "dstat needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
