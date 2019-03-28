From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Mar 2019 21:28:49 +0100
Subject: [Buildroot] [PATCH 3/8] package/rpm: add optional libcap dependency
In-Reply-To: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
References: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
Message-ID: <20190328202854.26337-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/rpm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 8bf08b47a1..d6009e124f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -29,7 +29,6 @@ RPM_CONF_OPTS = \
 	--disable-rpath \
 	--with-external-db \
 	--with-gnu-ld \
-	--without-cap \
 	--without-hackingdocs \
 	--without-lua
 
@@ -40,6 +39,13 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+RPM_DEPENDENCIES += libcap
+RPM_CONF_OPTS += --with-cap
+else
+RPM_CONF_OPTS += --without-cap
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 RPM_DEPENDENCIES += libnss
 RPM_CONF_OPTS += --without-beecrypt
-- 
2.20.1
