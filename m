From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:18:18 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-bluezero:
 select dbus
Message-ID: <20210607205546.5EF8E80AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6aa6df736e8a8c7bac6b3107ff4efe25136c436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build is broken since commit
8bdc5e7c4d975193b1e18999ed840507cea63bd6 because BR2_PACKAGE_DBUS_PYTHON
is selected without selecting BR2_PACKAGE_DBUS

Fixes:
 - http://autobuild.buildroot.org/results/378dd714940440b8f9db763479ae929e90e33b80

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4f79b1cb93757e23d74e748f94f15a65b363f887)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
