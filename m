Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E5EC677F1
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D58F41737;
	Wed, 22 Feb 2023 17:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D58F41737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKlfQEaYFy_n; Wed, 22 Feb 2023 17:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EAC041734;
	Wed, 22 Feb 2023 17:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAC041734
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18E581BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8054B40F4E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8054B40F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UEzoD3Y_LZe for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B640410BC
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B640410BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76169867CA; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:45:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3ba34e0e3d59917e9c3645e738ba1faa472b48a6
X-Git-Newrev: 253ee5b11f643a08fa7d144c5d5abeb4fb6ce1a7
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.76169867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] system: remove use of
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

commit: https://git.buildroot.net/buildroot/commit/?id=253ee5b11f643a08fa7d144c5d5abeb4fb6ce1a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 34b0a9a3a4..3db03dce64 100644
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
