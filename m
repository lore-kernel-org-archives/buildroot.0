From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 3 Apr 2011 20:12:28 +0200
Subject: [Buildroot] [git commit /heads/master] readline: link directly
	against ncurses
Message-ID: <20110403185530.D6CC781E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b864790383b1cb8d51e5202bb750c0a6601b21ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes link issues on uClibc for applications using libreadline.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
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
1.7.3.4
