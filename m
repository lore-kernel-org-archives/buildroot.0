Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B94C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 580974F180;
	Tue, 21 Feb 2023 00:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 580974F180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxTXwvpkQ_Ut; Tue, 21 Feb 2023 00:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 057EA4F16E;
	Tue, 21 Feb 2023 00:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 057EA4F16E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AAD11BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B914417C4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B914417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyTpoGxUopVH for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD71F417BF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD71F417BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB1B28648F; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:28:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a97a4a74aa993b09b958639e2276e7f5cf7a75d2
X-Git-Newrev: efc223abd4fe764f8af8238aec67e8cb700db45e
X-Patchwork-Hint: ignore
Message-Id: <20230220205249.CB1B28648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sunxi-mali-utgard:
 properly handle legacy for renamed options
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

commit: https://git.buildroot.net/buildroot/commit/?id=efc223abd4fe764f8af8238aec67e8cb700db45e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "6a7a652b14 package/sunxi-mali-utgard: rename from
sunxi-mali-mainline" tried to add legacy handling but the new symbols
are part of a choice, and Kconfig does not enforce the select of a
option from a choice.

Update the legacy entry for 2022.02, following the example described in
the beginning of the file.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                    | 6 ++++--
 package/sunxi-mali-utgard/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 53fe2f0b97..4bfebe3f89 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -761,20 +761,22 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
 	bool "sunxi-mali-mainline-r6p2 was renamed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
 	help
 	  The sunxi-mali-mainline package has been renamed
 	  sunxi-mali-utgard, the suboptions of this package have also
 	  been renamed accordingly.
+# Note: BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 is still referenced from
+# package/sunxi-mali-utgard/Config.in
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
 	bool "sunxi-mali-mainline-r8p1 was renamed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
 	help
 	  The sunxi-mali-mainline package has been renamed
 	  sunxi-mali-utgard, the suboptions of this package have also
 	  been renamed accordingly.
+# Note: BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1 is still referenced from
+# package/sunxi-mali-utgard/Config.in
 
 config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 	bool "qt5webkit-examples removed"
diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
index ff49ea03f1..59ac21f5ab 100644
--- a/package/sunxi-mali-utgard/Config.in
+++ b/package/sunxi-mali-utgard/Config.in
@@ -20,6 +20,8 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 choice
 	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 # legacy
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1 if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1 # legacy
 	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
 	help
 	  Select the version of the userspace module.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
