Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500B5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 22:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E02827A9;
	Wed, 19 Jan 2022 22:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HODQb0wvHrfj; Wed, 19 Jan 2022 22:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1652D82741;
	Wed, 19 Jan 2022 22:23:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07AA71BF3FF
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 22:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8CE0401A1
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 22:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIhVNT3DXTIU for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 22:23:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09CDF4011C
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 22:23:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AJMbnmV0dDzPJAJMbn28Jb; Wed, 19 Jan 2022 23:23:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642631013; bh=CmKbKQ90eb8SVyLc+OvwV1obiw3mujzXDir+25rPFs4=;
 h=From:To:Subject:Date:MIME-Version;
 b=f5aezAprjBbpWDkDZDg89s9fNhZALj0X71hdlzHsIAA8K93TaNBIDmIV6ZWRtD7aE
 OKbKWPlqyub5TjN2gP824Jl++kSyyEpnw/hs1fymhXflRVZGfsSfJz7O3pEb0SxAX7
 YmBh5mMpGtze3cDwd3mSqi4jg+BXcXvfIdkvWEngVaTGdPvyGKaZkVkmD8CYktUmIR
 CVMCUwM7+5Duy8UkCNvdQLRT1kBLIALDC/ow1XAU4Xo/3gPVGRZ6sSqmH7ONTtv81l
 jO9iJwG9NXexwrCo9+G5rGli/Rbqf3jjPeMNCN1PokIGahpfRIS+M0cKjxL+kRVZlp
 RgPy0jItcreeA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 23:23:32 +0100
Message-Id: <20220119222332.66485-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
References: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMhvi5tpf3JYk8jDLJUjjG6FCcmyqp4jjcFLTb5fA/LjedeuD/ileCPsCvV/5K6Moo5j2Hft/qfWwxzJpbZ0sQ+d1pEhBleaviLauoEzFS0JGufyjkiS
 QBgAyrqOPY1Uxa5EBv0ZaMU61dSMgQjcHyEfGKY7/O5yJwbWQhkEeNu3HzEsEDGAskaOSoEk1GVwUyptGnzoyNioEZa6hzXFhkONHbLLbSlwL1e5OmuCSMyr
 EdcAKaqCLK6u4KvsMO+hO7TUyPjHZKQgRthgI2k/1cxjZpNxI1ERUYIYwgyMC6fGbhNbj/f9c+6w3RCuy4rgZ6Kk/9GVkArnSKwQeaacCVXIMaVLXaGLVc4Y
 rHuyxDmDpoGjKcjRI/pvnBchHCilhQ==
Subject: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

Some rules in the refpolicy are declared with "dontaudit", effectively
suppressing any AVC violation log, while still denying the actions.

This is useful in some cases, where denied actions are to be expected
but won't prevent the system from operating.

However in some other cases, the suppressed logs are important to
troubleshoot some issues.

Disabling the "dontaudit" rules can be done either from the running
system by rebuilding the policy with "semodules -DB", or when initialy
building the policy by using the "enableaudit" make target.

This commit allows building the refpolicy with the "enableaudit" target
prior to installing it, thanks to a dedicated config option.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: moved REFPOLICY_POST_BUILD_HOOKS inside ifeq/endef]
---
Maxime:
V1->V2:
* Use POST_BUILD_HOOKS to summon make enableaudit, as per Antoine Tenart
and Thomas petazzoni's reviews
Giulio:
V2->V3:
* moved REFPOLICY_POST_BUILD_HOOKS into ifeq/endef as suggested by Antoine
Tenart

NOTE: this patch superseeds V2:
https://patchwork.ozlabs.org/project/buildroot/patch/20210128125256.1419587-1-maxime.chevallier@bootlin.com/
---
 package/refpolicy/Config.in    | 14 ++++++++++++++
 package/refpolicy/refpolicy.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..caba147feb 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -113,6 +113,20 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+config BR2_REFPOLICY_DISABLE_DONTAUDIT
+	bool "Disable dontaudit"
+	help
+	  Builds the refpolicy with the "dontaudit" rules disabled.
+	  This will trigger unseen, and probably unharmful audit logs that are
+	  explicitely silenced otherwise. This option can be helpful for
+	  debugging purposes, should a silenced message cause a real issue
+	  that would otherwise be hard to troubleshoot.
+
+	  This option should be used for debugging purposes only, due to
+	  the amount of avc logs it generates.
+
+	  If unsure, select n.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads, gcc >= 5, host gcc >= 5"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 44c50af278..e113c3496e 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -118,6 +118,13 @@ define REFPOLICY_BUILD_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) policy
 endef
 
+ifeq ($(BR2_REFPOLICY_DISABLE_DONTAUDIT),y)
+define REFPOLICY_DISABLE_DONTAUDIT_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) enableaudit
+endef
+REFPOLICY_POST_BUILD_HOOKS += REFPOLICY_DISABLE_DONTAUDIT_CMDS
+endif
+
 define REFPOLICY_INSTALL_STAGING_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
 		install-src install-headers
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
