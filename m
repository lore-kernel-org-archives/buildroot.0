From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Jul 2013 12:44:09 -0300
Subject: [Buildroot] [PATCHv2] package/uclibc: fix big oops from fb354d5f
Message-ID: <1374680649-24409-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...0010-Rules.mak-fix-breakage-from-603af30d.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0010-Rules.mak-fix-breakage-from-603af30d.patch

diff --git a/package/uclibc/0.9.33.2/uclibc-0010-Rules.mak-fix-breakage-from-603af30d.patch b/package/uclibc/0.9.33.2/uclibc-0010-Rules.mak-fix-breakage-from-603af30d.patch
new file mode 100644
index 0000000..61ed439
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0010-Rules.mak-fix-breakage-from-603af30d.patch
@@ -0,0 +1,31 @@
+From f5017653dc63d62c94cc2884ed3a50a4f93001cd Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 24 Jul 2013 12:28:19 -0300
+Subject: [PATCHv2] Rules.mak: fix breakage from 603af30d
+
+Removing the whitespace from findstring for 64 bit architectures has
+bad consequences since powerpc would be a match in powerpc64 and sparc
+would also be a match in sparc64.
+That doesn't make them 64 bits in reality causing general breakage.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Rules.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index 889108e..be53d81 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -141,7 +141,7 @@ UBACKTRACE_DSO := libubacktrace.so.$(ABI_VERSION)
+ 
+ UCLIBC_LDSO_NAME := ld-uClibc
+ ARCH_NATIVE_BIT := 32
+-ifneq ($(findstring $(TARGET_ARCH),hppa64 ia64 powerpc64 s390x sparc64 x86_64),)
++ifneq ($(findstring  $(TARGET_ARCH) , hppa64 ia64 powerpc64 s390x sparc64 x86_64 ),)
+ UCLIBC_LDSO_NAME := ld64-uClibc
+ ARCH_NATIVE_BIT := 64
+ else
+-- 
+1.8.1.5
+
-- 
1.8.1.5
