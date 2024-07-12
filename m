Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD973C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 710838463A;
	Fri, 12 Jul 2024 19:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EzvCPJQ6FYr; Fri, 12 Jul 2024 19:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6021E84507
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6021E84507;
	Fri, 12 Jul 2024 19:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54CC21BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D9E384507
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHxNmls4Rdjd for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8775384505
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8775384505
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:57:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BC0586165; Fri, 12 Jul 2024 19:57:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:56:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd0d5498ea00c29b22bb8c87b8f593b356deb469
X-Git-Newrev: 2547a3b32d2be1fc2b49da8d6b81f0c711821212
X-Patchwork-Hint: ignore
Message-Id: <20240712195700.6BC0586165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsvgtiny: update the patches to
 be applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2547a3b32d2be1fc2b49da8d6b81f0c711821212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libsvgtiny fails to build with output:

    Applying 0004-Build-Include-gperf-generated-code-directly.patch using patch:
    patching file src/Makefile
    Hunk #1 FAILED at 1.
    1 out of 1 hunk FAILED -- saving rejects to file src/Makefile.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0004-Build-Include-gperf-generated-code-directly.patch        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
index c17426ff05..b5443e9912 100644
--- a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
+++ b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
@@ -11,6 +11,8 @@ svgtiny.c instead, which is the only place its used.
 [Retrieved from:
 https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=4390f1c84e8fee51fc22468821e6fc158e783053]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/Makefile           | 13 +++++++------
  src/colors.gperf       |  8 --------
@@ -44,7 +46,7 @@ index a979720..fb8a72f 100644
 +
 +CLEAN_ITEMS := $(DIR)autogenerated_colors.c
  
- include $(NSBUILD)/Makefile.subdir
+ include build/makefiles/Makefile.subdir
 diff --git a/src/colors.gperf b/src/colors.gperf
 index 96d5b9e..a836787 100644
 --- a/src/colors.gperf
@@ -68,7 +70,7 @@ diff --git a/src/svgtiny.c b/src/svgtiny.c
 index 4661a58..bbefb88 100644
 --- a/src/svgtiny.c
 +++ b/src/svgtiny.c
-@@ -20,6 +20,9 @@
+@@ -17,6 +17,9 @@
  #include "svgtiny.h"
  #include "svgtiny_internal.h"
  
@@ -82,7 +84,7 @@ diff --git a/src/svgtiny_internal.h b/src/svgtiny_internal.h
 index 158d230..6bf5d64 100644
 --- a/src/svgtiny_internal.h
 +++ b/src/svgtiny_internal.h
-@@ -102,9 +102,4 @@ void *svgtiny_list_get(struct svgtiny_list *list,
+@@ -87,9 +87,4 @@
  void *svgtiny_list_push(struct svgtiny_list *list);
  void svgtiny_list_free(struct svgtiny_list *list);
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
