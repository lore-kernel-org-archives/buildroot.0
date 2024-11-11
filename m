Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C41D2E9F0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B3B80C59;
	Mon, 11 Nov 2024 14:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YJfvoiXkL2t; Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55CDE80C4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CDE80C4C;
	Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A923C6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA9260625
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a54Fd-LR8WE3 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA5D1605A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA5D1605A0
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A747386094; Mon, 11 Nov 2024 14:35:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 15:31:32 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cb52559946d50859dcb4d42ef08a3bf34f00944c
X-Git-Newrev: c19c359e5e83aa8011014ce7ad4252a3625a4415
X-Patchwork-Hint: ignore
Message-Id: <20241111143551.A747386094@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openjdk: fix typo
 in help text of openjdk zero
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

commit: https://git.buildroot.net/buildroot/commit/?id=c19c359e5e83aa8011014ce7ad4252a3625a4415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: He Haorui <hehaorui1999@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f3e805428302c16769da78ce6604d5db77fbc39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 25d6960ecf..78775370ca 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -148,7 +148,7 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 	select BR2_PACKAGE_LIBFFI
 	help
 	  A non-assembler variant with wide arch support, however
-	  performance is less then client/server.
+	  performance is less than client/server.
 
 	  http://openjdk.java.net/projects/zero
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
