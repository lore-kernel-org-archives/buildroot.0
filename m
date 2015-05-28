From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Date: Thu, 28 May 2015 20:41:46 +0200
Subject: [Buildroot] [PATCH 1/5] nano: work around broken syntax
	highlighting regexes
Message-ID: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 package/nano/nano.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 4d47fdb..c6eb29c 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -11,6 +11,9 @@ NANO_LICENSE_FILES = COPYING
 NANO_CONF_OPTS = --without-slang
 NANO_DEPENDENCIES = ncurses
 
+# work around broken syntax highlighting regexes
+NANO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DGNU_WORDBOUNDS=1"
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
-- 
1.9.1
