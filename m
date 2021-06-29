Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA8CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:59:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B86160F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B86160F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47B5D4064E;
	Tue,  3 Aug 2021 23:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYlFE2079dKT; Tue,  3 Aug 2021 23:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EAED405F6;
	Tue,  3 Aug 2021 23:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB2261BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9203406AE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tbcfi904sc4I for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA44640686
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1DEEE8827E; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:17:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 59db11c7c445ef8662163a80997aa71f760a0359
X-Git-Newrev: ccff6bff09438d5a88c70fdebd5d80201fe9de50
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.1DEEE8827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fb-test-app: Install
 fb-test-string
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccff6bff09438d5a88c70fdebd5d80201fe9de50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

fb-test-app suite provides a simple app to draw text on a given frame buffer.
Install it as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fb-test-app/fb-test-app.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 1be59a4207..f6e949015e 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -18,6 +18,7 @@ define FB_TEST_APP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/rect $(TARGET_DIR)/usr/bin/fb-test-rect
 	$(INSTALL) -D -m 0755 $(@D)/fb-test $(TARGET_DIR)/usr/bin/fb-test
 	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
+	$(INSTALL) -D -m 0755 $(@D)/fb-string $(TARGET_DIR)/usr/bin/fb-test-string
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
