From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Nov 2020 07:51:24 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/rhash: fix activation of
 gettext
Message-ID: <20201113065124.30364-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit ead2afda13e5541a7d8e759f5cfec4ab38605dcc, gettext is
wrongly disabled when BR2_SYSTEM_ENABLE_NLS is set

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rhash/rhash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 55fb08ecea..b2f654a6c3 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -14,9 +14,9 @@ RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
-RHASH_CONF_OPTS += --disable-gettext
-else
 RHASH_CONF_OPTS += --enable-gettext
+else
+RHASH_CONF_OPTS += --disable-gettext
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
-- 
2.28.0
