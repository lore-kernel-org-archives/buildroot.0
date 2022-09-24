Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEABC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B6EA40155;
	Sat, 24 Sep 2022 21:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6EA40155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98vibWjIejSp; Sat, 24 Sep 2022 21:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0506E40146;
	Sat, 24 Sep 2022 21:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0506E40146
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 184B31BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6786415E6
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6786415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id In6R8Ot9pB6y for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BFD241977
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFD241977
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FE9085FA7; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 23:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c45f0706c322c5ed7c388f8300ac07c1bc229cc
X-Git-Newrev: e6664ade080ac74469b213c34d40def5f0f581f7
X-Patchwork-Hint: ignore
Message-Id: <20220924214014.0FE9085FA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-backends: bump to version
 1.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5733473255515212293=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5733473255515212293==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e6664ade080ac74469b213c34d40def5f0f581f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second to fifth patches (already in version)

https://gitlab.com/sane-project/backends/-/releases/1.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-genesys-fix-gcc-4.8-compile.patch         | 50 ------------------
 ...-usleep-instead-of-std-this_thread-sleep_.patch | 46 -----------------
 ...rotek-fix-uclibc-compile-include-stdarg.h.patch | 58 ---------------------
 ...600-scanutil-fix-uclibc-compile-include-s.patch | 59 ----------------------
 package/sane-backends/sane-backends.hash           |  4 +-
 package/sane-backends/sane-backends.mk             |  4 +-
 6 files changed, 4 insertions(+), 217 deletions(-)

