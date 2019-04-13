From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Apr 2019 11:12:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: drop unneeded static
 openssl workaround
Message-ID: <20190413091246.27331-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sconeserver can't be built statically since commit
a845798aa8af0535b85ea0e46cc9e8af9d1ffed1

So drop unneeded workaround for statically linking with openssl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/sconeserver.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index c160c8bf7c..6914599a21 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -25,9 +25,6 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SCONESERVER_DEPENDENCIES += openssl
 SCONESERVER_CONF_OPTS += --with-ssl
-ifeq ($(BR2_STATIC_LIBS),y)
-SCONESERVER_CONF_ENV += SSL_LIBADD=-lz
-endif
 else
 SCONESERVER_CONF_OPTS += --without-ssl
 endif
-- 
2.20.1
