From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 22 Aug 2014 11:12:54 +0200
Subject: [Buildroot] [PATCH v2 2/2] Revert "package/localedef: don't use
	config.site when cross-compiling"
In-Reply-To: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
References: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1408698774-13615-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CONFIG_SITE is now a part of pkg-autotools infrastructure.

This reverts commit 85448febb3c9f21e6e4082fc344b3ef46261c782.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: commit log: add missing Sob
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
