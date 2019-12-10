From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:45 +0100
Subject: [Buildroot] [PATCH 06/12] package/android-tools: add missing
 extract dependencies
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

android-tools uses suitable-extractor to manually extract a tarball,
so it should have the appropriate package dependencies added to
<pkg>_EXTRACT_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/android-tools/android-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 3d5c76a322..fda58e13bb 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -22,7 +22,9 @@ define ANDROID_TOOLS_DEBIAN_EXTRACT
 endef
 
 HOST_ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
+HOST_ANDROID_TOOLS_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,$(ANDROID_TOOLS_EXTRA_DOWNLOADS))
 ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
+ANDROID_TOOLS_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,$(ANDROID_TOOLS_EXTRA_DOWNLOADS))
 
 # Apply the Debian patches before applying the Buildroot patches
 define ANDROID_TOOLS_DEBIAN_PATCH
-- 
2.23.0
