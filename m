From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 20 Nov 2013 13:20:17 +0200
Subject: [Buildroot] [PATCH] qt5base: add Fedora patch to fix powerpc build
Message-ID: <1384946417-19781-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/e57/e57dea01c3c1a4e3269580972890192c37d41697/

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch

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
+Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
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
-- 
1.8.4.rc3
