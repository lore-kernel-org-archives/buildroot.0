From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Mar 2019 17:28:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: fix static build
Message-ID: <20190309162815.24868-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ebd8678a56a7dd8679fd4ec3ca1385c04866cc88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/sqlcipher.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index fcca3b7254..4427344120 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -33,4 +33,10 @@ else
 SQLCIPHER_CONF_OPTS += --disable-readline
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+SQLCIPHER_CONF_OPTS += --disable-load-extension
+else
+SQLCIPHER_CONF_OPTS += --enable-load-extension
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
