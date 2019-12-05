From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:15 +0000
Subject: [Buildroot] [PATCH v1 28/30] package/libdrm: Add host package.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-29-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libdrm/libdrm.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f7c9205744..c97dfbb083 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -18,6 +18,11 @@ LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=false \
 	-Dmanpages=false
 
+HOST_LIBDRM_CONF_OPTS = \
+	-Dcairo-tests=false \
+	-Dmanpages=false \
+	-Dintel=false
+
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
@@ -114,3 +119,4 @@ endif
 endif
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.20.1
