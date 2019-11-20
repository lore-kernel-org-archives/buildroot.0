From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:18 +0000
Subject: [Buildroot] [RFC PATCH v3 04/30] package/jpeg-turbo: Add host
 install
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-5-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/jpeg-turbo/jpeg-turbo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 3735132b2e..6e78c39634 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -14,6 +14,7 @@ JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
 JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
+HOST_JPEG_TURBO_CONF_OPTS += -DWITH_SIMD=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
@@ -38,3 +39,4 @@ endef
 JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
