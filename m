From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:08:05 +0100
Subject: [Buildroot] [git commit] tmux: bump to version 2.1
Message-ID: <20160302202753.C3CC880203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16340faebb0cc4fc88d29550d5a57e3c80357695
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix musl build by removing inclusion of sys/cdefs.h.
Patch was backported from upstream master and can be dropped in the
next version bump.

Update homepage link

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tmux/0001-remove-use-of-sys-cdefs.h.patch | 42 +++++++++++++++++++++++
 package/tmux/Config.in                            |  2 +-
 package/tmux/tmux.hash                            |  2 +-
 package/tmux/tmux.mk                              |  2 +-
 4 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/package/tmux/0001-remove-use-of-sys-cdefs.h.patch b/package/tmux/0001-remove-use-of-sys-cdefs.h.patch
new file mode 100644
index 0000000..929953f
--- /dev/null
+++ b/package/tmux/0001-remove-use-of-sys-cdefs.h.patch
@@ -0,0 +1,42 @@
+From 29e4794ca396a8db8a468ec74559922d2af5a987 Mon Sep 17 00:00:00 2001
+From: Nicholas Marriott <nicholas.marriott@gmail.com>
+Date: Tue, 24 Nov 2015 18:46:50 +0000
+Subject: [PATCH] -sys/queue.h in proc.c, and nuke the unnecessary C++ header
+ guards stuff and sys/cdefs.h in vis.h (it causes problems on some platforms).
+ Reported by someone on GitHub, issue 212.
+
+---
+Backported from master upstream to fix musl build
+https://github.com/tmux/tmux/commit/7b085136a7291cbcdfcc53182fbd13aaca70306e
+
+proc.c does not exist on version 2.1
+
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+---
+ compat/vis.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/compat/vis.h b/compat/vis.h
+index 6795139..9f12d23 100644
+--- a/compat/vis.h
++++ b/compat/vis.h
+@@ -73,9 +73,6 @@
+  */
+ #define	UNVIS_END	1	/* no more characters */
+ 
+-#include <sys/cdefs.h>
+-
+-__BEGIN_DECLS
+ char	*vis(char *, int, int, int);
+ int	strvis(char *, const char *, int);
+ int	stravis(char **, const char *, int);
+@@ -85,6 +82,4 @@ int	strunvis(char *, const char *);
+ int	unvis(char *, char, int *, int);
+ ssize_t strnunvis(char *, const char *, size_t);
+ 
+-__END_DECLS
+-
+ #endif /* !_VIS_H_ */
+-- 
+1.9.1
+
diff --git a/package/tmux/Config.in b/package/tmux/Config.in
index fa8f64a..61719e4 100644
--- a/package/tmux/Config.in
+++ b/package/tmux/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_TMUX
 	  tmux is a terminal multiplexer, it enables a number of terminals
 	  (or windows) to be accessed and controlled from a single terminal.
 
-	  http://tmux.sourceforge.net/
+	  https://tmux.github.io/
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index ab7c4d3..e732aa2 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  795f4b4446b0ea968b9201c25e8c1ef8a6ade710ebca4657dd879c35916ad362  tmux-2.0.tar.gz
+sha256  31564e7bf4bcef2defb3cb34b9e596bd43a3937cad9e5438701a81a5a9af6176  tmux-2.1.tar.gz
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index c9abbf7..40f1a13 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.0
+TMUX_VERSION = 2.1
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
