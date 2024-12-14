Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA573E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 09:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A06845C5;
	Sat, 14 Dec 2024 09:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQAfoA6s___z; Sat, 14 Dec 2024 09:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 054768456C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054768456C;
	Sat, 14 Dec 2024 09:00:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39918C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 09:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24BF760796
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 09:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihKg1UQCfBEs for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 09:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5986C6066E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5986C6066E
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 09:00:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4296C86F09; Sat, 14 Dec 2024 09:00:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 09:51:29 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 16508652202affc0ff0c588cbfe2f6b482f9746c
X-Git-Newrev: 5a07c6f8b3a53f51a005806d45317f47fbeded9b
X-Patchwork-Hint: ignore
Message-Id: <20241214090003.4296C86F09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Config.in: switch GNU
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a07c6f8b3a53f51a005806d45317f47fbeded9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index 8d8dc967fc..ba0804026b 100644
--- a/Config.in
+++ b/Config.in
@@ -274,7 +274,7 @@ config BR2_KERNEL_MIRROR
 
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
