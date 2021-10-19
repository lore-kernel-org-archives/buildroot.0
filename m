Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6287BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 06:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5EE6112D
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 06:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D5EE6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1F354016F;
	Tue, 19 Oct 2021 06:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlxN7KEqEMNh; Tue, 19 Oct 2021 06:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 181E6401C5;
	Tue, 19 Oct 2021 06:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5624A1BF2B7
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 06:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45A486078B
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 06:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=h6t.eu
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X81V_qDkDGZH for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 06:40:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.h6t.eu (mail.h6t.eu [159.69.47.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65966605DD
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 06:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A29AEE0079; Tue, 19 Oct 2021 08:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=h6t.eu; s=dkim;
 t=1634625560; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=hQyJzFcHmHmIHXKxmdG8NVviQhZ0Rj6WfT5LelakIqU=;
 b=l2d3zEN23rDmYushUR1BOLeJwrvbZ0dQCCk/vVmJx8ciSY16n9JJlONorwX48HkKxKWpLL
 yrh6unKUZFycS4sysRHSwvwFuUgAcI2ljnS9TH7GReaJ+k5dCvY7lDwb+6o/L3hDk6wiH6
 qAoipaHZqZj+tBchPjStyDc/FGhI2Ng90D7Zw5f8Z5nwNNOs7cAzJ8z5edwUnqbhmgo8KO
 e4ku62wSnjSPO9ksCP78Pc3gU4dMVevvP5rp4ZHvnPPoQ664Rd1Bd8B34CYRJRp8tzSRLN
 Vy3jk0M3zPBl6u5kxBjDQdeHC5VQ0vvvbdoawvIanRevI6ZvemM97tcSPxTsCg==
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 08:39:14 +0200
Message-Id: <20211019063914.58884-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: do not package tasn1
 programs and tests for target
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: moritz@h6t.eu
Cc: Moritz Bitsch <moritz@h6t.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Moritz Bitsch <moritz@h6t.eu>

no included package depends on the tests or programs

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
---
 package/libtasn1/libtasn1.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index d9d14fde83..da7f885fe5 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -20,4 +20,8 @@ LIBTASN1_CONF_ENV = MAKEINFO="true"
 
 LIBTASN1_CONF_OPTS = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
+define LIBTASN1_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/lib DESTDIR=$(TARGET_DIR) install
+endef
+
 $(eval $(autotools-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
