From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 20:04:18 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.5p1
Message-ID: <20120531113259.4AB5196E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=347cfd60692e74fd89343383d15d1001c1a871e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sudo/sudo-1.8.4p4-utmpx.patch |   19 -------------------
 package/sudo/sudo.mk                  |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)

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
