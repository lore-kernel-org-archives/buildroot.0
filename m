From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 22:32:02 +0100
Subject: [Buildroot] [PATCH 1/3] package/exiv2: annotate CVE-2019-13504
Message-ID: <20200229213204.3703303-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2019-13504 is misclassified (by our CVE tracker) as affecting
version 0.27.2, while in fact both commits that fixed this issue are
already in this version.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exiv2/exiv2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 228b3a980e..09988f49b2 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -10,6 +10,11 @@ EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
 EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
 
+# CVE-2019-13504 is misclassified (by our CVE tracker) as affecting version
+# 0.27.2, while in fact both commits that fixed this issue are already in this
+# version.
+EXIV2_IGNORE_CVES += CVE-2019-13504
+
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 
 # The following CMake variable disables a TRY_RUN call in the -pthread
-- 
2.25.0
