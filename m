Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9327DC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 14:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D62360884;
	Thu,  7 Aug 2025 14:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_rkdtizAXMZ; Thu,  7 Aug 2025 14:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998E46086D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998E46086D;
	Thu,  7 Aug 2025 14:02:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C2E7233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 324306087A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9DUF1okktaQ for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 14:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89092607CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89092607CB
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:02:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74FA086F70; Thu,  7 Aug 2025 14:02:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 16:02:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c7948af337275ba3ec5ca9d2797fc4ba493da62
X-Git-Newrev: 4b15707056f7456c66566b9eb17e2ee23ad533df
X-Patchwork-Hint: ignore
Message-Id: <20250807140246.74FA086F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: sort dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4b15707056f7456c66566b9eb17e2ee23ad533df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SBOM is easier to read if the dependencies are sorted alphabetically.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 34e5672a43..60983ac1ea 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -205,7 +205,7 @@ def cyclonedx_dependency(ref, depends):
     """
     return {
         "ref": ref,
-        "dependsOn": depends,
+        "dependsOn": sorted(depends),
     }
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
