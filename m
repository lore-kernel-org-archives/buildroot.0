From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Aug 2011 16:17:16 +0200
Subject: [Buildroot] [git commit] util-linux: fix libintl linking if present
Message-ID: <20110809141734.73A9B8B864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a8273c4272b1b8661a03c7cabdf4c8d710607049
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script correctly detects presence of libintl, but it forgets
to link against it, breaking the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d34759b..dd6ee5c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -25,6 +25,10 @@ else
 UTIL_LINUX_CONF_OPT += --without-ncurses
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINTL),y)
+UTIL_LINUX_DEPENDENCIES += libintl
+UTIL_LINUX_MAKE_OPT += LIBS=-lintl
+endif
 
 #############################################
 #
-- 
1.7.3.4
