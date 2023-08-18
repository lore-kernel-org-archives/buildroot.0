Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F03C7115A
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 15:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B646540211;
	Fri, 18 Aug 2023 15:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B646540211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2tQCdAHjzUWd; Fri, 18 Aug 2023 15:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90AD041758;
	Fri, 18 Aug 2023 15:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90AD041758
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD0BD1BF2EC
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8734440127
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8734440127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRPTzUatGdDt for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 15:16:10 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85CB241979
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 15:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85CB241979
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF795A4C03EA;
 Fri, 18 Aug 2023 17:16:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57672)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qX1Cq-0008AN-1p;
 Fri, 18 Aug 2023 17:16:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 17:16:08 +0200
Message-Id: <20230818151608.988723-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692371768;
 bh=Cqe37F6su0XcqHJgYKMe4TAh2djwi0rnHlzPIG+RQDo=;
 h=From:To:Cc:Subject:Date:From;
 b=VrtxoQgW2m12EHjCI0JBvdIOfB+AHH8fJws5AsKjQcADB4sNlw29Jdx5bAj92sF4y
 oISTrCXkplzSJaHBLbCvD9oBetl7YZjQ+VlnLv5hqAHxNCxvRYBJLPoN7s/KPYHzJY
 9jy9pIUBLtiWycO+tfmKpbTYvBEXD23Xm3fp2nWgE9aAHKYRZcxnScxU7rVkdSOPuj
 g7DukIr89BBRuIwQ4Mn0S/gE1kb9p6+dTsCV8nHLau91Gcc64MZAof5tBSshTc0WG1
 EYCstOt+BYlPvwKH26KHwGSpeB+9CY/TVEGNPHxp7Tzn2cC/0/G9fCrBEUfh9jW+YV
 53jXLXQCPCc5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=VrtxoQgW
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in make
 target .stamp_built
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fix can be backported because the offending line was added in 2009.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5d1c1da128..9d40754939 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -286,7 +286,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(Q)touch $@
 
 # Build
-$(BUILD_DIR)/%/.stamp_built::
+$(BUILD_DIR)/%/.stamp_built:
 	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
 	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
