From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Mar 2018 22:53:06 +0100
Subject: [Buildroot] [PATCH 1/1] ympd: add optional openssl dependency
Message-ID: <20180310215306.15866-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ympd/ympd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index e3f21e9eb0..6c0f3224cc 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -10,4 +10,11 @@ YMPD_LICENSE = GPL-2.0
 YMPD_LICENSE_FILES = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+YMPD_DEPENDENCIES += openssl
+YMPD_CONF_OPTS += -DWITH_SSL=ON
+else
+YMPD_CONF_OPTS += -DWITH_SSL=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
