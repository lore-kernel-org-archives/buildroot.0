Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AA5CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 14:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F3481E71;
	Mon, 25 Sep 2023 14:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F3481E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_Pr2oQMUWR7; Mon, 25 Sep 2023 14:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D9081501;
	Mon, 25 Sep 2023 14:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D9081501
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224851BF5B4
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0ED7611CC
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0ED7611CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqGYl_hg30a4 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61F36110C
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61F36110C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABE5C87781; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 15:53:24 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 93921d96d53f17015c1d67f4d4f581194416c7c5
X-Git-Newrev: 4bec4ef23ff94e864550234af66de39e495a0cae
X-Patchwork-Hint: ignore
Message-Id: <20230925140304.ABE5C87781@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/tcl: fix package
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bec4ef23ff94e864550234af66de39e495a0cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The commit 4e365d1768 "package/tcl: bump to version 8.6.13" did NOT
refreshed the package patch, because the patch was still applying
correctly and the package was working as expected.

It was refreshed in the previous bump, in commit 9cf314745a
"package/tcl: bump to version 8.6.12". This was part of 2022.02.

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
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ec8a9cc5189d41cf751e872f5c13da3fdc9187ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                      |  2 +-
 ...patch => 0001-Disable-tcl-compatibility-layers.patch} | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 962fc81957..b6b9ba8bf1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1411,7 +1411,7 @@ package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch Upstr
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
