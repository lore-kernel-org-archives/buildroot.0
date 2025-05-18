Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0082EC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BAF60D68;
	Sun, 18 May 2025 08:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJhz8FMvU5lZ; Sun, 18 May 2025 08:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AA260E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AA260E1A;
	Sun, 18 May 2025 08:57:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71DD8DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6397B400C6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvzKpMhkqzGU for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7110C40FDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7110C40FDE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7110C40FDE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AB41843304;
 Sun, 18 May 2025 08:57:27 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 18 May 2025 10:56:57 +0200
Message-ID: <20250518085723.23020-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefhfeeviedtueefhefhvdejveffveehvdeifefffffgjeduvdelteffveehveffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrsggvpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DIV4AsZ45cjmGR9JHG2qIsyMxPLpAiS0R5c72BzTE2M=;
 b=etQWhDxI2T8OtGJySe2YPq0WmcfoFS80m8Uf9fgd2pos5dxPWOf8e/QI+vjcPsCbcYAvzS
 CK3FGLX+m4GOHE02KCXGekSommSECJciIdvDMp4maQM3qQ9bm3raGO2JwIWlkIAmgPybmB
 DvcyBI1hr4q+PTv1PHnqAw6KSdErBFUDb2xAAuHuB28XR3bf48qRge82rTUoUMtsOzdNL4
 170qOz8PrlAc0+JJZZ36eAgT7h6K5UsM4lbrzDhjtg/khBnNpst858KUwjt+abLSZqgcPS
 efcczupMdiWzOeVNErMNrb3dTyUosmbwLWYgor/9xh42+qZc8GBr/gnT//yttw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=etQWhDxI
Subject: [Buildroot] [PATCH 04/22] package/dovecot: document why the ignore
 CVE entry is not stale
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

The new pkg-stats feature of stale ignore CVE entry detection reports
CVE-2022-30550 as stale, but it's not correct: the NVD database is
incorrect, and this has been reported in
https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/.

Let's annotate this information in dovecot.mk so that we don't wonder
why it's reported stale.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dovecot/dovecot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index e116bd3b78..a48cd7536d 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -22,6 +22,10 @@ DOVECOT_DEPENDENCIES = \
 DOVECOT_IGNORE_CVES += CVE-2016-4983
 
 # 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+
+# Note: this ignore CVE entry is reported as stale by pkg-stats, but
+# the NVD database is incorrect:
+# https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/
 DOVECOT_IGNORE_CVES += CVE-2022-30550
 
 DOVECOT_CONF_ENV = \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
