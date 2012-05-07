From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 May 2012 21:42:53 +0200
Subject: [Buildroot] [git commit] libplayer: add patch to fix build issue
Message-ID: <20120507194543.14DB496C5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f4f99ee78ad559512d8f9c11b4e0ead11ac035d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/af5e72c2385896f2bdb5c1b98efd487afb46a502/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libplayer/libplayer-add-fpic.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/libplayer/libplayer-add-fpic.patch b/package/libplayer/libplayer-add-fpic.patch
new file mode 100644
index 0000000..e4b227f
--- /dev/null
+++ b/package/libplayer/libplayer-add-fpic.patch
@@ -0,0 +1,18 @@
+Add -fPIC to CFLAGS
+
+-fPIC is needed to build shared library code.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -9,6 +9,7 @@
+ SHARED_LIBNAME_VERSION = $(SHARED_LIBNAME).$(VERSION)
+ SHARED_LIBNAME_MAJOR = $(SHARED_LIBNAME).$(shell echo $(VERSION) | cut -f1 -d.)
+ SHARED_LIBNAME_FLAGS = -shared -Wl,-soname,$(SHARED_LIBNAME_MAJOR)
++CFLAGS = -fPIC
+ 
+ ifeq ($(BUILD_STATIC),yes)
+   BUILD_RULES += lib_static
