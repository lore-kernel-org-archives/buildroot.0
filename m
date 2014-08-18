From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 19 Aug 2014 00:50:40 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/localedef: don't use
	config.site when cross-compiling"
In-Reply-To: <1408402240-3126-1-git-send-email-romain.naour@openwide.fr>
References: <1408402240-3126-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1408402240-3126-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CONFIG_SITE="no" is now a part of pkg-autotools infrastructure.

This reverts commit 85448febb3c9f21e6e4082fc344b3ef46261c782.
---
 package/localedef/localedef.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 9a7118a..17ffd14 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -8,10 +8,6 @@ LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
 LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
 LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src
 
-# Avoid loading /usr/share/config.site that can redefine libdir when
-# the host arch is a 64bit system.
-HOST_LOCALEDEF_CONF_ENV = CONFIG_SITE="no"
-
 HOST_LOCALEDEF_CONF_OPT += \
 	--prefix=/usr \
 	--with-glibc=./eglibc
-- 
1.9.3
