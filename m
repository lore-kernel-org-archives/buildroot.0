From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Mar 2020 22:14:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/civetweb: add zlib optional
 dependency
Message-ID: <20200317211457.1272741-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is an optional dependency since version 1.11 and
https://github.com/civetweb/civetweb/commit/6b8b15935378f71323ff95f907fa0d33841deac0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 99da1b6f06..f05b29f3cd 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -38,6 +38,12 @@ else
 CIVETWEB_COPT += -DNO_SSL
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CIVETWEB_CONF_OPTS += WITH_ZLIB=1
+CIVETWEB_LIBS += -lz
+CIVETWEB_DEPENDENCIES += zlib
+endif
+
 ifeq ($(BR2_PACKAGE_CIVETWEB_SERVER),y)
 CIVETWEB_BUILD_TARGETS += build
 CIVETWEB_INSTALL_TARGETS += install
-- 
2.25.1
