Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA01CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C36BD80D73;
	Thu, 14 Aug 2025 20:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TddQuVJnJRH7; Thu, 14 Aug 2025 20:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA7480D82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA7480D82;
	Thu, 14 Aug 2025 20:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 095E81BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCB7A40329
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMZw6T9zwrDo for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CDE240273
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CDE240273
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E18B8760A; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:29:37 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 34d5425d17f13cc73511c8bbc02bf7fdf9ab83f4
X-Git-Newrev: 5ca396f4bc2e691a64489711ccd5a37a580648d7
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.2E18B8760A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] utils/generate-cyclonedx:
 sort dependencies
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ca396f4bc2e691a64489711ccd5a37a580648d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The SBOM is easier to read if the dependencies are sorted alphabetically.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b15707056f7456c66566b9eb17e2ee23ad533df)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
