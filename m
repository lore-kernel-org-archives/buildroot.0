Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74237C25B7A
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 10:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B1A60590;
	Wed, 22 May 2024 10:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cANChi316rFQ; Wed, 22 May 2024 10:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE0106079A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE0106079A;
	Wed, 22 May 2024 10:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDE21C5A37
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 10:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99A5840102
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 10:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqIYR1ucbaBK for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 10:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76FD7400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76FD7400D0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76FD7400D0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 10:51:04 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ed0abbf706so43497245ad.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 03:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375063; x=1716979863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jp+DH3qOMosPNDUahfTp9NgmdFigBxtj8sx+hp1+wis=;
 b=AGHIIMigjMMo4Ti4wCYLBb9zyoPoxESmxBKcwMuGBoq351LNWgEpgPks2tHyJ/ys0Y
 QQpE5jTHoAK2/HdHFTwJmsIteZiaI099/1+tKZjhcX+CRysJHxyfRdnVm3LrcD+fCkA8
 nCQMzGwkkaxy3jQMsHiDl+XFxowLgYEIzUvACz4ZvHSqthL/L+Q9O8Pbdk+xv0ZVGEZM
 Arux6kvVKJUuo57rYv9BBmy56FvTm/B7JBBlF/YNfK1FhDoS7WlvkauKPKBSgZo58mTY
 4ymCYrCN7aK9qzzOp2TZLV46uo6mJZoqqUvcVoNrTtQtHxW7Met2Idguey2B/kXFnCqS
 +XLQ==
X-Gm-Message-State: AOJu0Yz8+Xez0LVtMwDMCpgKMrUbW3kxR+ltoRXLFIfF0XIk05oqPpJK
 rYNQqk4c9uaFp3F3UbE2ZOsEnEuZ9sCX+BiVD/cDUQfxBDDoAx7Txm04qBISQbkgPpNS2YdEQHO
 N
X-Google-Smtp-Source: AGHT+IEO7+7cXFKBpytf3wog7oaA0QRFQtTzbpNZS7sZjAr9dHAjAVlal9UaPWEf4DTyfoeJ+Q/3uQ==
X-Received: by 2002:a17:902:cf04:b0:1f3:2fa7:6d7b with SMTP id
 d9443c01a7336-1f32fa76e61mr2522535ad.19.1716375063516; 
 Wed, 22 May 2024 03:51:03 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f30664fe46sm45267325ad.225.2024.05.22.03.51.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 May 2024 03:51:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 03:51:00 -0700
Message-ID: <20240522105100.86613-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1716375063; x=1716979863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jp+DH3qOMosPNDUahfTp9NgmdFigBxtj8sx+hp1+wis=;
 b=ugecYO5I0RBfCgcLEMhviSpK2fpvINDlek0oI3Q/dr496/0kiRpP5AvS/Iw2BzUKrp
 LmchNwx/ui1WqH/jRtdawc+CMrBKIURVKPpQ8JvgTll9cDd2Xign5nLurhpHu/8kmNJe
 6dIOgVHw30dVkeIaHoHEXoyzqzWDPH6G1hRSXVaW5u+CKYN0adE5pe78krthgJoh8kth
 7ExVXJCjl/6hGBKHHSNTbHbZhZvLHW9q51u5m8uxADzclJbfyPv5SDVbGyC7PekESfIS
 IWaE323aoI1577YuE9VJnEbl76GvHU/yaPeQf+XRrO45dmfHKjMxMuYN+cWQXfOuuKCM
 s1JA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ugecYO5I
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: bump to
 version 2024-05-22 on branch v5.6.4.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version adds support up to Linux version 6.9.1.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index 6283cb0f87..ea5ca3c56b 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  752d9ae67140966eddc463238fde1f6b86457db22a45f61c13886c3244eaffe1  rtl8812au-aircrack-ng-f23979f0d20aafb563ac71b56fcbc74268c798c2.tar.gz
+sha256  d08bad19680047cb178d8984bfdd09d9ff7765b8c9ee35a9f8f87676f0c41a64  rtl8812au-aircrack-ng-b44d288f423ede0fc7cdbf92d07a7772cd727de4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index d5571b9d5c..3a7c56a3fc 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = f23979f0d20aafb563ac71b56fcbc74268c798c2
+RTL8812AU_AIRCRACK_NG_VERSION = b44d288f423ede0fc7cdbf92d07a7772cd727de4
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
