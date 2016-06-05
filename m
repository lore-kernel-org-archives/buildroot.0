From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:42:12 +0200
Subject: [Buildroot] [git commit] package/socketcand: bump version
Message-ID: <20160605200530.80B1181E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42ca45de341fb807448528d86376390b64072436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/dschanoeh/socketcand/commit/bdb3cd081a694f8f6924e399d944e32c1578235c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../socketcand/0001-Remove-inline-keyword.patch    | 90 ----------------------
 package/socketcand/socketcand.mk                   |  2 +-
 2 files changed, 1 insertion(+), 91 deletions(-)

diff --git a/package/socketcand/0001-Remove-inline-keyword.patch b/package/socketcand/0001-Remove-inline-keyword.patch
deleted file mode 100644
index 92e8737..0000000
--- a/package/socketcand/0001-Remove-inline-keyword.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From bdb3cd081a694f8f6924e399d944e32c1578235c Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 22 Jul 2015 11:03:27 +0200
-Subject: [PATCH] Remove inline keyword
-
-Fixes GCC5.x compilation issues related to C99 inline semantics.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- socketcand.h    | 8 ++++----
- state_bcm.c     | 2 +-
- state_control.c | 2 +-
- state_isotp.c   | 2 +-
- state_raw.c     | 2 +-
- 5 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/socketcand.h b/socketcand.h
-index a287fe2..39eef83 100644
---- a/socketcand.h
-+++ b/socketcand.h
-@@ -27,10 +27,10 @@
- 
- #undef DEBUG_RECEPTION
- 
--inline void state_bcm();
--inline void state_raw();
--inline void state_isotp();
--inline void state_control();
-+void state_bcm();
-+void state_raw();
-+void state_isotp();
-+void state_control();
- 
- extern int client_socket;
- extern char **interface_names;
-diff --git a/state_bcm.c b/state_bcm.c
-index c63a0a9..0c980fa 100644
---- a/state_bcm.c
-+++ b/state_bcm.c
-@@ -28,7 +28,7 @@ int sc = -1;
- fd_set readfds;
- struct timeval tv;
- 
--inline void state_bcm() {
-+void state_bcm() {
- 	int i, ret;
- 	struct sockaddr_can caddr;
- 	socklen_t caddrlen = sizeof(caddr);
-diff --git a/state_control.c b/state_control.c
-index 5f62b74..baa9df6 100644
---- a/state_control.c
-+++ b/state_control.c
-@@ -17,7 +17,7 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>
- 
--inline void state_control() {
-+void state_control() {
- 	char buf[MAXLEN];
- 	int i, items;
- 
-diff --git a/state_isotp.c b/state_isotp.c
-index ae66035..4005f94 100644
---- a/state_isotp.c
-+++ b/state_isotp.c
-@@ -24,7 +24,7 @@
- int si = -1;
- fd_set readfds;
- 
--inline void state_isotp() {
-+void state_isotp() {
- 	int i, items, ret;
- 
- 	struct sockaddr_can addr;
-diff --git a/state_raw.c b/state_raw.c
-index 1bd2ece..99111ae 100644
---- a/state_raw.c
-+++ b/state_raw.c
-@@ -31,7 +31,7 @@ char ctrlmsg[CMSG_SPACE(sizeof(struct timeval)) + CMSG_SPACE(sizeof(__u32))];
- struct timeval tv;
- struct cmsghdr *cmsg;
- 
--inline void state_raw() {
-+void state_raw() {
- 	char buf[MAXLEN];
- 	int i, ret, items;
- 
--- 
-2.1.4
-
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 10b8b5b..0cc56ef 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = 8339e62a6bf60be571672678fb1de544768cf40e
+SOCKETCAND_VERSION = df7fb4ff8a4439d7737fe2df3540e1ab7465721a
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_LICENSE = BSD-3c or GPLv2
