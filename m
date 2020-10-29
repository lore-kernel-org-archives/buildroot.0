From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 14:58:48 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/samba4: fix
 uclibc build with openldap
Message-ID: <20201029134641.BC2F084545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39dbbc0ea49792872433455766573168e1a7c03e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/09e84d15efe755bdefa9f8c6b8355c49ddbc2f65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 990c7bfd463d4bbc602c0172692e71928a73c7ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ge_test.c-include-stdint.h-before-cmoka.h.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
new file mode 100644
index 0000000000..e63f43c290
--- /dev/null
+++ b/package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
@@ -0,0 +1,40 @@
+From b2ea5dc3639d68b878c6534f4992da446dbbf2d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 May 2020 18:15:38 +0200
+Subject: [PATCH] ldap_message_test.c: include stdint.h before cmoka.h
+
+This fix the following build failure on uclibc:
+
+In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/include/stdint.h:9:0,
+                 from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/inttypes.h:27,
+                 from ../../lib/replace/../replace/replace.h:64,
+                 from ../../source4/include/includes.h:23,
+                 from ../../libcli/ldap/tests/ldap_message_test.c:41:
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
+ typedef unsigned long int uintptr_t;
+                           ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/09e84d15efe755bdefa9f8c6b8355c49ddbc2f65
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ libcli/ldap/tests/ldap_message_test.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libcli/ldap/tests/ldap_message_test.c b/libcli/ldap/tests/ldap_message_test.c
+index c5aacd4bc6b..51331e5c600 100644
+--- a/libcli/ldap/tests/ldap_message_test.c
++++ b/libcli/ldap/tests/ldap_message_test.c
+@@ -34,6 +34,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+-- 
+2.26.2
+
