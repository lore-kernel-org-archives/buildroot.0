From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 May 2015 09:39:45 +0200
Subject: [Buildroot] [git commit] python: move toolchain comment above main
	option
Message-ID: <20150502073952.96C878082B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4d19a0995528c41082e5617f35541c843bee923
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So suboptions are correctly indented.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 8d71dc9..1a78f17 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,3 +1,7 @@
+comment "python needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_PYTHON
 	bool "python"
 	depends on BR2_USE_WCHAR
@@ -10,10 +14,6 @@ config BR2_PACKAGE_PYTHON
 
 	  http://www.python.org/
 
-comment "python needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_PYTHON
 
 choice
