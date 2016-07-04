From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 23:26:22 +0200
Subject: [Buildroot] [PATCHv2] package/qjson: not available for static builds
Message-ID: <1467667582-2193-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/ffa/ffa343702727e118bb98b9c273bd0605de7e75e2/
    http://autobuild.buildroot.org/results/3ca/3ca05b777789c58b0621a100490373416846aa87/
    http://autobuild.buildroot.org/results/a4f/a4f3f9c79731c69082f70c3841c012c576517921/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - add comment  (Thomas)
---
 package/qjson/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qjson/Config.in b/package/qjson/Config.in
index 0f0cc09..711b345 100644
--- a/package/qjson/Config.in
+++ b/package/qjson/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_QJSON
 	bool "qjson"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	help
 	  QJson is a Qt-based library that maps JSON data to
 	  QVariant objects and vice versa.
 
 	  http://qjson.sourceforge.net
+
+comment "qjson needs qt4/5 and a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
-- 
2.7.4
