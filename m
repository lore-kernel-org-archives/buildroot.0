From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 22:46:12 +0200
Subject: [Buildroot] [PATCH v2,1/2] package/xz: update license
Message-ID: <20190407204613.26544-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add COPYING to license files as it gives useful info on license
- Add "Public Domain" to XZ_LICENSE (see COPYING)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xz/xz.hash | 6 ++++++
 package/xz/xz.mk   | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 20a4a47432..28018c76c3 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,8 @@
 # Locally calculated after checking pgp signature
 sha256 fd9ca16de1052aac899ad3495ad20dfa906c27b4a5070102a2ec35ca3a4740c1  xz-5.2.3.tar.bz2
+
+#?Hash for license files
+sha256 c4f8e14fafe458d84808a4cd8b69f94673ebe2bf8fc992291629a69ac12218f8  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPLv3
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index bcdac13ee3..6a0dc25816 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,8 +9,8 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-2.1+
-XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
+XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XZ_CONF_OPTS = --enable-threads
-- 
2.20.1
