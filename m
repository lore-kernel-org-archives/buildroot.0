From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Apr 2011 22:20:48 +0200
Subject: [Buildroot] [git commit] procps: fix build with make 3.82
Message-ID: <20110406202239.9B25E8223C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=64b351f6252f27dc5c21b9b4b6c62fd2676837f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Bruce Bushby.

Issue with make include order. For more details, see:
http://old.nabble.com/make-3.81.91---procps-3.2.8-td29281048.html

Equivalent to upstream fix:
http://procps.cvs.sourceforge.net/viewvc/procps/procps/Makefile?r1=1.70&r2=1.71

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/procps/procps-make-3.82.patch |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/procps/procps-make-3.82.patch

diff --git a/package/procps/procps-make-3.82.patch b/package/procps/procps-make-3.82.patch
new file mode 100644
index 0000000..2a56356
--- /dev/null
+++ b/package/procps/procps-make-3.82.patch
@@ -0,0 +1,23 @@
+[PATCH] procps: fix build with make 3.82
+
+Equivalent to upstream fix:
+http://procps.cvs.sourceforge.net/viewvc/procps/procps/Makefile?r1=1.70&r2=1.71
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: procps-3.2.8/Makefile
+===================================================================
+--- procps-3.2.8.orig/Makefile
++++ procps-3.2.8/Makefile
+@@ -174,7 +174,7 @@
+ # want this rule first, use := on ALL, and ALL not filled in yet
+ all: do_all
+ 
+--include */module.mk
++-include proc/module.mk ps/module.mk
+ 
+ do_all:    $(ALL)
+ 
-- 
1.7.3.4
