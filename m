Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90185C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E68341770;
	Wed, 22 Feb 2023 17:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E68341770
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NVAHduEYt49; Wed, 22 Feb 2023 17:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E8514176D;
	Wed, 22 Feb 2023 17:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E8514176D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5C61BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E39A8410D4
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E39A8410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3knPssdVA_W for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA691410A6
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA691410A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6798867D2; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:45:42 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 89d06caa82ddd0ba259a5c1d302155fa904ac4bd
X-Git-Newrev: f513808d04edee344bcbab3ec7951bd9110c482d
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.D6798867D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] system: remove use of
 legacy md5 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=f513808d04edee344bcbab3ec7951bd9110c482d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "bf3626002f system cfg: remove mkpasswd MD5 format option", from
release 2019.02, moved the symbol to legacy handling, but the symbol is
still referenced.

Remove the reference to it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 032cfbc716749869b185f83dab450ec47f969765)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index e6dcd25455..bf65b07a76 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -78,7 +78,6 @@ endchoice # Passwd encoding
 
 config BR2_TARGET_GENERIC_PASSWD_METHOD
 	string
-	default "md5"       if BR2_TARGET_GENERIC_PASSWD_MD5
 	default "sha-256"   if BR2_TARGET_GENERIC_PASSWD_SHA256
 	default "sha-512"   if BR2_TARGET_GENERIC_PASSWD_SHA512
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
