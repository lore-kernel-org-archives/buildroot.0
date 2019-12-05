From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:14:52 +0000
Subject: [Buildroot] [PATCH v1 05/30] package/jpeg-turbo: Add host install
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-6-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/jpeg-turbo/jpeg-turbo.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 0c75cf1db5..88c61dec94 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -14,6 +14,8 @@ JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
 JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
+# x86 simd support improves performance but needs host-nasm, so just turn it off
+HOST_JPEG_TURBO_CONF_OPTS += -DWITH_SIMD=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
@@ -38,3 +40,4 @@ endef
 JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
