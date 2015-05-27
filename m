From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 27 May 2015 21:39:39 +0200
Subject: [Buildroot] [PATCH] gdbm: handle optional dependency gettext
Message-ID: <1432755579-10890-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdbm itself is an optional dependency of perl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gdbm/gdbm.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 12e1dac..f7a4370 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -10,4 +10,8 @@ GDBM_LICENSE = GPLv3+
 GDBM_LICENSE_FILES = COPYING
 GDBM_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GDBM_DEPENDENCIES += gettext
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
