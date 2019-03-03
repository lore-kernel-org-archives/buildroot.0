From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Mar 2019 11:12:52 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/log4cplus: add optional qt5
 dependency
Message-ID: <20190303101252.3374-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cplus/log4cplus.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 0bc4fc9aa6..b632066de1 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -11,6 +11,13 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_QT5),y)
+LOG4CPLUS_DEPENDENCIES += host-pkgconf qt5base
+LOG4CPLUS_CONF_OPTS += --with-qt5
+else
+LOG4CPLUS_CONF_OPTS += --without-qt5
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LOG4CPLUS_CONF_ENV += LIBS='-latomic'
 endif
-- 
2.14.1
