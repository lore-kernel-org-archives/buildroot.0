From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 07:37:20 -0300
Subject: [Buildroot] [PATCH] openssh: bump to version 6.8p1
Message-ID: <1426675040-3662-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/0002-fix-howmany-include.patch | 59 +++++++++-----------------
 package/openssh/openssh.hash                   |  5 +--
 package/openssh/openssh.mk                     |  2 +-
 3 files changed, 24 insertions(+), 42 deletions(-)

diff --git a/package/openssh/0002-fix-howmany-include.patch b/package/openssh/0002-fix-howmany-include.patch
index 21675bf..7a2a8e3 100644
--- a/package/openssh/0002-fix-howmany-include.patch
+++ b/package/openssh/0002-fix-howmany-include.patch
@@ -1,17 +1,11 @@
-diff -ru openssh-6.6p1.org/channels.c openssh-6.6p1/channels.c
---- openssh-6.6p1.org/channels.c	2014-02-27 00:18:33.000000000 +0100
-+++ openssh-6.6p1/channels.c	2014-09-12 05:33:43.791424676 +0200
-@@ -41,6 +41,7 @@
- 
- #include "includes.h"
- 
-+#include <sys/param.h>
- #include <sys/types.h>
- #include <sys/ioctl.h>
- #include <sys/un.h>
-diff -ru openssh-6.6p1.org/openbsd-compat/bsd-poll.c openssh-6.6p1/openbsd-compat/bsd-poll.c
---- openssh-6.6p1.org/openbsd-compat/bsd-poll.c	2014-02-06 00:44:13.000000000 +0100
-+++ openssh-6.6p1/openbsd-compat/bsd-poll.c	2014-09-12 05:39:35.580947451 +0200
+Update patch from 2fea21799223d41605556858a95b55e69e9960ca to openssh
+version 6.8p1
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura openssh-6.8p1.orig/openbsd-compat/bsd-poll.c openssh-6.8p1/openbsd-compat/bsd-poll.c
+--- openssh-6.8p1.orig/openbsd-compat/bsd-poll.c	2015-03-18 07:11:46.184620677 -0300
++++ openssh-6.8p1/openbsd-compat/bsd-poll.c	2015-03-18 07:12:29.120094555 -0300
 @@ -19,6 +19,7 @@
  #include "includes.h"
  #if !defined(HAVE_POLL)
@@ -20,20 +14,9 @@ diff -ru openssh-6.6p1.org/openbsd-compat/bsd-poll.c openssh-6.6p1/openbsd-compa
  #include <sys/types.h>
  #include <sys/time.h>
  #ifdef HAVE_SYS_SELECT_H
-diff -ru openssh-6.6p1.org/sshconnect.c openssh-6.6p1/sshconnect.c
---- openssh-6.6p1.org/sshconnect.c	2014-02-06 23:24:34.000000000 +0100
-+++ openssh-6.6p1/sshconnect.c	2014-09-12 05:39:57.372236592 +0200
-@@ -15,6 +15,7 @@
- 
- #include "includes.h"
- 
-+#include <sys/param.h>
- #include <sys/types.h>
- #include <sys/wait.h>
- #include <sys/stat.h>
-diff -ru openssh-6.6p1.org/sshd.c openssh-6.6p1/sshd.c
---- openssh-6.6p1.org/sshd.c	2014-02-27 00:20:08.000000000 +0100
-+++ openssh-6.6p1/sshd.c	2014-09-12 05:42:20.233576519 +0200
+diff -Nura openssh-6.8p1.orig/sshd.c openssh-6.8p1/sshd.c
+--- openssh-6.8p1.orig/sshd.c	2015-03-18 07:11:46.187620780 -0300
++++ openssh-6.8p1/sshd.c	2015-03-18 07:13:11.889562735 -0300
 @@ -44,6 +44,7 @@
  
  #include "includes.h"
@@ -42,20 +25,20 @@ diff -ru openssh-6.6p1.org/sshd.c openssh-6.6p1/sshd.c
  #include <sys/types.h>
  #include <sys/ioctl.h>
  #include <sys/socket.h>
-diff -ru openssh-6.6p1.org/ssh-keyscan.c openssh-6.6p1/ssh-keyscan.c
---- openssh-6.6p1.org/ssh-keyscan.c	2013-12-07 01:24:02.000000000 +0100
-+++ openssh-6.6p1/ssh-keyscan.c	2014-09-12 05:41:03.102092462 +0200
-@@ -10,6 +10,7 @@
+diff -Nura openssh-6.8p1.orig/ssh-keyscan.c openssh-6.8p1/ssh-keyscan.c
+--- openssh-6.8p1.orig/ssh-keyscan.c	2015-03-18 07:11:46.180620539 -0300
++++ openssh-6.8p1/ssh-keyscan.c	2015-03-18 07:13:32.092256248 -0300
+@@ -9,6 +9,7 @@
+ 
  #include "includes.h"
   
- #include "openbsd-compat/sys-queue.h"
 +#include <sys/param.h>
+ #include <sys/types.h>
+ #include "openbsd-compat/sys-queue.h"
  #include <sys/resource.h>
- #ifdef HAVE_SYS_TIME_H
- # include <sys/time.h>
-diff -ru openssh-6.6p1.org/ssh-pkcs11-helper.c openssh-6.6p1/ssh-pkcs11-helper.c
---- openssh-6.6p1.org/ssh-pkcs11-helper.c	2013-12-05 00:23:21.000000000 +0100
-+++ openssh-6.6p1/ssh-pkcs11-helper.c	2014-09-12 05:40:20.488482522 +0200
+diff -Nura openssh-6.8p1.orig/ssh-pkcs11-helper.c openssh-6.8p1/ssh-pkcs11-helper.c
+--- openssh-6.8p1.orig/ssh-pkcs11-helper.c	2015-03-18 07:11:46.182620608 -0300
++++ openssh-6.8p1/ssh-pkcs11-helper.c	2015-03-18 07:13:43.620651993 -0300
 @@ -17,6 +17,7 @@
  
  #include "includes.h"
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 2fcdabe..92781d0 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,3 @@
 # Locally calculated after checking pgp signature
-# Also from http://www.openssh.com/txt/release-6.7 (sha256 is base64 encoded)
-sha1	14e5fbed710ade334d65925e080d1aaeb9c85bf6	openssh-6.7p1.tar.gz
-sha256	b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507	openssh-6.7p1.tar.gz
+# Also from http://www.openssh.com/txt/release-6.8 (sha256 is base64 encoded)
+sha256	3ff64ce73ee124480b5bf767b9830d7d3c03bbcb6abe716b78f0192c37ce160e	openssh-6.7p1.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index be471b6..08f3fa0 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.7p1
+OPENSSH_VERSION = 6.8p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-- 
2.0.5
