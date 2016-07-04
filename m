From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:44:36 +0200
Subject: [Buildroot] [git commit] package/qjson: not available for static
	builds
Message-ID: <20160704214456.338F68041E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f800b6610fb4f743b02df75a137991b5cac112a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/ffa/ffa343702727e118bb98b9c273bd0605de7e75e2/
    http://autobuild.buildroot.org/results/3ca/3ca05b777789c58b0621a100490373416846aa87/
    http://autobuild.buildroot.org/results/a4f/a4f3f9c79731c69082f70c3841c012c576517921/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: don't mention the qt4/5 dependency in the comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qjson/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qjson/Config.in b/package/qjson/Config.in
index 0f0cc09..5c423bf 100644
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
+comment "qjson needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
