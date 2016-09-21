From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 21 Sep 2016 20:18:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/circus: fix Config.in missing
	operator in comment condition
Message-ID: <20160921181838.4921-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/circus/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index 3df41f5..94c59a4 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_CIRCUS
 
 comment "circus needs Python and a uClibc or glibc toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL || \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
-- 
2.10.0
