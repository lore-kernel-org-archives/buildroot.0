Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575C3C4828D
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 22:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3DA14ED24;
	Thu,  1 Feb 2024 22:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3DA14ED24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPNwcCMBGVvR; Thu,  1 Feb 2024 22:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E20B4ED08;
	Thu,  1 Feb 2024 21:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E20B4ED08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A0951BF228
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 21:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 402506FC7D
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 21:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 402506FC7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5iwf-ZqgZHWw for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 21:59:57 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F3B960A66
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 21:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3B960A66
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5dbf050821fso762307a12.2
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 13:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706824796; x=1707429596;
 h=content-transfer-encoding:mime-version:user-agent:organization:date
 :cc:to:reply-to:subject:message-id:from:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OXHbxUKOv01LU85fIG0/bzaZX/wfHuAbM5PO9hXzEzI=;
 b=sSw5vqh6azxHigd0lxN4X2tkfNlKOh6XatqBKCbZcGdNZjuYaKG4R2HTL0mIpp44fv
 Rn0l42w8BMQpehNiuZ57n2ncBCAlJbn/wQ81ho92/2mkh7P1Vvvzn+QzV9wAN9wwxwYw
 JHYVMg/fh55kWsZa2ou0h15B+HgN2h/iTH13C6mSffJy8tZsESvBUXQvu2UgJP17aWdR
 k/+/u4zc+P2qloi9pfoDVv4viUki4BuKx7lZPaIWs84fnGSf1mqGU9SFJ5ggxQIH6vbT
 Bsq/nIRQ31iywgQ8CCr+hlsFlfj/nUzEdgDUrbjcv6NKcvRXk6eKo0Ke7C1iNSl8As1c
 AFog==
X-Gm-Message-State: AOJu0Yx4Nx9i9PJKQczyezTMO4CD2gYGvPDSCDNsqxOLEyA0MPFf30mW
 0Ssz7XS/52banSBO3YGhqwb6Q8+HxGbw58KtCfrDECeLQLHeAjKzVr4VSnAwqGh/n7nWXjo4Nhw
 zpZU=
X-Google-Smtp-Source: AGHT+IH91JvT0+D62D/xT8TFTBUzDkJvcLKqwczPv08pGqnVO+sCfgTuq6FqA3zEq+AXOA1qeIEdtg==
X-Received: by 2002:a05:6a20:6e15:b0:199:8510:de02 with SMTP id
 go21-20020a056a206e1500b001998510de02mr152550pzb.27.1706824796372; 
 Thu, 01 Feb 2024 13:59:56 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUwBeYDpeRWoxPEi8l5of2UtdvIEXQLE6KJNEfEPu5yskPtr1ihFTR0N0nZWgnwUXbj12BAxlmQzTkXcsRUR20SDcaH
Received: from [10.10.10.151] (97-120-67-139.ptld.qwest.net. [97.120.67.139])
 by smtp.gmail.com with ESMTPSA id
 ki16-20020a170903069000b001d965e737f2sm279427plb.268.2024.02.01.13.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 13:59:55 -0800 (PST)
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <399bbbdbc865bb5fab6fa7dbdad653f9aa240da2.camel@embeddedTS.com>
To: buildroot@buildroot.org
Date: Thu, 01 Feb 2024 13:59:54 -0800
Organization: embeddedTS
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1706824796; x=1707429596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:user-agent:organization:date
 :cc:to:reply-to:subject:message-id:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXHbxUKOv01LU85fIG0/bzaZX/wfHuAbM5PO9hXzEzI=;
 b=lgDdRUkxo9vRhyMJCyEB4CdN1iCEgbfPgZtl44dEaH9D+lQbIKWPj5eISUt0eEvW+Z
 SENjyA0fL48+SGkHKRBwk3KEsISwV9NxHCS+9q8oBsqTmyRz5zgowlZ3pdqfyVULqVNY
 ieu3zWgPRPgER/qCJxKmYvY9IA1rQnMZgTqJ0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=lgDdRUkx
Subject: [Buildroot] [PATCH 1/1] package/wilc_firmware: bump to 16.1.2
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From 55e8d294997af933bb3d832b73229bebefa45044 Mon Sep 17 00:00:00 2001
From: Kris Bahnsen <kris@embeddedTS.com>
Date: Thu, 1 Feb 2024 20:46:39 +0000
Subject: [PATCH 1/1] package/wilc_firmware: bump to 16.1.2

Release changelog:
- Use default values for IQ calibration correction when the eFuse
register has zero values.
- Fix for "WILC1000 Firmware initialization issue" by updating
the PMU clock switching sequence during firmware initialization.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/wilc-firmware/wilc-firmware.hash | 2 +-
 package/wilc-firmware/wilc-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
index 802cb4f9b1..8a7957a1d2 100644
--- a/package/wilc-firmware/wilc-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a06a6a46e03ca00d35da220f7a9f353cc650e5e5657a7988ea732913ad26d9a0  wilc-firmware-wilc_linux_16_1.tar.gz
+sha256  6cd5fc52150520bedb736f58124063041b4d9849ea33481a8b075f51aec64f8e  wilc-firmware-wilc_linux_16_1_2.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
index 12c825cf92..3381162bbd 100644
--- a/package/wilc-firmware/wilc-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_FIRMWARE_VERSION = wilc_linux_16_1
+WILC_FIRMWARE_VERSION = wilc_linux_16_1_2
 WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
 WILC_FIRMWARE_LICENSE = PROPRIETARY
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
