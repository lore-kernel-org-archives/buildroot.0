Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547F3C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E3460F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11E3460F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E105D60AFB;
	Wed,  4 Aug 2021 00:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYThpeZzvkKe; Wed,  4 Aug 2021 00:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D4860AE4;
	Wed,  4 Aug 2021 00:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21B921BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC4940ED2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3g4GeQlGlZLZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 418E640F5A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 98C0683D7B; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:46:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5036a3f464f588bc1279a6e695266dfd6340c8c1
X-Git-Newrev: e5637786be2d9ff6424fb902411750938cb1efd9
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.98C0683D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: correctly set
 BUSYBOX_KCONFIG_SUPPORTS_DEFCONFIG
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e5637786be2d9ff6424fb902411750938cb1efd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit e6b3913cfc converted busybox to the generic kconfig help text
infrastructure, but set the wrong variable to flag that it doesn't
support defconfig files. Fix that.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 68e0b8a72c..4b1fbade1d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -103,7 +103,7 @@ ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
-BUSYBOX_KCONFIG_HAS_DEFCONFIG = NO
+BUSYBOX_KCONFIG_SUPPORTS_DEFCONFIG = NO
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
 BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES))
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
