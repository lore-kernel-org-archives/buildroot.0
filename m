From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Apr 2019 23:45:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix build with NLS
Message-ID: <20190421214513.18354-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/52586a2b8680869fc904ffcac548cf0d683070a6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3f16b5be4a..f6dbda9dbb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -18,7 +18,7 @@ SAMBA4_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 SAMBA4_CFLAGS = $(TARGET_CFLAGS)
-SAMBA4_LDFLAGS = $(TARGET_LDFLAGS)
+SAMBA4_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 SAMBA4_CONF_ENV = \
 	CFLAGS="$(SAMBA4_CFLAGS)" \
 	LDFLAGS="$(SAMBA4_LDFLAGS)"
-- 
2.20.1
