From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 23 Mar 2011 19:42:55 -0400
Subject: [Buildroot] [PATCH] readline: link directly against ncurses
Message-ID: <1300923775-13739-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
note: not really tested since external toolchain support is totally broken

 package/readline/readline-6.1-curses-link.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 package/readline/readline-6.1-curses-link.patch

diff --git a/package/readline/readline-6.1-curses-link.patch b/package/readline/readline-6.1-curses-link.patch
new file mode 100644
index 0000000..56b4770
--- /dev/null
+++ b/package/readline/readline-6.1-curses-link.patch
@@ -0,0 +1,16 @@
+link readline directly to ncurses since it needs symbols from it
+
+upstream readline does this on purpose (no direct linking), but
+it doesn't make much sense in a Linux world
+
+--- a/support/shobj-conf
++++ b/support/shobj-conf
+@@ -42,7 +42,7 @@
+ SHOBJ_LIBS=
+ 
+ SHLIB_XLDFLAGS=
+-SHLIB_LIBS=
++SHLIB_LIBS=-lncurses
+ 
+ SHLIB_DOT='.'
+ SHLIB_LIBPREF='lib'
-- 
1.7.4.1
