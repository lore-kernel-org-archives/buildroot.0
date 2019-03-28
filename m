From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Mar 2019 21:28:50 +0100
Subject: [Buildroot] [PATCH 4/8] package/rpm: add optional dbus dependency
In-Reply-To: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
References: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
Message-ID: <20190328202854.26337-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It should be noted that dbus is enabled by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index d6009e124f..103fd7630f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -39,6 +39,13 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+RPM_DEPENDENCIES += dbus
+RPM_CONF_OPTS += --enable-plugins
+else
+RPM_CONF_OPTS += --disable-plugins
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 RPM_DEPENDENCIES += libcap
 RPM_CONF_OPTS += --with-cap
-- 
2.20.1
