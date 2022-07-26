Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D046C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE448408AE;
	Tue, 26 Jul 2022 22:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE448408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfpkudJcV9KE; Tue, 26 Jul 2022 22:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF03408A7;
	Tue, 26 Jul 2022 22:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CF03408A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB0321BF311
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E5E84018E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E5E84018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVbYwfPq5zCg for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D777840012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D777840012
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3630F8640B; Tue, 26 Jul 2022 22:01:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 00:14:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc535f7b933def7d07d6f1d897c1e1f3689b077f
X-Git-Newrev: 3f6dbcb2f2b9e21e7546ab456f4bcd7ca6025093
X-Patchwork-Hint: ignore
Message-Id: <20220726220127.3630F8640B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f6dbcb2f2b9e21e7546ab456f4bcd7ca6025093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Noah Huetter <noahhuetter@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
[Thomas/Arnout: change option name from
BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS to
BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/opensbi/Config.in  | 6 ++++++
 boot/opensbi/opensbi.mk | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index f1443498d9..86f848f177 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -119,4 +119,10 @@ config BR2_TARGET_OPENSBI_FW_FDT_PATH
 	  must be set in the U-Boot configuration for this file to be
 	  produced.
 
+config BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES
+	string "Additional build variables"
+	help
+	  Additional parameters for the build, which will be passed on
+	  the make command line. E.g: BUILD_INFO=1.
+
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 01f0c3ad40..06ec87b2c3 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -31,7 +31,8 @@ BR_NO_CHECK_HASH_FOR += $(OPENSBI_SOURCE)
 endif
 
 OPENSBI_MAKE_ENV = \
-	CROSS_COMPILE=$(TARGET_CROSS)
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	$(call qstrip,$(BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES))
 
 OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
 ifneq ($(OPENSBI_PLAT),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
