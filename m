From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 11:14:49 +0200
Subject: [Buildroot] [PATCH 2/4] package/python-pyicu: needs host gcc >= 4.8
	for icu support
Message-ID: <20170610091449.28939-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pyicu/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index efab0853e..2d9624c11 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYICU
 	bool "python-pyicu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
@@ -9,7 +10,8 @@ config BR2_PACKAGE_PYTHON_PYICU
 
 	  https://github.com/ovalhub/pyicu
 
-comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
-- 
2.11.0
