From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:32 -0700
Subject: [Buildroot] [PATCH 10/12] package/libmediaart: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libmediaart/libmediaart.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 4933b74c19..0d110a43e5 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -33,4 +33,11 @@ LIBMEDIAART_CONF_OPTS += \
 	--disable-qt
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBMEDIAART_CONF_OPTS += --enable-introspection
+LIBMEDIAART_DEPENDENCIES += gobject-introspection
+else
+LIBMEDIAART_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1
