From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jul 2012 08:47:13 -0300
Subject: [Buildroot] [PATCH 1/2] beecrypt: needs threads support
Message-ID: <1341402434-30526-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e28e5dfe73d838b8bc4e9c586bc865d57d717f76/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/beecrypt/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 2673877..19c7f2f 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
 	help
 	  Beecrypt is a general-purpose cryptography library.
 
 	  http://beecrypt.sf.net
 
+comment "beecrypt needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "beecrypt C++ support requires a toolchain with WCHAR enabled"
-	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.8.6
