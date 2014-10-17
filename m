From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 17 Oct 2014 16:52:04 +0200
Subject: [Buildroot] [PATCH] libshout: fix typo
Message-ID: <1413557524-28370-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix error:
  package/libshout/libshout.mk:28: *** Package error: use LIBSHOUT_CONF_OPTS instead of LIBSHOUT_CONF_OPT. Please fix your .mk file.  Stop.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libshout/libshout.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 1166f58..faee3eb 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -19,7 +19,7 @@ LIBSHOUT_CONF_OPTS += --disable-theora
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
-LIBSHOUT_CONF_OPT += --enable-speex
+LIBSHOUT_CONF_OPTS += --enable-speex
 LIBSHOUT_DEPENDENCIES += speex
 else
 LIBSHOUT_CONF_OPTS += --disable-speex
-- 
1.9.1
