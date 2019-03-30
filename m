From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Mar 2019 15:49:44 +0100
Subject: [Buildroot] [PATCH v2,
 5/8] package/rpm: add optional dbus dependency
In-Reply-To: <20190330144947.27638-1-fontaine.fabrice@gmail.com>
References: <20190330144947.27638-1-fontaine.fabrice@gmail.com>
Message-ID: <20190330144947.27638-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It should be noted that dbus is enabled by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Put bump as the first patch in the serie

 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 0eb6e7f3c7..fe9f898bd3 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -35,6 +35,13 @@ else
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
