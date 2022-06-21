Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97456C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 14:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BF983E88;
	Tue, 21 Jun 2022 14:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22BF983E88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6YCdu7IXTAp; Tue, 21 Jun 2022 14:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 519E883EA7;
	Tue, 21 Jun 2022 14:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 519E883EA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D66A61BF5A5
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E70440445
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E70440445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxPdL56C3zPW for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 14:04:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B32F5403D6
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B32F5403D6
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:04:40 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 35478D0807
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 13:58:40 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D873420000A;
 Tue, 21 Jun 2022 13:58:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 15:58:33 +0200
Message-Id: <20220621135833.1148493-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655819914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3Q26RhEPVbQZK5A9UUAmohu2lHLeh4m/By4CIC2P7uw=;
 b=alygbWSYVfpBbPKXZ3ZFWZaeU2Nw2I+6z/qpqeisl5C38xaBLhB7GGc+c2AmqhPzZU6I+z
 AA4g66gq6RGzRzNKyY0i/Kix87mTeXohqXnDR6bMdvH31WSRFGp/f4639THVYSylKOQSW7
 V4LLtzBJeKVxZQEnhaXnmsli9y2zMVLUiQeWCV7q6RJ+Cxk8gUZA5tfXKG90wf0dhfP7Y8
 MpI/fHjxna9xv5CzqoAyARlOLunj/qLUfk/51asI2PZOGjzgZymvUlA59zU4DeLkfr4xpr
 p3HlB/Dr8pmpYCoryTfxBUEyWqoANAh5qmqxqKr+b6VZV7z+jVa/Y0wsvIUriA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=alygbWSY
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: remove extra ending
 parentheses
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, geomatsi@gmail.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

There are two extra ending parentheses to be removed.
They are present from the beggining of TF-A package. I suppose extra
ending parenthese does not bring any issue, but it seems relevant to
remove them.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 998de4b814..965b1a2eb5 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -191,8 +191,8 @@ endef
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
 
 ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
-ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))),)
-$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
+ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION)
 endif
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
