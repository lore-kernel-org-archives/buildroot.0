From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 27 Jul 2020 14:41:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: add openssl optional
 dependency
Message-ID: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl is an optional dependency that is enabled by default since
version 0.7.0 and
https://github.com/capnproto/capnproto/commit/23db5e3fd91104a0b2881d8f8ab3c10bf9dd8e75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/capnproto/capnproto.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 34fb885914..2afeb8ffa3 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -21,5 +21,12 @@ endif
 # The actual source to be compiled is within a 'c++' subdirectory
 CAPNPROTO_SUBDIR = c++
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CAPNPROTO_CONF_OPTS += --with-openssl
+CAPNPROTO_DEPENDENCIES += openssl
+else
+CAPNPROTO_CONF_OPTS += --without-openssl
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.27.0
