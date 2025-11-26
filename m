Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6EED1038A
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 07:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D9B80CB8;
	Wed, 26 Nov 2025 07:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WM-4x70gEFCS; Wed, 26 Nov 2025 07:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B311080C88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B311080C88;
	Wed, 26 Nov 2025 07:59:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0B623F
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0F4C40598
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl8Q2RIarauO for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 07:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D124140530
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D124140530
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:59:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCC9985EF6; Wed, 26 Nov 2025 07:59:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 08:58:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9abe0ba95a72864cd06bca7a641fd03fde98f6ed
X-Git-Newrev: 4a23826f481f974d9e6df2d776d7bf27b97b14b9
X-Patchwork-Hint: ignore
Message-Id: <20251126075946.BCC9985EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bootgen: bump to
 xilinx_v2025.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============2567311813620213189=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2567311813620213189==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4a23826f481f974d9e6df2d776d7bf27b97b14b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump bootgen to xilinx_v2025.2 version.

The 0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch is no longer
needed because it has been committed upstream and included with the
xilinx_v2025.2 version.

https://github.com/Xilinx/bootgen/commit/0471f084b05769143ea9e73f9c44b075fe40c801

The 0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch has now been
added to the package to fix the following potential build error:

The lms-hash-sigs/hss_param.c is missing an include of stdio.h. Without it,
the following build error can occur:

hss_param.c: In function ‘hss_get_parameter_set’:
hss_param.c:157:13: error: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
  157 |             printf("Private key expired\n");
      |             ^~~~~~
hss_param.c:7:1: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
    6 | #include "lm_common.h"
  +++ |+#include <stdio.h>
    7 |
hss_param.c:157:13: warning: incompatible implicit declaration of built-in function ‘printf’ [-Wbuiltin-declaration-mismatch]
  157 |             printf("Private key expired\n");
      |             ^~~~~~
hss_param.c:157:13: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
make[3]: *** [Makefile:38: hss_param.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:84: build/bin/bootgen] Error 2

The above error was reported on Debian 13 / gcc 14.2.0.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Upstream: submitted to Xilinx bootgen repo with CR-1256741

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ex-Fix-build-on-machines-with-modern-flex.patch | 72 ----------------------
 ...hash-sigs-hss_param.c-add-stdio.h-include.patch | 51 +++++++++++++++
 package/bootgen/bootgen.hash                       |  2 +-
 package/bootgen/bootgen.mk                         |  2 +-
 4 files changed, 53 insertions(+), 74 deletions(-)

diff --git a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
deleted file mode 100644
index 817fee195e..0000000000
--- a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From e7e341b7ba6fa9fb875718e8740b03c2041278e8 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Mon, 2 Jun 2025 12:09:13 +0100
-Subject: [PATCH] bisonflex: Fix build on machines with modern flex
-
-With bootgen 2025.1, the directory structure was re-done.  In the process of
-doing this, the source files in the bisonflex directory lost the fix below
-which had been applied on an earlier version of bootgen:
-
-Bootgen embeds an old version of flex, but uses the system include syntax
-(#include <>) to reference it, causing conflicts on systems with the
-development headers for a modern flex version installed, leading to build
-issues like:
-
-../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
-../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})
-
-Fix it by using normal local #include statements by:
-
-sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *
-
-Upstream: submitted to AMD internal jira process
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- bisonflex/bif.yy.cpp        | 2 +-
- bisonflex/cmdoptions.yy.cpp | 2 +-
- bisonflex/reginit.yy.cpp    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/bisonflex/bif.yy.cpp b/bisonflex/bif.yy.cpp
-index 8d4d364..35f0aa5 100755
---- a/bisonflex/bif.yy.cpp
-+++ b/bisonflex/bif.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "../win_include/FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/bisonflex/cmdoptions.yy.cpp b/bisonflex/cmdoptions.yy.cpp
-index 661d7f3..a76ac81 100755
---- a/bisonflex/cmdoptions.yy.cpp
-+++ b/bisonflex/cmdoptions.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "../win_include/FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/bisonflex/reginit.yy.cpp b/bisonflex/reginit.yy.cpp
-index d830734..dede473 100755
---- a/bisonflex/reginit.yy.cpp
-+++ b/bisonflex/reginit.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "../win_include/FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
--- 
-2.25.1
-
diff --git a/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch b/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
new file mode 100644
index 0000000000..738887e26b
--- /dev/null
+++ b/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
@@ -0,0 +1,51 @@
+From 1675ec9d76b32400f612b1c542be6dbf77dea986 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Tue, 25 Nov 2025 12:54:48 +0000
+Subject: [PATCH] lms-hash-sigs/hss_param.c: add stdio.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The lms-hash-sigs/hss_param.c is missing an include of stdio.h. Without it,
+the following build error can occur:
+
+hss_param.c: In function ‘hss_get_parameter_set’:
+hss_param.c:157:13: error: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
+  157 |             printf("Private key expired\n");
+      |             ^~~~~~
+hss_param.c:7:1: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
+    6 | #include "lm_common.h"
+  +++ |+#include <stdio.h>
+    7 |
+hss_param.c:157:13: warning: incompatible implicit declaration of built-in function ‘printf’ [-Wbuiltin-declaration-mismatch]
+  157 |             printf("Private key expired\n");
+      |             ^~~~~~
+hss_param.c:157:13: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
+make[3]: *** [Makefile:38: hss_param.o] Error 1
+make[3]: *** Waiting for unfinished jobs....
+make[2]: *** [Makefile:84: build/bin/bootgen] Error 2
+
+The above error was reported on Debian 13 / gcc 14.2.0.
+
+Reported-by: Peter Korsgaard <peter@korsgaard.com>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: submitted to Xilinx bootgen repo with CR-1256741
+---
+ lms-hash-sigs/hss_param.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lms-hash-sigs/hss_param.c b/lms-hash-sigs/hss_param.c
+index 7a2abd6..6b2b950 100755
+--- a/lms-hash-sigs/hss_param.c
++++ b/lms-hash-sigs/hss_param.c
+@@ -4,6 +4,7 @@
+ #include "endian.h"
+ #include "hss_zeroize.h"
+ #include "lm_common.h"
++#include <stdio.h>
+ 
+ static struct map_structure {
+     param_set_t public;
+-- 
+2.25.1
+
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 7670a5d1ee..995074c591 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3de43a331e10b2a8079d4681ad72cef4884bc3a09250d3d80811d677f3ffe560  bootgen-xilinx_v2025.1.tar.gz
+sha256  c92d9be48fabc943c4addd9b12beced6671f5547b4f6dc01e7ccf0f274dbef66  bootgen-xilinx_v2025.2.tar.gz
 sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 939872b29c..e5cfee18d9 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2025.1
+BOOTGEN_VERSION = xilinx_v2025.2
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0

--===============2567311813620213189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2567311813620213189==--
