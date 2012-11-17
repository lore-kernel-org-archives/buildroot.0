From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 17 Nov 2012 09:38:59 +0100
Subject: [Buildroot] [PATCH] python3: uses fork(),
	only available on MMU platforms
Message-ID: <1353141539-26456-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/python3/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 4f5e67d..4341877 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PYTHON3
 	bool "python3"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
+	# uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
-- 
1.7.9.5
