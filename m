From: qblade <qblade@protonmail.com>
Date: Sat, 03 Apr 2021 13:37:47 +0000
Subject: [Buildroot] [PATCH 1/2] package: add libtsm
Message-ID: <ABy9Rw02E7bRIqk4kspFrsBCVKgcsk8twRlSzxBSqDAizVWbIC7N_ga3QqdQsGYF9W8EsIwiSPRke5umgfNSHX0ktDtqWmQ9hndkCKukfZs=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: qblade <qblade@protonmail.com>
---
 package/libtsm/Config.in   | 10 ++++++++++
 package/libtsm/libtsm.hash |  4 ++++
 package/libtsm/libtsm.mk   | 14 ++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/libtsm/Config.in
 create mode 100644 package/libtsm/libtsm.hash
 create mode 100644 package/libtsm/libtsm.mk

diff --git a/package/libtsm/Config.in b/package/libtsm/Config.in
new file mode 100644
index 0000000000..03217dbc69
--- /dev/null
+++ b/package/libtsm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBTSM
+	bool "libtsm"
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  TSM is a state machine for DEC VT100-VT520
+	  compatible terminal emulators. It tries to
+	  support all common standards while keeping
+	  compatibility to existing emulators.
+
+	  https://github.com/Aetf/libtsm
diff --git a/package/libtsm/libtsm.hash b/package/libtsm/libtsm.hash
new file mode 100644
index 0000000000..0b6c01b1a0
--- /dev/null
+++ b/package/libtsm/libtsm.hash
@@ -0,0 +1,4 @@
+sha256 7bab5ac3b5709a3f0c9d43207e8be5651402034d31c96e58140423fce55eb6c9  libtsm-4.0.1.tar.gz
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE_htable
+sha256 47b3a15b5259545b866f33c302d485fe414c65917de179b33f411c2f8722c7da  COPYING
+sha256 3d2f828a7b462939e5278ec83c7663a9ebe50851fc64883a4f544ed04f12fe03  external/wcwidth/LICENSE.txt
diff --git a/package/libtsm/libtsm.mk b/package/libtsm/libtsm.mk
new file mode 100644
index 0000000000..2ed567f6f0
--- /dev/null
+++ b/package/libtsm/libtsm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libtsm
+#
+################################################################################
+
+LIBTSM_VERSION = 4.0.1
+LIBTSM_SITE = $(call github,Aetf,libtsm,v$(LIBTSM_VERSION))
+LIBTSM_INSTALL_STAGING = YES
+LIBTSM_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBTSM_LICENSE = BSD-2-Clause, MIT, LGPL-2.1+, ISC
+LIBTSM_LICENSE_FILES = COPYING LICENSE_htable external/wcwidth/LICENSE.txt
+
+$(eval $(cmake-package))
--
2.27.0
