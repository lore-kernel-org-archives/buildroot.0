Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E67D462D7
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E32C4057E;
	Wed, 13 Nov 2024 16:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJjvRmSm8MYI; Wed, 13 Nov 2024 16:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C227405B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C227405B4;
	Wed, 13 Nov 2024 16:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7644BE2E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57A396086B
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vy83_7FicotA for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 603326079C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 603326079C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45E6986286; Wed, 13 Nov 2024 16:35:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 17:26:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66f66bbdb50a65ed27660bbe4f9c1598f94b0c42
X-Git-Newrev: 1a9f5eac98ab20f7917ac8d7f27fe1f8d546e2b9
X-Patchwork-Hint: ignore
Message-Id: <20241113163518.45E6986286@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xenomai: fix latest version
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a9f5eac98ab20f7917ac8d7f27fe1f8d546e2b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last xenomai version bump [1] forgot to update the
BR2_PACKAGE_XENOMAI_LATEST_VERSION option string.

[1] 44fafcc41aca4c32ecd937c4b7ae93b7a713d9f2

Reported-by: Pierre Ficheux <pierre.ficheux@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/xenomai/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 32a4e9bc65..13a273a960 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -51,7 +51,7 @@ choice
 	  in the Linux Kernel -> Linux Kernel Extensions menu.
 
 config BR2_PACKAGE_XENOMAI_LATEST_VERSION
-	bool "Latest version (3.0.10)"
+	bool "Latest version (3.2.x)"
 
 config BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
 	bool "Custom version"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
