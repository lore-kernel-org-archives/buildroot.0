Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9688BC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61788417C1;
	Wed, 28 Feb 2024 21:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5QwVn3lJlAK; Wed, 28 Feb 2024 21:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D40541785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D40541785;
	Wed, 28 Feb 2024 21:27:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C99391BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91AA882430
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9OYv7JYz6vl for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D44D81971
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D44D81971
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B11587CE2; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:13:32 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a5f721dca6e9682f665a5fb94801b73f37daaf7d
X-Git-Newrev: 783f8284705770e082b1094a2f1413c6b2b486c5
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.7B11587CE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/lvm2: fix CPE
 variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=783f8284705770e082b1094a2f1413c6b2b486c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit d70da0be78779699a296e21532665ee149a2a3b8 wrongly set
LVM2_CPE_ID_PRODUCT instead of LVM2_CPE_ID_VENDOR

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c0d9795a7a75a36574a7cc89107d71cb32fd20e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 474ea30bdc..810d668ec2 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -10,7 +10,7 @@ LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
-LVM2_CPE_ID_PRODUCT = redhat
+LVM2_CPE_ID_VENDOR = redhat
 # parallel build issues
 LVM2_MAKE = $(MAKE1)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
