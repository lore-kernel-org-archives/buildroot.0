From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:23 +0000
Subject: [Buildroot] [RFC PATCH v3 09/30] package/webp: Enable host package
 build.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-10-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/webp/webp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index d5df3f5da0..d67fe97bb7 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -11,6 +11,10 @@ WEBP_LICENSE = BSD-3-Clause
 WEBP_LICENSE_FILES = COPYING
 WEBP_INSTALL_STAGING = YES
 
+HOST_WEBP_CONF_OPTS += \
+	--enable-libwebpmux \
+	--enable-libwebpdemux
+
 WEBP_CONF_OPTS += \
 	--with-jpegincludedir=$(STAGING_DIR)/usr/include \
 	--with-jpeglibdir=$(STAGING_DIR)/usr/lib \
@@ -54,3 +58,4 @@ WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
 WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
