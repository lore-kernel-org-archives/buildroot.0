From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 May 2012 10:35:47 -0300
Subject: [Buildroot] [PATCH 1/2] sudo: bump to version 1.8.5p1
Message-ID: <1337520948-19091-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo-1.8.4p4-utmpx.patch |   19 -------------------
 package/sudo/sudo.mk                  |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)
 delete mode 100644 package/sudo/sudo-1.8.4p4-utmpx.patch

diff --git a/package/sudo/sudo-1.8.4p4-utmpx.patch b/package/sudo/sudo-1.8.4p4-utmpx.patch
deleted file mode 100644
index 4e97406..0000000
--- a/package/sudo/sudo-1.8.4p4-utmpx.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix incomplete setutxent/endutxent defines for when there's no utmpx
-Upstream bug #551
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura sudo-1.8.4p4.orig/src/utmp.c sudo-1.8.4p4/src/utmp.c
---- sudo-1.8.4p4.orig/src/utmp.c	2012-03-30 07:10:38.381706315 -0300
-+++ sudo-1.8.4p4/src/utmp.c	2012-03-30 07:10:52.605802501 -0300
-@@ -63,8 +63,8 @@
- #if !defined(HAVE_GETUTXID) && defined(HAVE_GETUTID)
- # define getutxline(u)	getutline(u)
- # define pututxline(u)	pututline(u)
--# define setutxent	setutent(u)
--# define endutxent	endutent(u)
-+# define setutxent(u)	setutent(u)
-+# define endutxent(u)	endutent(u)
- #endif /* !HAVE_GETUTXID && HAVE_GETUTID */
- 
- #ifdef HAVE_GETUTXID
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 71d7a20..3629ad1 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.8.4p4
+SUDO_VERSION = 1.8.5p1
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_CONF_OPT = \
 		--without-lecture \
-- 
1.7.3.4
