From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2020 09:09:15 +0100
Subject: [Buildroot] [git commit] package/python-pyparted: add locale
 dependency
Message-ID: <20200214080204.554738E095@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08f07b302eece221c8e8de19d225ba03e7bc89c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b5f0c6efb24826641719c493382211e5d768417b forgot to propagate new
locale dependency from parted to python-pyparted

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
