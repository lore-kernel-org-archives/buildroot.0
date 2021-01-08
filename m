From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Jan 2021 07:53:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: use ENABLE_GLIB
Message-ID: <20210108065341.1546867-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use ENABLE_GLIB which is available since version 0.60 and
https://github.com/freedesktop/poppler/commit/766a32ff59dadd9ae4639d8a79861a17be6aec52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poppler/poppler.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 41a5e40e68..70dcd4bef4 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -95,6 +95,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 POPPLER_DEPENDENCIES += libglib2
+POPPLER_CONF_OPTS += -DENABLE_GLIB=ON
+else
+POPPLER_CONF_OPTS += -DENABLE_GLIB=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
-- 
2.29.2
