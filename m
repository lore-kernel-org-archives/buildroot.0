Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D40EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 00:00:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D3A6115A
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 00:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66D3A6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A960608B6;
	Wed, 22 Sep 2021 00:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJtE-bFa9DYn; Wed, 22 Sep 2021 00:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5442C60839;
	Wed, 22 Sep 2021 00:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02BA91BF471
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 23:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3423605AA
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 23:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4SIw1ycLMhb for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 23:59:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68FD26059A
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:59:54 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SpfzmxW6InxSqSpg0mPcET; Wed, 22 Sep 2021 01:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632268792; bh=hFS3LRjOQBPYDGywF1euhFEgTyyWZa1FzZcKBT3fbE4=;
 h=From:To:Subject:Date:MIME-Version;
 b=GHft+iAnTpNbqTaxImzi68N8+4zYWkKqx2NAHyAPXz1A5pV2GBT3VJLrFAyF2SBn6
 0EcC3XnKOUK87YHxfPhYn84FxGnf4yfkSbpEOc0TVKk/74G1LSvYWBtq7KlvDOyvaM
 zA5fiZbbDsjLazsARIQtVMF+TM+XCKbK2g53wXdPUPsGGHNsb8qfIZlkW4xjNkxsxc
 hLLgeYZpwe8SDffwqz/s+/BVdVL6APS/YyqOU2qqG7jkK47aBofSh6Ab/LKMUE/gAj
 F5l4uECEoSP2o10ZHClPru0bYo6UAwU4CkJsDuzgwXePKTjd/rsF+cbuayPA4roj6F
 6du7q336/lpXg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 01:59:51 +0200
Message-Id: <20210921235951.805592-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921235951.805592-1-giulio.benetti@benettiengineering.com>
References: <20210921235951.805592-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfErVAxk3ZlJ8oKHAVc8glviiKtV4bGnZqw8MgLc7zD9ADZaBpoRBDrJ52fGFneXl4kgJT/uVYrgz2dSO17ewc5C6QBShbpb46W/mjUO4BmvMHmvqxXG8
 hLrNuvPWsox5X1UWL+lEKCoe+p+QgFVOyK0sQ/kLTaEp5WyTUvyDwJjdFqKwNl59j4b9UXT5IfhYZxpxy72KYSwoR3jKfYRnEAT/aw+SsGuxdnWBSFfVNtAm
 pJx2Sr7SFKWJpHYuLG4UVA0s2qpxqDCedWQzPWhikvrFq56ErzRpz5PyyRDL6tBL
Subject: [Buildroot] [PATCH 1/1] package/libnss: fix parallel build failure
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

As explained in the patch itself(pending here[1]), I couldn't reproduce
the failure but it seems to be right. Basically I'm making not parallel
every 'nsinstall -R' command that is where it fails.

[1]: https://bugzilla.mozilla.org/show_bug.cgi?id=1731911

Fixes:
http://autobuild.buildroot.net/results/a895ed7aa48edc5cd9ac8bbbd689433a98c9c057/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...31911-Fix-nsinstall-parallel-failure.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch

diff --git a/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch
new file mode 100644
index 0000000000..7ac340f1ca
--- /dev/null
+++ b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch
@@ -0,0 +1,34 @@
+From 7ba4d627212507f876dc112e89c68e82e1c50188 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 22 Sep 2021 01:40:31 +0200
+Subject: [PATCH] Bug 1731911 - Fix nsinstall parallel failure
+
+Fix nsinstall race condition when building using Makefile with parallel
+options on. I've end up making $(1) recipe in copy_varlist_into_dir_RULE
+.NOTPARALLEL. I can't test it that much since it's very very rare, but
+it seems to be the correct way. This way every copy_varlist_into_dir_RULE
+called should occur not parallel and I think that this is acceptable
+since it only create symlinks that takes very few. Further improving is
+possible of course.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/coreconf/rules.mk | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nss/coreconf/rules.mk b/nss/coreconf/rules.mk
+index dc72e9cef..a341b8385 100644
+--- a/nss/coreconf/rules.mk
++++ b/nss/coreconf/rules.mk
+@@ -377,6 +377,8 @@ $(3)/%: %
+ 	$$(INSTALL) -m 444 $$^ $(3)
+ 
+ $(1): $$(addprefix $(3)/,$$($(2))) | $(3)/d
++
++.NOTPARALLEL: $(1)
+ endif
+ else
+ $(1):
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
