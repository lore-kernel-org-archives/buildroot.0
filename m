From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Sep 2014 00:36:50 +0200
Subject: [Buildroot] [git commit] Revert "package/localedef: don't use
	config.site when cross-compiling"
Message-ID: <20140914223857.850679D62B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4b5ac28b609087e2cdac83dea05caf752bbfe07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CONFIG_SITE is now a part of pkg-autotools infrastructure.

This reverts commit 85448febb3c9f21e6e4082fc344b3ef46261c782.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/localedef/localedef.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
