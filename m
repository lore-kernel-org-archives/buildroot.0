From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Mar 2020 20:45:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/bearssl: needs -fPIC
Message-ID: <20200310194546.2347-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e677519c7536447062bf15fb7aa73eded19a6cf6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bearssl/bearssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bearssl/bearssl.mk b/package/bearssl/bearssl.mk
index e85626153c..ff5f4e87b7 100644
--- a/package/bearssl/bearssl.mk
+++ b/package/bearssl/bearssl.mk
@@ -16,6 +16,7 @@ BEARSSL_MAKE_OPTS = \
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 BEARSSL_TARGETS += dll
+BEARSSL_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-- 
2.25.1
