Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30428C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0AD60DF0;
	Sun, 18 May 2025 08:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFmWxhvyyR9H; Sun, 18 May 2025 08:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B68C760E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B68C760E1A;
	Sun, 18 May 2025 08:57:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7193DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D5588126C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Yhf6r6yP5qY for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 734B981275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734B981275
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 734B981275
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9C2A741CFD;
 Sun, 18 May 2025 08:57:30 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:01 +0200
Message-ID: <20250518085723.23020-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeejvddujefgudfggedvleehtdeihfegudeiffdtfeduveeliefftdfghfekheelnecuffhomhgrihhnpehlihgsshhshhdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrsggvpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4LkxeApOIHyJ0augeAVZ/l0XgOMQ6jsvSCBwwL0UKo=;
 b=TPtnLPqlCYg3tQD0sYfINVQP4zBfRFQR9Uifx/EQZkhMLRaNxlDln8Sid8nKo7XG1Ku+3z
 TdOf/09bAAzCfhKGmoXHcjOfQJsAe4vetqJ8p+FITRbd0AzqEBB/XIBxJ6lwxJUjlqWEY4
 OiZ3xVoNKeVyMX0EsCdY4Q3xjoyLh3+y1hivpfQiFHZjHPVlTJK0CoRQPUCXncRYpxeGEb
 wfhMdmMt38ANnNoHfRGvyjVwUHlYVAqyB8Fjn89xAhEd35IU6GR2/5JU+drou4aekM0iTk
 4bFzTtU72X9bHi5pQe92wO9TU0iUIGDBnL9vQaPTI7t9ttz3FBHpQHSHSxtfxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TPtnLPql
Subject: [Buildroot] [PATCH 08/22] package/libssh: drop stale ignore CVE
 entry
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2023-3603 has never affected any release, but NVD decided to
document it as affecting all versions up to 0.8.9. While this is
incorrect, we don't really care much, as we're now using 0.11 which
according to NVD is not affected, making our ignore CVE entry stale.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/libssh.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 6f8a1ac389..a00e6a9445 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,10 +17,6 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
-# Not part of any release
-# https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/
-LIBSSH_IGNORE_CVES += CVE-2023-3603
-
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
