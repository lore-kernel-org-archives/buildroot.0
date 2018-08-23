From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:29:36 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/samba4: Fix
 uClibc build on 64bit platforms by including stdint.h
Message-ID: <20180824063605.530A688791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3c8d500d686bd95abdd06658ddac3e1431cb118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Patch needed to be updated for samba-4.8.4

Fixes
http://autobuild.buildroot.net/results/140/1404a594583ff192d70086ef590f924472465c89/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6d3723147659542ec1cba4139981d75413d89edc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...build-on-64bit-platforms-by-including-std.patch | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
index 1256d1c969..0f174d5369 100644
--- a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
+++ b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
@@ -1,4 +1,4 @@
-From 4a63f267efab2ef86adbeddda45909127135d7c8 Mon Sep 17 00:00:00 2001
+From 3d91847322eba55e97adc76c5c95570382af7059 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 28 Jan 2018 11:57:11 +0100
 Subject: [PATCH] Fix uClibc build on 64bit platforms by including stdint.h
@@ -20,15 +20,19 @@ define uintptr_t, this patch includes stdint.h when needed.
 Patch sent upstream:
 https://lists.samba.org/archive/samba-technical/2018-January/125306.html
 
+[updated for samba-4.8.4, v2 sent upstream
+ https://lists.samba.org/archive/samba-technical/2018-August/129732.html]
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  lib/ldb/tests/ldb_mod_op_test.c   | 1 +
  lib/ldb/tests/ldb_msg.c           | 1 +
+ libcli/auth/tests/ntlm_check.c    | 1 +
  libcli/smb/test_smb1cli_session.c | 1 +
- 3 files changed, 3 insertions(+)
+ 4 files changed, 4 insertions(+)
 
 diff --git a/lib/ldb/tests/ldb_mod_op_test.c b/lib/ldb/tests/ldb_mod_op_test.c
-index cf2288c7bce..4690594186e 100644
+index c8b9c1aa9ff..4893dc3b38b 100644
 --- a/lib/ldb/tests/ldb_mod_op_test.c
 +++ b/lib/ldb/tests/ldb_mod_op_test.c
 @@ -13,6 +13,7 @@
@@ -51,6 +55,18 @@ index f8de418e0dc..31786a9a318 100644
  #include <setjmp.h>
  #include <cmocka.h>
  
+diff --git a/libcli/auth/tests/ntlm_check.c b/libcli/auth/tests/ntlm_check.c
+index e87a0a276d4..65c7b086008 100644
+--- a/libcli/auth/tests/ntlm_check.c
++++ b/libcli/auth/tests/ntlm_check.c
+@@ -40,6 +40,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
 diff --git a/libcli/smb/test_smb1cli_session.c b/libcli/smb/test_smb1cli_session.c
 index d1e21d5431e..6a526c96b61 100644
 --- a/libcli/smb/test_smb1cli_session.c
@@ -63,5 +79,5 @@ index d1e21d5431e..6a526c96b61 100644
  #include <cmocka.h>
  
 -- 
-2.11.0
+2.18.0
 
