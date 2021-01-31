From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Jan 2021 14:31:59 +0100
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: drop
 unrecognized options
In-Reply-To: <20210131133200.3976386-1-fontaine.fabrice@gmail.com>
References: <20210131133200.3976386-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131133200.3976386-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BUILD_ALONG_WITH_CMRTLIB has been dropped since version 18.2.0 and
https://github.com/intel/media-driver/commit/c3e13c175d12790ab70c4de3521e47f62be780de

RUN_TEST_SUITE is also unrecognized (only MEDIA_RUN_TEST_SUITE is
recognized)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/intel-mediadriver/intel-mediadriver.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index c3157867ed..49bf85e092 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -22,9 +22,7 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
 INTEL_MEDIADRIVER_CONF_OPTS = \
-	-DBUILD_ALONG_WITH_CMRTLIB=1 \
 	-DINSTALL_DRIVERS_SYSCONF=OFF \
-	-DMEDIA_RUN_TEST_SUITE=OFF \
-	-DRUN_TEST_SUITE=OFF
+	-DMEDIA_RUN_TEST_SUITE=OFF
 
 $(eval $(cmake-package))
-- 
2.29.2
