Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE483C25B74
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 06:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72339813F5;
	Thu,  9 May 2024 06:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lx3maRwTVdth; Thu,  9 May 2024 06:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82FA981DA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FA981DA0;
	Thu,  9 May 2024 06:32:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 118971BF84C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F253E60D91
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeC8cBgivAqt for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 06:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=8524e0df5=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 109EF60D5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 109EF60D5D
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 109EF60D5D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 06:32:35 +0000 (UTC)
X-CSE-ConnectionGUID: PbUr6rRBRNCFX05CXiAZ0w==
X-CSE-MsgGUID: v4ehwpzGR1WixEFYQ7duNg==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="191600364"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 May 2024 23:32:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 23:32:03 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 23:32:02 -0700
Date: Thu, 9 May 2024 11:58:55 +0530
Message-ID: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACdtPGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3fyCktRU3aTS3IJiXXOzpERjIxNL8zSzVCWgjoKi1LTMCrBp0bG
 1tQAab/UxXQAAAA==
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1715236355; x=1746772355;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=ohSpt+DW93FVEqvB6/PkJQUN6m1B0kzZfJ5DHoxpbrU=;
 b=BjfS2N0Sj2Sx9LtVTbx/GYr6IZOdlbo75OXzDLF/XAKd8ZOA03VT80yH
 43gNZ7URGYcVt7q5L3TZXNV4HRnuYBRe3F0idjALKDD1P4Kmgw3AQyt17
 JH59Xi7eVLqAiZje42enHaO0jYpewB8+JTG9kokzaBEKj9XgY/+nY/che
 iu6yR9HzboQK1JSseF9Es6pYIrCQ6seLqMJN6OE8EWUfovaH3TVmhDqWE
 6HQ9tV8qFsHQQxAIpN/1HRnsPN/Xb5vnD3P6t0jHfHiCfACtBGmeuBugd
 +DP/M6lkpGmNP5sUH94OWOyTn35i0IH7suen9/TIZ+QY44Su8MjUgiO+J
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=BjfS2N0S
Subject: [Buildroot] [PATCH 0/3] Bump optee-{client, test,
 examples} packages to 4.2.0
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
Nayab Sayed (3):
      package/optee-examples: bump to version 4.2.0
      package/optee-test: bump to version 4.2.0
      package/optee-client: bump to version 4.2.0

 ...tee-supplicant-fix-build-with-kernel-4.16.patch | 56 ----------------------
 package/optee-client/optee-client.hash             |  4 +-
 package/optee-client/optee-client.mk               |  2 +-
 package/optee-examples/optee-examples.hash         |  4 +-
 package/optee-examples/optee-examples.mk           |  2 +-
 package/optee-test/optee-test.hash                 |  4 +-
 package/optee-test/optee-test.mk                   |  2 +-
 7 files changed, 9 insertions(+), 65 deletions(-)
---
base-commit: 121c5f7b422bf393f51e0e873e7ceaef55b0d3d3
change-id: 20240509-optee-bumps-76ba32497f6e

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
