From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 May 2015 09:39:45 +0200
Subject: [Buildroot] [git commit] python: needs dynamic library support
Message-ID: <20150502073952.AF2907F9D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b4d18dd1cc33c4cfd62a20704f4c48d2097c9c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/7a0/7a044d5c8bf7526fcf4f0ec80a2b9b18d1f632a1/
http://autobuild.buildroot.net/results/27f/27ff12127dee3b1a8df86ef8b05681d695b2cac8/
http://autobuild.buildroot.net/results/7ce/7ce78169b661dcd6c04dc3ee5b1877c0de09f91d/
http://autobuild.buildroot.net/results/e58/e583583bc0ba4aff84d896fb7e6caf4793e03eb9/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 1a78f17..fa83e77 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,6 +1,6 @@
-comment "python needs a toolchain w/ wchar, threads"
+comment "python needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PYTHON
 	bool "python"
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON
 	# uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
