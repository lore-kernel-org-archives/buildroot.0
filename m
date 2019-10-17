From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:12 +0100
Subject: [Buildroot] [RFC PATCH v2 13/30] package/webp: Enable host package
 build.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-14-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/webp/webp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index e7235f48f4..2fb42613ec 100644
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
