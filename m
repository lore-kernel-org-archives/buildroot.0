From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 Apr 2020 19:58:16 -0700
Subject: [Buildroot] [PATCH 4/4] package/polkit: enable
 gobject-introspection support
In-Reply-To: <20200418025816.1642936-1-aduskett@gmail.com>
References: <20200418025816.1642936-1-aduskett@gmail.com>
Message-ID: <20200418025816.1642936-4-aduskett@gmail.com>
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
 package/polkit/polkit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index ee0b3674de..3ae42b2312 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -26,6 +26,13 @@ POLKIT_CONF_OPTS = \
 	--disable-libelogind \
 	--disable-libsystemd-login
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+POLKIT_CONF_OPTS += --enable-introspection
+POLKIT_DEPENDENCIES += gobject-introspection
+else
+POLKIT_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLKIT_DEPENDENCIES += linux-pam
 POLKIT_CONF_OPTS += --with-authfw=pam
-- 
2.25.2