diff --git a/package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch b/package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch
deleted file mode 100644
index 80346596cb..0000000000
--- a/package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f67cfd6a534e9faaca83afebd61a6d77d7837174 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 15 Mar 2021 20:53:55 +0100
-Subject: [PATCH] genesys: fix gcc-4.8 compile
-
-Fixes:
-
-  genesys/utilities.h:229:23: error: invalid initialization of non-const reference of type 'std::basic_ios<char>&' from an rvalue of type '<brace-enclosed initializer list>'
-           stream_{stream}
-                         ^
-  genesys/image_pipeline.cpp:715:19: error: invalid initialization of non-const reference of type 'genesys::ImagePipelineNode&' from an rvalue of type '<brace-enclosed initializer list>'
-       source_{source}
-                     ^
-
-[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/609]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- backend/genesys/image_pipeline.cpp | 2 +-
- backend/genesys/utilities.h        | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/backend/genesys/image_pipeline.cpp b/backend/genesys/image_pipeline.cpp
-index 4161e95..14e2f8d 100644
---- a/backend/genesys/image_pipeline.cpp
-+++ b/backend/genesys/image_pipeline.cpp
-@@ -712,7 +712,7 @@ ImagePipelineNodeCalibrate::ImagePipelineNodeCalibrate(ImagePipelineNode& source
-                                                        const std::vector<std::uint16_t>& bottom,
-                                                        const std::vector<std::uint16_t>& top,
-                                                        std::size_t x_start) :
--    source_{source}
-+    source_(source)
- {
-     std::size_t size = 0;
-     if (bottom.size() >= x_start && top.size() >= x_start) {
-diff --git a/backend/genesys/utilities.h b/backend/genesys/utilities.h
-index 6e637d0..2ef2ddd 100644
---- a/backend/genesys/utilities.h
-+++ b/backend/genesys/utilities.h
-@@ -226,7 +226,7 @@ class BasicStreamStateSaver
- {
- public:
-     explicit BasicStreamStateSaver(std::basic_ios<Char, Traits>& stream) :
--        stream_{stream}
-+        stream_(stream)
-     {
-         flags_ = stream_.flags();
-         width_ = stream_.width();
--- 
-2.30.1
-
diff --git a/package/sane-backends/0003-genesys-use-usleep-instead-of-std-this_thread-sleep_.patch b/package/sane-backends/0003-genesys-use-usleep-instead-of-std-this_thread-sleep_.patch
deleted file mode 100644
index 348b73e3fb..0000000000
--- a/package/sane-backends/0003-genesys-use-usleep-instead-of-std-this_thread-sleep_.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b6e21e3cd0825e7ec2b3b7e6401d25b901deeed2 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Wed, 31 Mar 2021 22:51:03 +0200
-Subject: [PATCH] genesys: use usleep instead of std::this_thread::sleep_for to
- re-enable thread less compile
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  genesys/scanner_interface_usb.cpp: In member function ‘virtual void genesys::ScannerInterfaceUsb::sleep_us(unsigned int)’:
-  genesys/scanner_interface_usb.cpp:484:10: error: ‘std::this_thread’ has not been declared
-    484 |     std::this_thread::sleep_for(std::chrono::microseconds{microseconds});
-        |          ^~~~~~~~~~~
-
-[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/619]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- backend/genesys/scanner_interface_usb.cpp | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/backend/genesys/scanner_interface_usb.cpp b/backend/genesys/scanner_interface_usb.cpp
-index 117297c..2ca78ab 100644
---- a/backend/genesys/scanner_interface_usb.cpp
-+++ b/backend/genesys/scanner_interface_usb.cpp
-@@ -43,7 +43,6 @@
- 
- #include "scanner_interface_usb.h"
- #include "low.h"
--#include <thread>
- 
- namespace genesys {
- 
-@@ -481,7 +480,7 @@ void ScannerInterfaceUsb::sleep_us(unsigned microseconds)
-     if (sanei_usb_is_replay_mode_enabled()) {
-         return;
-     }
--    std::this_thread::sleep_for(std::chrono::microseconds{microseconds});
-+    usleep(microseconds);
- }
- 
- void ScannerInterfaceUsb::record_progress_message(const char* msg)
--- 
-2.30.2
-
diff --git a/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch b/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
deleted file mode 100644
index c5af162469..0000000000
--- a/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 145e16008e7479ea58278e55f71d6dfcd4db714b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 18 Jun 2021 19:51:45 +0200
-Subject: [PATCH] backend/microtek: fix uclibc compile (include stdarg.h for
- va_list/va_start/va_end)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  microtek.c: In function ‘MDBG_INIT’:
-  microtek.c:163:3: error: unknown type name ‘va_list’
-    163 |   va_list ap;
-        |   ^~~~~~~
-  microtek.c:78:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
-     77 | #include "microtek.h"
-    +++ |+#include <stdarg.h>
-     78 |
-  microtek.c:164:3: warning: implicit declaration of function ‘va_start’; did you mean ‘sane_start’? [-Wimplicit-function-declaration]
-    164 |   va_start(ap, format);
-        |   ^~~~~~~~
-        |   sane_start
-  microtek.c:165:54: warning: passing argument 4 of ‘vsnprintf’ makes pointer from integer without a cast [-Wint-conversion]
-    165 |   vsnprintf(_mdebug_string, MAX_MDBG_LENGTH, format, ap);
-        |                                                      ^~
-        |                                                      |
-        |                                                      int
-  In file included from ../include/sane/sanei_config.h:50,
-                   from microtek.c:70:
-  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:359:57: note: expected ‘__va_list_tag *’ but argument is of type ‘int’
-    359 |         const char *__restrict __format, __gnuc_va_list __arg)
-        |                                          ~~~~~~~~~~~~~~~^~~~~
-  microtek.c:166:3: warning: implicit declaration of function ‘va_end’ [-Wimplicit-function-declaration]
-    166 |   va_end(ap);
-        |   ^~~~~~
-
-[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/638]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- backend/microtek.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/backend/microtek.c b/backend/microtek.c
-index 200a69c1a..63560179c 100644
---- a/backend/microtek.c
-+++ b/backend/microtek.c
-@@ -57,6 +57,7 @@
- 
- #include "../include/sane/config.h"
- 
-+#include <stdarg.h>
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
--- 
-2.31.1
-
diff --git a/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch b/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch
deleted file mode 100644
index 0ea9de245e..0000000000
--- a/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 7dafc52dda96fa68f39058b10eec3d822fd5ea9d Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 18 Jun 2021 19:56:56 +0200
-Subject: [PATCH] backend/sm3600-scanutil: fix uclibc compile (include stdarg.h
- for va_list/va_start/va_end)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  sm3600-scanutil.c: In function ‘debug_printf’:
-  sm3600-scanutil.c:69:3: error: unknown type name ‘va_list’
-     69 |   va_list ap;
-        |   ^~~~~~~
-  sm3600-scanutil.c:48:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
-     47 | #include "sm3600-scantool.h"
-    +++ |+#include <stdarg.h>
-     48 |
-  sm3600-scanutil.c:75:3: warning: implicit declaration of function ‘va_start’; did you mean ‘sane_start’? [-Wimplicit-function-declaration]
-     75 |   va_start(ap,szFormat);
-        |   ^~~~~~~~
-        |   sane_start
-  sm3600-scanutil.c:76:28: warning: passing argument 3 of ‘vfprintf’ makes pointer from integer without a cast [-Wint-conversion]
-     76 |   vfprintf(stderr,szFormat,ap);
-        |                            ^~
-        |                            |
-        |                            int
-  In file included from ../include/sane/sanei_config.h:50,
-                   from sm3600.c:70:
-  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:339:23: note: expected ‘__va_list_tag *’ but argument is of type ‘int’
-    339 |        __gnuc_va_list __arg);
-        |        ~~~~~~~~~~~~~~~^~~~~
-  In file included from sm3600.c:94:
-  sm3600-scanutil.c:77:3: warning: implicit declaration of function ‘va_end’ [-Wimplicit-function-declaration]
-     77 |   va_end(ap);
-        |   ^~~~~~
-
-[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/638]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- backend/sm3600-scanutil.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/backend/sm3600-scanutil.c b/backend/sm3600-scanutil.c
-index 6fe67ed0c..616bf3f4c 100644
---- a/backend/sm3600-scanutil.c
-+++ b/backend/sm3600-scanutil.c
-@@ -43,6 +43,7 @@ Userspace scan tool for the Microtek 3600 scanner
- 
- ====================================================================== */
- 
-+#include <stdarg.h>
- #include <unistd.h>
- #include "sm3600-scantool.h"
- 
--- 
-2.31.1
-
diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
index e382aacef2..4282798d65 100644
--- a/package/sane-backends/sane-backends.hash
+++ b/package/sane-backends/sane-backends.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/sane-project/backends/uploads/a705aadf854ca0dc8bf66df937308861/sane-backends-1.0.32.sha256.txt
-sha256  3a28c237c0a72767086202379f6dc92dbb63ec08dfbab22312cba80e238bb114  sane-backends-1.0.32.tar.gz
+# From https://gitlab.com/sane-project/backends/uploads/d7cf858db3e2abb8fad09cf6b944fc10/sane-backends-1.1.1.sha512.txt
+sha512  25bd9f90d550cfe6a6d01c48e83716a53f4b0e3a294287e455ecb5e5b80c8fe1699f45c6c87f694475cceb85745c70597e18a7b1094669d5091c5fb183dfe94d  sane-backends-1.1.1.tar.gz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index a8f7466f70..83c40e684f 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SANE_BACKENDS_VERSION = 1.0.32
+SANE_BACKENDS_VERSION = 1.1.1
 SANE_BACKENDS_SITE = \
-	https://gitlab.com/sane-project/backends/uploads/104f09c07d35519cc8e72e604f11643f
+	https://gitlab.com/sane-project/backends/uploads/7d30fab4e115029d91027b6a58d64b43
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING

--===============5733473255515212293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5733473255515212293==--
