From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 18:17:13 +0100
Subject: [Buildroot] [git commit] squeezelite: reformat existing patch as a
	Git formatted patch
Message-ID: <20160207174236.81D28817D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19bb96f0767751a0500062fcbee8450cd5fe3825
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch} | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/squeezelite/0001-Makefile-override.patch b/package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch
similarity index 73%
rename from package/squeezelite/0001-Makefile-override.patch
rename to package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch
index 4e11541..2f002a8 100644
--- a/package/squeezelite/0001-Makefile-override.patch
+++ b/package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch
@@ -1,12 +1,21 @@
+From a0f2e79d1373967dac9f3df4c500a71cd1b96b2b Mon Sep 17 00:00:00 2001
+From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
+Date: Sun, 7 Feb 2016 18:04:53 +0100
+Subject: [PATCH] Makefile: allow passing CFLAGS and LDFLAGS
+
 This patch is applied to squeezelite Makefile to add override
 directive for CFLAGS and LDFLAGS assignment.
 This enables adding flags to CFLAGS and LDFLAGS in Makefile.
 
 Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
+---
+ Makefile | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
 
-diff -ruN a/Makefile b/Makefile
---- a/Makefile	2015-02-01 23:56:21.000000000 +0900
-+++ b/Makefile	2015-09-29 20:06:52.268069187 +0900
+diff --git a/Makefile b/Makefile
+index dca2abd..286c725 100644
+--- a/Makefile
++++ b/Makefile
 @@ -1,4 +1,6 @@
  # Cross compile support - create a Makefile which defines these three variables and then includes this Makefile...
 +override CFLAGS += $(OPTS)
@@ -14,7 +23,7 @@ diff -ruN a/Makefile b/Makefile
  CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
  LDFLAGS ?= -lasound -lpthread -lm -lrt
  EXECUTABLE ?= squeezelite
-@@ -52,20 +54,20 @@
+@@ -52,20 +54,20 @@ endif
  
  # add optional link options
  ifneq (,$(findstring $(OPT_LINKALL), $(CFLAGS)))
@@ -40,3 +49,6 @@ diff -ruN a/Makefile b/Makefile
  endif
  endif
  
+-- 
+2.6.4
+
