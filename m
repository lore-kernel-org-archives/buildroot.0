From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Sep 2013 13:52:54 -0300
Subject: [Buildroot] [PATCH 5/6] neardal: add fix for automake bump breakage
In-Reply-To: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1379350375-18843-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/neardal/neardal-01-automake.patch | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/neardal/neardal-01-automake.patch

diff --git a/package/neardal/neardal-01-automake.patch b/package/neardal/neardal-01-automake.patch
new file mode 100644
index 0000000..e5d822e
--- /dev/null
+++ b/package/neardal/neardal-01-automake.patch
@@ -0,0 +1,35 @@
+From 08f26bdd093c7f289638ab506b0e842bd93f3d0d Mon Sep 17 00:00:00 2001
+From: Dmytro Bagrii <dimich@softerra.com>
+Date: Thu, 14 Mar 2013 15:44:40 +0100
+Subject: [PATCH 1/2] Fix 'AM_PROG_AR' autogen.sh error There is an error while
+ running autogen.sh in some distributions (e.g. Archlinux, automake 1.13.1).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6a4a7c5..eb03a50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,7 +1,6 @@
+ AC_INIT([neardal], 0.8.0, Neardal for Neard v0.8)
+ AM_INIT_AUTOMAKE([foreign -Wall -Werror])
+ 
+-AC_PROG_LIBTOOL
+ AC_CONFIG_HEADERS([config.h])
+ 
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+@@ -15,6 +14,8 @@ traces=no
+ 
+ AC_PROG_CC
+ AM_PROG_CC_C_O
++AM_PROG_AR
++AC_PROG_LIBTOOL
+ 
+ ## Compiler option
+ ## Debug ?
+-- 
+1.8.1.5
+
-- 
1.8.1.5
