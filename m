From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Jul 2017 20:36:54 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-SV0aWIUn5N@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #15 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Ivan from comment #14)

Changing host/lib/gcc/arm-buildroot-linux-gnueabihf/7.1.0/include/arm_acle.h
the following way fixed the compile for me:

--- arm_acle.h_orig     2017-07-24 20:54:27.202341305 +0200
+++ arm_acle.h  2017-07-24 21:18:08.750558081 +0200
@@ -43,28 +43,28 @@

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_ldc (const unsigned int __coproc, const unsigned int __CRd,
-          const void * __p)
+          const int * __p)
 {
   return __builtin_arm_ldc (__coproc, __CRd, __p);
 }

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_ldcl (const unsigned int __coproc, const unsigned int __CRd,
-           const void * __p)
+           const int * __p)
 {
   return __builtin_arm_ldcl (__coproc, __CRd, __p);
 }

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_stc (const unsigned int __coproc, const unsigned int __CRd,
-          void * __p)
+          int * __p)
 {
   return __builtin_arm_stc (__coproc, __CRd, __p);
 }

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_stcl (const unsigned int __coproc, const unsigned int __CRd,
-           void * __p)
+           int * __p)
 {
   return __builtin_arm_stcl (__coproc, __CRd, __p);
 }
@@ -95,28 +95,28 @@

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_ldc2 (const unsigned int __coproc, const unsigned int __CRd,
-           const void * __p)
+           const int * __p)
 {
   return __builtin_arm_ldc2 (__coproc, __CRd, __p);
 }

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_ldc2l (const unsigned int __coproc, const unsigned int __CRd,
-            const void * __p)
+            const int * __p)
 {
   return __builtin_arm_ldc2l (__coproc, __CRd, __p);
 }

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_stc2 (const unsigned int __coproc, const unsigned int __CRd,
-           void * __p)
+           int * __p)
 {
   return __builtin_arm_stc2 (__coproc, __CRd, __p);
 }

 __extension__ static __inline void __attribute__ ((__always_inline__))
 __arm_stc2l (const unsigned int __coproc, const unsigned int __CRd,
-            void * __p)
+            int * __p)
 {
   return __builtin_arm_stc2l (__coproc, __CRd, __p);
 }

-- 
You are receiving this mail because:
You are on the CC list for the bug.
