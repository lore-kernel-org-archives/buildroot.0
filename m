Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C85C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C47674169C;
	Sat, 23 Jul 2022 20:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C47674169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPEEA0bsMsWS; Sat, 23 Jul 2022 20:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CC654048D;
	Sat, 23 Jul 2022 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CC654048D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B33141BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AFE241578
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AFE241578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oo6red6PpAx7 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE91340926
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE91340926
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2282885165; Sat, 23 Jul 2022 20:05:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:17:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9b54ef06ed085fa79194962510b499e17e7cc58
X-Git-Newrev: f0fc71e0025bbbd8bc5ba4b930d501bbc6e3fd32
X-Patchwork-Hint: ignore
Message-Id: <20220723200510.2282885165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender/mender.mk: add
 bootloader-integration inventory script
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0fc71e0025bbbd8bc5ba4b930d501bbc6e3fd32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script is installed in the official meta-mender yocto recipe. Install it
here as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 000ec36354..5c3c593da6 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -60,7 +60,7 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
 		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
-	$(foreach f,hostinfo network os rootfs-type, \
+	$(foreach f,bootloader-integration hostinfo network os rootfs-type, \
 		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
