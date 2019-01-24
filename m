From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 12:36:37 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] xenomai: remove
 unnecessary autoreconf
Message-ID: <20190124113550.F19898E243@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f17bde9466a78bebcf6fb5ca6495bc98912c325a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

As xenomai release tarballs ship with a configure script, there is only a
need for autoreconfiguring when patches are applied.

The last patch was removed with git commit
de993bc23aab100e16026cb4cabebed48b9e1989 but the AUTORECONF line remained.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4219c58c386fdd351eb75185fa851addd63a75ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
