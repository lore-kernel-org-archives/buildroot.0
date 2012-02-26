From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 10:13:31 -0200
Subject: [Buildroot] [PATCH 2/3] qt: Fix compilation of generic atomic
	routines
In-Reply-To: <1330258412-28426-1-git-send-email-ismael.luceno@gmail.com>
References: <1330258412-28426-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330258412-28426-2-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt/qt-gcc-4.6.2-fixes.patch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/qt/qt-gcc-4.6.2-fixes.patch

diff --git a/package/qt/qt-gcc-4.6.2-fixes.patch b/package/qt/qt-gcc-4.6.2-fixes.patch
new file mode 100644
index 0000000..6918f33
--- /dev/null
+++ b/package/qt/qt-gcc-4.6.2-fixes.patch
@@ -0,0 +1,11 @@
+--- a/src/corelib/arch/qatomic_generic.h	2012-02-20 07:24:17.299239630 -0200
++++ b/src/corelib/arch/qatomic_generic.h	2012-02-20 07:23:32.634562979 -0200
+@@ -194,7 +194,7 @@
+ {
+     union { T * volatile * typed; void * volatile * voidp; } pointer;
+     pointer.typed = &_q_value;
+-    return QBasicAtomicPointer_testAndSetOrdered(pointer.voidp, expectedValue, newValue);
++    return QBasicAtomicPointer_testAndSetOrdered(pointer.voidp, (void *)expectedValue, (void *)newValue);
+ }
+ 
+ template <typename T>
-- 
1.7.9.1
