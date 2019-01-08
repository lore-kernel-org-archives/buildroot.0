From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Jan 2019 21:38:53 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: remove unnecessary autoreconf
Message-ID: <20190108203854.28015-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

As xenomai release tarballs ship with a configure script, there is only a
need for autoreconfiguring when patches are applied.

The last patch was removed with git commit
de993bc23aab100e16026cb4cabebed48b9e1989 but the AUTORECONF line remained.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/xenomai.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 6bf08edfbc..d88e969adb 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -24,8 +24,6 @@ XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
 
 XENOMAI_DEPENDENCIES = host-pkgconf
 
-# 0002-boilerplate-build-obstack-support-conditionally.patch
-XENOMAI_AUTORECONF = YES
 
 XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
-- 
2.18.1
