Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21109E77180
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B5A261618;
	Sat, 14 Dec 2024 11:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5_dUU9-gJw6; Sat, 14 Dec 2024 11:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7331861638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7331861638;
	Sat, 14 Dec 2024 11:11:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 689D4CF
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C4A0413CA
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FCgY332F6Co for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD8940DAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CD8940DAB
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4577386F7D; Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 09:51:20 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 0f5fc9b06576f7cb5330c4d9d46f1cffcf88ef7e
X-Git-Newrev: 93a2581bfd985e0cdcc86b3da4836cc1ccd47b91
X-Patchwork-Hint: ignore
Message-Id: <20241214111108.4577386F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] Config.in: switch GNU
 mirrors URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=93a2581bfd985e0cdcc86b3da4836cc1ccd47b91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

As explained on [1], the primary GNU mirrors URL is https.
This commit updates BR2_GNU_MIRROR to switch to it.

[1] https://www.gnu.org/prep/ftp.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 0f9da3934b9fc1425db49526ab7735a601ac1edb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d7a8dc6848..247a9e8ef1 100644
--- a/Config.in
+++ b/Config.in
@@ -285,7 +285,7 @@ config BR2_KERNEL_MIRROR
 
 config BR2_GNU_MIRROR
 	string "GNU Software mirror"
-	default "http://ftpmirror.gnu.org"
+	default "https://ftpmirror.gnu.org"
 	help
 	  GNU has multiple software mirrors scattered around the
 	  world. The following allows you to select your preferred
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
