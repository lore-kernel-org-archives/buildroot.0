From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:25:13 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/dnsmasq: fix
 build with ubus and NLS
Message-ID: <20200314171827.5C4C6837B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0df24d8c44ccd231d73c84aef523390e752dd98b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/c0b27754b7ede024c095bdf0b3616e6f6be48c6d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5c4d9c644a45549cd2a26501d4169bbaac2169e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-fix-i18n-build-with-ubus.patch   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/dnsmasq/0001-Makefile-fix-i18n-build-with-ubus.patch b/package/dnsmasq/0001-Makefile-fix-i18n-build-with-ubus.patch
new file mode 100644
index 0000000000..e42549beac
--- /dev/null
+++ b/package/dnsmasq/0001-Makefile-fix-i18n-build-with-ubus.patch
@@ -0,0 +1,33 @@
+From 08572cffb641004d86072f12aec4d6489454b897 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 21 Jun 2019 09:26:20 +0200
+Subject: [PATCH] Makefile: fix i18n build with ubus
+
+Commit caf4d571e6d86285a3690cfcc8de9c5f394320a8 forgot adding
+ubus_libs to build_libs for all-i18n target
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c0b27754b7ede024c095bdf0b3616e6f6be48c6d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to simon at thekelleys.org.uk]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 3fb7cbe..78e25f0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -111,7 +111,7 @@ all-i18n : $(BUILDDIR)
+  top="$(top)" \
+  i18n=-DLOCALEDIR=\'\"$(LOCALEDIR)\"\' \
+  build_cflags="$(version) $(dbus_cflags) $(idn2_cflags) $(idn_cflags) $(ct_cflags) $(lua_cflags) $(nettle_cflags)" \
+- build_libs="$(dbus_libs) $(idn2_libs) $(idn_libs) $(ct_libs) $(lua_libs) $(sunos_libs) $(nettle_libs) $(gmp_libs)"  \
++ build_libs="$(dbus_libs) $(idn2_libs) $(idn_libs) $(ct_libs) $(lua_libs) $(sunos_libs) $(nettle_libs) $(gmp_libs) $(ubus_libs)"  \
+  -f $(top)/Makefile dnsmasq
+ 	for f in `cd $(PO); echo *.po`; do \
+ 		cd $(top) && cd $(BUILDDIR) && $(MAKE) top="$(top)" -f $(top)/Makefile $${f%.po}.mo; \
+-- 
+2.14.1
+
