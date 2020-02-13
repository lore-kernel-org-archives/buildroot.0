From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Feb 2020 23:36:42 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-pyparted: add locale
 dependency
Message-ID: <20200213223644.2346193-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b5f0c6efb24826641719c493382211e5d768417b forgot to propagate new
locale dependency from parted to python-pyparted

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyparted/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 944796ff31..60f54a5484 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPARTED
 	bool "python-pyparted"
+	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PARTED
 	help
@@ -7,5 +8,5 @@ config BR2_PACKAGE_PYTHON_PYPARTED
 
 	  https://github.com/rhinstaller/pyparted
 
-comment "pyparted needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "pyparted needs a toolchain w/ locale, wchar"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
-- 
2.24.1
