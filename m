From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Nov 2013 13:45:15 +0100
Subject: [Buildroot] [git commit] qt5base: add Fedora patch to fix powerpc
	build
Message-ID: <20131120124648.A7BBC9BD30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=291d5f031d8b78d1d220e2459c5a2d8265678646
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/e57/e57dea01c3c1a4e3269580972890192c37d41697/

Patch submitted upstream:
https://codereview.qt-project.org/#change,71763

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch b/package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch
new file mode 100644
index 0000000..906b56a
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch
@@ -0,0 +1,29 @@
+Set loadAcquire() as const
+
+Fixes powerpc build.
+
+Fetched-from: https://bugzilla.redhat.com/attachment.cgi?id=812643
+Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
+
+Index: qtbase-opensource-src-5.1.1/src/corelib/thread/qoldbasicatomic.h
+===================================================================
+--- qtbase-opensource-src-5.1.1.orig/src/corelib/thread/qoldbasicatomic.h
++++ qtbase-opensource-src-5.1.1/src/corelib/thread/qoldbasicatomic.h
+@@ -63,7 +63,7 @@ public:
+     // Atomic API, implemented in qatomic_XXX.h
+ 
+     int load() const { return _q_value; }
+-    int loadAcquire() { return _q_value; }
++    int loadAcquire() const { return _q_value; }
+     void store(int newValue) { _q_value = newValue; }
+     void storeRelease(int newValue) { _q_value = newValue; }
+ 
+@@ -107,7 +107,7 @@ public:
+     // Atomic API, implemented in qatomic_XXX.h
+ 
+     T *load() const { return _q_value; }
+-    T *loadAcquire() { return _q_value; }
++    T *loadAcquire() const { return _q_value; }
+     void store(T *newValue) { _q_value = newValue; }
+     void storeRelease(T *newValue) { _q_value = newValue; }
+ 
