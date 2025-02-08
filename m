Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF3FC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 15:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED4360627;
	Sat,  8 Feb 2025 15:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i09GjHJmcO1e; Sat,  8 Feb 2025 15:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86DA96068B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86DA96068B;
	Sat,  8 Feb 2025 15:39:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A733CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 458BA83EC8
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQnW5RG_fsJU for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 15:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 299AB83C77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299AB83C77
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 299AB83C77
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:39:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3C17C41DF3;
 Sat,  8 Feb 2025 15:39:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Feb 2025 16:39:28 +0100
Message-ID: <20250208153929.197344-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvudeljeelteeifefftefhveehkeejveffgeeljeevgeegfeefveeuleelgedvhfenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehth
 hhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1739029172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FnKRyKV1xwCheOy74Po8fYL7PZzzh5Tqqa4YiZMPHzI=;
 b=H7e5X+6kZcDlzcUspI6tDYOtgY9W8knm6sJzxERctfoJdAP/QnHrkkejJuF/i/vPph05br
 DYs8pzMpweSDqfoiSy6hKia0YRdKW11FNyOHv1zEfgtyUJWkpwn4VqbKH3RrKwcEIlXV4u
 zZovbrESXmfpnk/CcpTkeK3xqBujJNfnt7hVwn37gN8M6TT8c6Ebk66yhIZ9+NiOEtW+Su
 cGsiv8uo7mFrmobDbsIa7eQXtVAsGCsOIhfmxglPwYBQaINJQfK3ZIYEXpCpZuvvTcwAHk
 KsDgSZSob/59RCwtgiOxFnQ/eAC15FT0Wi+XuulTvUweRjra7ujnjx5Q8gjoRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H7e5X+6k
Subject: [Buildroot] [PATCH] package/busybox: disable
 CONFIG_FEATURE_IP_LINK_CAN if headers < 4.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the recent bump of Busybox to 1.37.0 in commit
ed84e971c36b43f564df881d86ac459bb5b7dad0, the build fails on
configurations with old kernel headers. Indeed, the new
CONFIG_FEATURE_IP_LINK_CAN Busybox option uses IFLA_CAN_TERMINATION,
which was only introduced in Linux 4.11.

This commit addresses this issue by disabling
CONFIG_FEATURE_IP_LINK_CAN if the headers are not old enough.

Fixes:

  https://gitlab.com/kubu93/buildroot/-/jobs/9059854451

Fixes: ed84e971c36b43f564df881d86ac459bb5b7dad0 ("package/busybox bump version to 1.37.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f1439fbc..d3074d2218 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -410,6 +410,13 @@ define BUSYBOX_INSTALL_ADD_TO_SHELLS
 endef
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11),)
+# IFLA_CAN_TERMINATION was introduced in Linux 4.11
+define BUSYBOX_DISABLE_IP_LINK_CAN
+	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IP_LINK_CAN)
+endef
+endif
+
 define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_MUSL_DISABLE_SHA_HWACCEL)
 	$(BUSYBOX_SET_MMU)
@@ -422,6 +429,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(BUSYBOX_DISABLE_IP_LINK_CAN)
 	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
 endef
 
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
