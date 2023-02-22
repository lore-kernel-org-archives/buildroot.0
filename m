Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64399C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10B8E41727;
	Wed, 22 Feb 2023 17:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10B8E41727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0J3tuOZYOGt; Wed, 22 Feb 2023 17:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2171641731;
	Wed, 22 Feb 2023 17:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2171641731
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 825161BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC0BC81432
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC0BC81432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMvqEcuEN2Gr for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C240581442
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C240581442
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE522867CA; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:49:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a01ee07c7925b3a8f0ced7c7b85a8b714cb2aba9
X-Git-Newrev: 749129b54a81a9b798202e355c31dff62930b434
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.BE522867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openjdk: properly
 handle legacy for renamed options
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

commit: https://git.buildroot.net/buildroot/commit/?id=749129b54a81a9b798202e355c31dff62930b434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "a610bf9967 package/openjdk{-bin}: bump version to 17.0.1+12"
tried to add legacy handling but the new symbols are part of a choice,
and Kconfig does not enforce the select of a option from a choice.

Update the legacy entry for 2021.11, following the example described in
the beginning of the file.

Cc: Tudor Holton <buildroot@tudorholton.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a97a4a74aa993b09b958639e2276e7f5cf7a75d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy          | 6 ++++--
 package/openjdk/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1b8d197882..e9159782b8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -541,18 +541,20 @@ comment "Legacy options removed in 2021.11"
 config BR2_OPENJDK_VERSION_LTS
 	bool "OpenJDK LTS version was renamed to OpenJDK 11"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENJDK_VERSION_11
 	help
 	  The LTS version option was renamed to OpenJDK 11 to make it
 	  clear what LTS version is.
+# Note: BR2_OPENJDK_VERSION_LTS is still referenced from
+# package/openjdk/Config.in
 
 config BR2_OPENJDK_VERSION_LATEST
 	bool "OpenJDK latest version (16.x) was removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENJDK_VERSION_17
 	help
 	  OpenJDK 16.x is no longer mainted, so the option has been
 	  removed. Use OpenJDK 17.x instead.
+# Note: BR2_OPENJDK_VERSION_LATEST is still referenced from
+# package/openjdk/Config.in
 
 config BR2_PACKAGE_MPD_TIDAL
 	bool "mpd tidal option removed"
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 8b7fd4653e..7671356fdd 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -56,6 +56,8 @@ if BR2_PACKAGE_OPENJDK
 
 choice
 	prompt "openjdk version"
+	default BR2_PACKAGE_OPENJDK_VERSION_11 if BR2_OPENJDK_VERSION_LTS # legacy
+	default BR2_PACKAGE_OPENJDK_VERSION_17 if BR2_OPENJDK_VERSION_LATEST # legacy
 	default BR2_PACKAGE_OPENJDK_VERSION_17
 	help
 	  Select the version of OpenJDK you wish to use.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
