From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri,  2 May 2014 16:59:23 +0200
Subject: [Buildroot] [PATCH] lsof: do not remove WIDECHARINCL definition
Message-ID: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WIDECHARINCL is enabled by HASWIDECHAR, so removing its definition if
BR2_USE_WCHAR is not set is useless.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/lsof/lsof.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index f4b1b4c..aa101e4 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -27,8 +27,6 @@ ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
 		$(@D)/machine.h
-	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' \
-		$(@D)/machine.h
 endef
 endif
 
-- 
1.8.3.2
