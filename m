Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B50C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 16:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61057402B1;
	Sat, 27 Apr 2024 16:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BoXmfETuX-b; Sat, 27 Apr 2024 16:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6072F402DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6072F402DC;
	Sat, 27 Apr 2024 16:14:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 747151BF315
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 16:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6094E402DC
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 16:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zx5jRoSe0N5l for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 16:13:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D7BB402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D7BB402B1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D7BB402B1
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 16:13:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so2372293f8f.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 09:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714234436; x=1714839236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lCaKklwqVcRnaq1aMsb1hWu0c0RLFPxH8bKr0funpjU=;
 b=JXVtjA7iZvvZISlJg9w+Q/V9vCLqU/2/MlmmmCEuAhsuBS1gpywBkxWSEH95AEKN/f
 rzUirmyj4KESuac0xbLDpzPx8zhP+gG2mU1XDwZqtL5lAbsPEzUZd6UQiBsmj1MDR6KS
 Sj1osZXk0Zz473O7WklxXU/ot/moHEuZLJWA5wBFN+2NYZMk29j1vH/xKRxMway5DEfx
 VWJxxChK6x7zfcyCN7+pH7r3D7XGpvSpctoGmUufhca039Vpn/Rj3wH3T0WhkdvalHVW
 7xFzORpQBlYQQZ6FvqMN1X8HPwQDflxTQHTL96xdMZgOrKd8IBXLo/2jf87z6bEXV90L
 Agtw==
X-Gm-Message-State: AOJu0YzyvEuIcTrri45ArIFTacjDBMgh376Ve0BEvfriUkfzqsy9XVn4
 Vu2+Bwc54P0KI7e1HZH/XPj8+G+KXb0laOm+GuU+ozjfhKrIT1neIQ4zgA==
X-Google-Smtp-Source: AGHT+IHIorqtL/WO15g0slpjvt5vLBA7fxnhacM1uP6JMQOF63eN3MfcLw6oak6aPJu6lHJN20sX5A==
X-Received: by 2002:adf:eb8c:0:b0:33e:c91b:9083 with SMTP id
 t12-20020adfeb8c000000b0033ec91b9083mr2054479wrn.16.1714234435694; 
 Sat, 27 Apr 2024 09:13:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 a9-20020a05600c348900b0041bb11ff5a7sm4629361wmq.8.2024.04.27.09.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 09:13:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 18:12:56 +0200
Message-ID: <20240427161256.71818-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714234436; x=1714839236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lCaKklwqVcRnaq1aMsb1hWu0c0RLFPxH8bKr0funpjU=;
 b=RJJExbykuazvfqZVinvsAOOroJBXGYRorAjEtrF4SPsKHOaW6gtXWFabGenftdIuIa
 ud/Bd2WrxJRDmn59BD2jHy2bFlCCKHHB9+1BEuZ2zvKqc3B206Iw2VSPzNy31ECI7cDv
 Ne6c4TyBIJl33McKVWjQgV1uDD1Fllut9Y4QlX8xeDj4qoiCAtA277B2c4qpU3wJ+wPH
 mdchLaAmKmmkmJF+jCNTiK9o6TxLAYUrrxxd4D4MUj6ar9fWO70TqTQjnTL7xbqXIuQY
 71+LeNBcS7eeJUYYaB160mBsS6Ar7FHrXVNUdNyUJsFLA9anLp+r/L86Zsl6QPo0BYmR
 eInQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RJJExbyk
Subject: [Buildroot] [PATCH 1/1] package/libsrtp: bump to version 2.6.0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cisco/libsrtp/releases/tag/v2.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsrtp/libsrtp.hash | 2 +-
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index f95dc2e7b0..95daf0d792 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a43ef8e9ae2b665292591af62aa1a4ae41e468b6d98d8258f91478735da4e09  libsrtp-2.5.0.tar.gz
+sha256  bf641aa654861be10570bfc137d1441283822418e9757dc71ebb69a6cf84ea6b  libsrtp-2.6.0.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 0ffdd98283..269c1ae3f8 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.5.0
+LIBSRTP_VERSION = 2.6.0
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
