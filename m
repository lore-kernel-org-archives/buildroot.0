Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8918BCD13D2
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 13:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52343608BE;
	Sat, 31 Aug 2024 13:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFyz5I5Ew3Ym; Sat, 31 Aug 2024 13:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9746960862
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9746960862;
	Sat, 31 Aug 2024 13:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E48681BF2C2
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D076D816E3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XEgAjc_H0eM for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B990A813EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B990A813EE
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6593B8665F; Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 13:36:15 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 59f3f3222c014cec46b68c153ac92d7c5c03cf07
X-Git-Newrev: 2736c84728154eb9ac7cddd6f887506f805becc7
X-Patchwork-Hint: ignore
Message-Id: <20240831135812.6593B8665F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/bandwidthd: fix
 build with gcc >= 14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2736c84728154eb9ac7cddd6f887506f805becc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with gcc >= 14:

parser.c: In function 'yyparse':
parser.c:1196:16: error: implicit declaration of function 'yylex' [-Wimplicit-function-declaration]
 1196 |       yychar = yylex ();
      |                ^~~~~

While at it, update Upstream tag of first patch

Fixes:
 - http://autobuild.buildroot.org/results/33364071de4e5e51a2ac2337b82d145f71e0e64a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 41cc0f22722e3fbb2581a4f399c2e304fdb061a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...01-src-bandwidthd.h-fix-build-with-gcc-10.patch |  2 +-
 .../0002-src-parser.y-fix-build-with-gcc-14.patch  | 36 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 962ba03fe2..5fd67b5c12 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -402,7 +402,6 @@ package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
 package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch lib_patch.Upstream
-package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/bash/0001-input.h-add-missing-include-on-stdio.h.patch lib_patch.Upstream
 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch lib_patch.Upstream
 package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch lib_patch.Upstream
diff --git a/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch b/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
index e7d0dec8d6..727e18ea84 100644
--- a/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
+++ b/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
@@ -15,7 +15,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/6308c8ee38b6017215038d47c009b238113bd36f
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nroach44/bandwidthd/pull/1]
+Upstream: https://github.com/nroach44/bandwidthd/commit/dde68ed77114d7b19bfed3068edefc9dc0644445
 ---
  src/bandwidthd.h | 4 ++--
  src/graph.c      | 1 +
diff --git a/package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch b/package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..d31070855c
--- /dev/null
+++ b/package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch
@@ -0,0 +1,36 @@
+From 96f5ad56b1bb872c2c24f0c83d06d94ae2936838 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 22 Jul 2024 14:08:45 +0200
+Subject: [PATCH] src/parser.y: fix build with gcc >= 14
+
+Fix the following build failure with gcc >= 14:
+
+parser.c: In function 'yyparse':
+parser.c:1196:16: error: implicit declaration of function 'yylex' [-Wimplicit-function-declaration]
+ 1196 |       yychar = yylex ();
+      |                ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/33364071de4e5e51a2ac2337b82d145f71e0e64a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/nroach44/bandwidthd/pull/3
+---
+ src/parser.y | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/parser.y b/src/parser.y
+index d9acc10..15ce61c 100644
+--- a/src/parser.y
++++ b/src/parser.y
+@@ -11,6 +11,7 @@
+ #include <arpa/inet.h>
+ #include "bandwidthd.h"
+ 
++extern int yylex (void);
+ extern unsigned int SubnetCount;
+ extern struct SubnetData SubnetTable[];
+ extern struct config config;
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
