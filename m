Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEA5E8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91591407EE;
	Tue,  3 Feb 2026 22:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33e4bUKeIXGn; Tue,  3 Feb 2026 22:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB19940806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770156660;
	bh=OwdMxe5X5vCxwmkin6KXSS1Bj8zCgn7IDyDhOci2cLw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LuckkQtqnHjZWO/Wcj9VUnF7tPC3ev3LXBCP5IipcE/2Xy7b4nAl0bRxtPgUt0iI/
	 LJCEjV7yyVfKeQGAZ71SkHaq6Boy5Vxe8sWms5lYuO+2dXk+Xc1OQV3kdrZeMrW7oY
	 SiJoPXvJNzOFdN5n6vSa7ldifmWGZbjLFUYRTTXNupadqHkrZoXgWITsP/UwIiL46m
	 PNaxAkuVV0MllCs5JfM6S61IzsRhu7nKXB/U0jRvVCf0RE6xXeVzPBgvL5gjoocQCX
	 otz7jqc//R7RHJBIPG4Y8mrtx0E/3AxEye5Ze4vX2wrnhq20TYOIoBWtR/QwbOGlOv
	 8VYxnWPoquw8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB19940806;
	Tue,  3 Feb 2026 22:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6B8613D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4FEF40806
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgV3HiZP09iz for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24073407EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24073407EE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1388F86766; Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 23:09:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f366204311b48320e5474178f4d853858f807f62
X-Git-Newrev: 4aeb85d6691ce285067a98eef1684c4c5f31d3ef
X-Patchwork-Hint: ignore
Message-Id: <20260203221059.1388F86766@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/pico-sdk: replace
 $(HOST_DIR)/usr/share with $(HOST_DIR)/share"
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aeb85d6691ce285067a98eef1684c4c5f31d3ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 83815826469ac94b76b5aee8c61af95989f91f46 that
missed that the same issue was also in picotool package.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pico-sdk/pico-sdk.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index dfb29d2320..5bcf71650d 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -20,8 +20,8 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 endef
 
 define HOST_PICO_SDK_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/share/pico-sdk
-	cp -r $(@D)/* $(HOST_DIR)/share/pico-sdk
+	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
