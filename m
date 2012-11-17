From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 17 Nov 2012 09:12:50 +0100
Subject: [Buildroot] [PATCH] python: uses fork(),
	only available on MMU platforms
Message-ID: <1353139970-25414-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/1738a8b09b04d2b2fc1de6d1ff5eb0363fed6348/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/python/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..4089cce 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON
 	bool "python"
 	depends on BR2_USE_WCHAR
+	# uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
-- 
1.7.9.5
