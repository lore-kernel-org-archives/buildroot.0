Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B39DCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8EF14157E;
	Mon, 18 Sep 2023 19:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8EF14157E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q513pTbLkfgO; Mon, 18 Sep 2023 19:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E7741586;
	Mon, 18 Sep 2023 19:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02E7741586
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 731411BF371
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 19:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC61820BB
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 19:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC61820BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrbcUaa_-kmm for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 19:45:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A96381FBC
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 19:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A96381FBC
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F0FE613F8B8;
 Mon, 18 Sep 2023 21:45:24 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 21:45:19 +0200
Message-ID: <20230918194519.68987-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695066327;
 bh=eQavKOGeCJ2a2b2l60fgzW2vzPjCTp5JZWKVWJ1bo88=;
 h=From:To:Cc:Subject:Date:From;
 b=jpg4uUFtm0UDBo+YcI/UaPpAFTMCJYMYKqDlaPRvFWUcZHvEgctI1ifpUvbN8SW6n
 5QoBLYD4WhOyqBhhYstZY015P4GNga0E9lahhQjFQ87rwKnKSpOYfeBdm144qRISDL
 wRQ0DU+l3kEd1yNzHs/xVk+IT5xevgF34es9Pc3+Rf1Z9BibcAbxIm5Vk+3iVDhGHN
 MfnEQxrmZMgdu3nB9Q0MHErva7rikO4bLKI+lFCXDe1qKUTST4hb2FXnxkir3FPv85
 ee7L5giTBN0n749p2TREtNecUF5g5gz2N0ZOiWGUozbzD6qJrGnQL3R8BeBuFpBcuB
 6A7/jGYHbTN0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jpg4uUFt
Subject: [Buildroot] [PATCH 1/1] package/tcl: fix package patch
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit 4e365d1768 "package/tcl: bump to version 8.6.13" did NOT
refreshed the package patch, because the patch was still applying
correctly and the package was working as expected.

It was refreshed in the previous bump, in commit 9cf314745a
"package/tcl: bump to version 8.6.12".

Looking closer at the patch content, the -/+ lines are exactly the
same. So this patch does not change anything. Since the file was kept
and the commit log mention a patch refresh, the intent was more
likely to carry over the old patch (which was declaring all libc
functions as "unbroken".

This commit actually refreshes this patch. It was regenerated with
git format-patch. Since the patch is renamed due to git format-patch,
the .checkpackageignore is updated accordingly.

Note:
This ancient patch will be removed soon, as an upstream commit [1],
not yet in a release, cleaned up and removed those old parts.

[1] https://github.com/tcltk/tcl/commit/04d66a25716cb7738dad3170cca4d0a4683db08a

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 96130dc with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_tcl
    ...
    OK

    utils/test-pkg -a -p tcl
    ...
    45 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 .checkpackageignore                              |  2 +-
 ... 0001-Disable-tcl-compatibility-layers.patch} | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)
 rename package/tcl/{0001-dont-build-compat.patch => 0001-Disable-tcl-compatibility-layers.patch} (61%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 73a00d610c..699b067cca 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1390,7 +1390,7 @@ package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch Upstr
 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch Upstream
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch Upstream
 package/tcf-agent/S55tcf-agent Shellcheck Variables
-package/tcl/0001-dont-build-compat.patch Upstream
+package/tcl/0001-Disable-tcl-compatibility-layers.patch Upstream
 package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch Upstream
 package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch Upstream
 package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch Upstream
diff --git a/package/tcl/0001-dont-build-compat.patch b/package/tcl/0001-Disable-tcl-compatibility-layers.patch
similarity index 61%
rename from package/tcl/0001-dont-build-compat.patch
rename to package/tcl/0001-Disable-tcl-compatibility-layers.patch
index 7a7d959cd2..b7b776ad5d 100644
--- a/package/tcl/0001-dont-build-compat.patch
+++ b/package/tcl/0001-Disable-tcl-compatibility-layers.patch
@@ -1,4 +1,6 @@
+From c829552921f0c7c8e522f911135ee100742b441b Mon Sep 17 00:00:00 2001
 From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+Date: Tue, 8 Apr 2014 15:54:04 -0500
 Subject: [PATCH] Disable tcl compatibility layers
 
 Turn off building compatibility layers for old/broken versions of
@@ -9,17 +11,25 @@ to not have broken behavior.
 Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
 [Fabrice: Update for 8.6.12]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Julien: Update for 8.6.13]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
+ unix/tcl.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
+index ca94abd4ad..42eb58d384 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
-@@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
+@@ -2646,7 +2646,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
  #include <stdlib.h>
  #include <string.h>
  int main() {]$2[}]]])],[tcl_cv_$1_unbroken=ok],
 -		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
-+		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
-	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
++		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=ok]))
+ 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
  	    tcl_ok=1
  	else
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
