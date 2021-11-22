Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F75FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D744040C;
	Mon, 22 Nov 2021 22:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eO66bALh__65; Mon, 22 Nov 2021 22:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BF8403BF;
	Mon, 22 Nov 2021 22:32:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF5F71BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD1294038D
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vryCAkxSpkUR for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:32:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 077B64016B
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:32:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t30so35352523wra.10
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyN1nAKlMUlq7vLVo9lKHFgMghd9xa3zb4QxmzuGPXA=;
 b=EH3wmggldkrnm2/gKHdJ/4Lxis3fn8yGWh0MHJlAuOwDgqsvzdx1B3bdZRwKgrFG7W
 bCrer+TC8jUPyx0xNUGm+ojro/SmT7EJ8JC5G6PcgBH0fVC8NbPKC8E5vwEMvx+sKDFY
 6ojB13O46+zo5JKtrqfkKXB3ZdBBjRH6o89QoSx188qNKQX0hn8gOFJ+Ww1KoAy3zX2n
 Vw4ODBNLv8oUOWo50RPJpHNKTHwRKUBKcDqRdn2l4Vjh1x188IA/MRu5v7MLhGeIKmWJ
 KXLlFsGy6ARSoRRW7tNsy1NM2ZpDyJ8z9guYZ6ngq2K2sJveynql1pAZUj5UMHOLnnLF
 noNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyN1nAKlMUlq7vLVo9lKHFgMghd9xa3zb4QxmzuGPXA=;
 b=ixFONSqIErjZH9wD4BMKZrb2JcI45HG1Ukb2cTpHxS8bE/ToLvyvgPREyy7fvB1RY+
 zy3lzalTOXCeE/7KXPwnZJOOMbKDkzOUWuElpNsX/i3wmqPkPBWTLOAdQRWaWMh3scS0
 RtYjOAnbgET4uDbjAiB2cTqft8P7UO5/aCD5rQF1e220dEzwfPV2FMUHdDCSDccLP2a2
 gOi9MO2cYve9SdY/U7WKwHwjEKdECmvFc5RXD/EhFVT8WMh04Q2osTPx7t7rXbLVqZfs
 iVO5INfesK5T3Y7pqBeMof09RwfeErvYSKepkicdmykUuntOs/7PPH7YQZNlyffXBKk/
 tqFw==
X-Gm-Message-State: AOAM532ClxAKxT/BXzXmf0P0e+wNIDa1VGj7faOROn7KOZz7A2+y7Ojd
 Gyu00kMmZu1r3eW2sYHn5Thc+gAu+PQ=
X-Google-Smtp-Source: ABdhPJwSd6x2YeImA+mESGUPbn0I2I6EIqfmp8cZRSDEjOJeX8QT3YIBWEUTNEzyp4VFsHiCA4uEyQ==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr929720wrd.369.1637620339020;
 Mon, 22 Nov 2021 14:32:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id p19sm12246453wmq.4.2021.11.22.14.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:32:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:29:56 +0100
Message-Id: <20211122222956.3540003-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/toolchain: rename
 GLIBC_COPY_NSSWITCH_FILE
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/toolchain/toolchain.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 0afb12c036..18f1dbea1a 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -39,12 +39,12 @@ endif
 
 # Install default nsswitch.conf file if the skeleton doesn't provide it
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-define GLIBC_COPY_NSSWITCH_FILE
+define TOOLCHAIN_GLIBC_COPY_NSSWITCH_FILE
 	@if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
 		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
 	fi
 endef
-TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += GLIBC_COPY_NSSWITCH_FILE
+TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_GLIBC_COPY_NSSWITCH_FILE
 endif
 
 $(eval $(virtual-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
