From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 24 May 2021 20:56:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bluezero: select dbus
Message-ID: <20210524185617.10260-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build is broken since commit
8bdc5e7c4d975193b1e18999ed840507cea63bd6 because BR2_PACKAGE_DBUS_PYTHON
is selected without selecting BR2_PACKAGE_DBUS

Fixes:
 - http://autobuild.buildroot.org/results/378dd714940440b8f9db763479ae929e90e33b80

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-bluezero/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index 7126b3ca50..c391bfa858 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_DBUS_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_GOBJECT # runtime
 	help
-- 
2.30.2
