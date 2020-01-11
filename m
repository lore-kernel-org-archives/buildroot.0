From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 10:19:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/ofono: add bluez5_utils optional
 dependency
Message-ID: <20200111091914.418793-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ofono/ofono.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 797e30bd43..2a6cc80719 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -41,6 +41,9 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 OFONO_CONF_OPTS += --enable-bluetooth
 OFONO_DEPENDENCIES += bluez_utils
+else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+OFONO_CONF_OPTS += --enable-bluetooth
+OFONO_DEPENDENCIES += bluez5_utils
 else
 OFONO_CONF_OPTS += --disable-bluetooth
 endif
-- 
2.24.1
