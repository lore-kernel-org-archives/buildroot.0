Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722E7C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 11:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15250406F1;
	Sun, 18 May 2025 11:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgpUGPyYSPO8; Sun, 18 May 2025 11:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7324097E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7324097E;
	Sun, 18 May 2025 11:55:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E08531BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D14B380E50
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThLHXvsbfTeh for <buildroot@buildroot.org>;
 Sun, 18 May 2025 11:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2377E8191E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2377E8191E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1110B86F4E; Sun, 18 May 2025 11:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 13:55:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cce6d79d3a899722c75a99b7bd12e6274aaccaf
X-Git-Newrev: 0b020912353ce6362961ddcc27325d34cc68f0a1
X-Patchwork-Hint: ignore
Message-Id: <20250518115539.1110B86F4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: remove absolute path
 of link source for fw_setenv
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b020912353ce6362961ddcc27325d34cc68f0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For portability reason, it isn't preferable to include an absolute path
in the link to fw_printenv which is in the same directory as fw_setenv.

Fixes: 42646265d5dd ("package/uboot-tools: add fw_printenv to host uboot tools")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d897a6bc17..1925047ccd 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -220,7 +220,7 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
 	$(HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(HOST_DIR)/bin/fw_printenv
-	ln -sf $(HOST_DIR)/bin/fw_printenv $(HOST_DIR)/bin/fw_setenv
+	ln -sf fw_printenv $(HOST_DIR)/bin/fw_setenv
 	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
 	$(HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
