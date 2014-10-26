From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 14:24:58 +0100
Subject: [Buildroot] [git commit] ipset: add patch to fix --enable-debug
	build
Message-ID: <20141026154216.525FAB0868@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a923b44112aa3bfdb42b12cc1bd2712a263c1a0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/e09/e092c05b949a2bcdadc4f4a0a57d7dd1dc8dca26/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...not-pass-Werror-when-enable-debug-is-used.patch |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/ipset/0001-Do-not-pass-Werror-when-enable-debug-is-used.patch b/package/ipset/0001-Do-not-pass-Werror-when-enable-debug-is-used.patch
new file mode 100644
index 0000000..c115f63
--- /dev/null
+++ b/package/ipset/0001-Do-not-pass-Werror-when-enable-debug-is-used.patch
@@ -0,0 +1,39 @@
+From f31bb2561776ad2ce4b77339da6fbfc9e3b2ffbb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 26 Oct 2014 14:18:29 +0100
+Subject: [PATCH] Do not pass -Werror when --enable-debug is used
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Make_global.am | 2 +-
+ configure.ac   | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Make_global.am b/Make_global.am
+index 7953451..25c4d64 100644
+--- a/Make_global.am
++++ b/Make_global.am
+@@ -77,7 +77,7 @@ AM_CPPFLAGS = $(kinclude_CFLAGS) $(all_includes) -I$(top_srcdir)/include \
+ AM_CFLAGS = -std=gnu99
+ 
+ if ENABLE_DEBUG
+-AM_CFLAGS += -g -g3 -ggdb -gdwarf-2 -DIPSET_DEBUG -Wall -Werror
++AM_CFLAGS += -g -g3 -ggdb -gdwarf-2 -DIPSET_DEBUG -Wall
+ else
+ AM_CFLAGS += -O2 -DNDEBUG
+ endif
+diff --git a/configure.ac b/configure.ac
+index 8fdac15..ee3b147 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -345,7 +345,6 @@ AX_CFLAGS_GCC_OPTION(-Waggregate-return)
+ AX_CFLAGS_GCC_OPTION(-Wbad-function-cast)
+ AX_CFLAGS_GCC_OPTION(-Wcast-align)
+ AX_CFLAGS_GCC_OPTION(-Wcast-qual)
+-AX_CFLAGS_GCC_OPTION(-Werror)
+ AX_CFLAGS_GCC_OPTION(-Wextra)
+ AX_CFLAGS_GCC_OPTION(-Wfloat-equal)
+ AX_CFLAGS_GCC_OPTION(-Wformat=2)
+-- 
+2.0.0
+
