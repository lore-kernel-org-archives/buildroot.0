From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 08:46:25 +0200
Subject: [Buildroot] [git commit] python3: move toolchain comment above main
	option
Message-ID: <20150428065522.6906781D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7beb9ed0fd1afafae9356a6297a02d6026d3d0f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So suboptions are correctly indented.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index e2f9077..f61401e 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,3 +1,7 @@
+comment "python3 needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
 	depends on !BR2_PACKAGE_PYTHON
@@ -11,10 +15,6 @@ config BR2_PACKAGE_PYTHON3
 
 	  http://www.python.org/
 
-comment "python3 needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_PYTHON3
 
 choice
