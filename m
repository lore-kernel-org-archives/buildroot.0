Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE7ACA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 12:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BC140B5B;
	Tue,  9 Sep 2025 12:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IAiOYXGdeNe; Tue,  9 Sep 2025 12:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A09040B6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A09040B6C;
	Tue,  9 Sep 2025 12:31:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A55521D9
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B7A740B36
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIXqz3ACWLdx for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 12:31:46 +0000 (UTC)
X-Greylist: delayed 581 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 09 Sep 2025 12:31:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8668740B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8668740B48
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.235;
 helo=lelvem-ot02.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8668740B48
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:31:46 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589CM4tY334765;
 Tue, 9 Sep 2025 07:22:04 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589CM4Xw3701630
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 9 Sep 2025 07:22:04 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 07:22:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 07:22:03 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589CM3sM2318693;
 Tue, 9 Sep 2025 07:22:03 -0500
Date: Tue, 9 Sep 2025 07:21:56 -0500
Message-ID: <20250909-ti-k3-boot-firmware-src-v1-0-542b606ef0c7@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOQbwGgC/x3M3QpAQBBA4VfRXJtaf4VXkYuxZpnEalYoeXeby
 +/inAcCq3CANnlA+ZQgfovI0gTsTNvEKGM05CavTGMaPASXAgfvD3Si60XKGNRibTNHZUXGjQS
 x3pWd3P+569/3A/ibKsJpAAAA
X-Change-ID: 20250909-ti-k3-boot-firmware-src-8c1fa45a0fda
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=bb@ti.com;
 h=from:subject:message-id; bh=UrkiRbXPpRsSBDbqOylhnw2ifw0sj+Va1Og7rhzF68Q=;
 b=owNCWmg5MUFZJlNZ+QmyYQAAb////v5t7+33+n/19+9sP+9/2rf+0++eqFaN/a9/qvP/6newA
 RsYHagAA2o000A0NGgBoAMJoGgAAGgNAA0aAAANAaDTJoGgZqaaNG1HqMyaah0ADQAGmQA0A0Mh
 oeoaaNDQAA9NTQDRoaHqAbSBtT1A0zU00GgB6QaDTQyNBoAhkZBpkGTTI00ZANGAQxGQaaNNA00
 0AYBBkANDIwTQAAANGEAAAAGmgIF3hKoIGgr0HAfWoGbh05ajk4SBssyxrYZkKDv2H0vdLnAJWa
 aRX/K7uAShfeLJlK1dCK7PgJLE5a5HmFfYGVn1B1fz67UZlxIqXQh1Vv71uoQbP4o6kDlZgpxAj
 YAyVqDVl8fKSHPFIzBp4n5YihiaXeMQOEeYyrJaH6Jp2MJcJc/gKjIBMSWKZZNdWazBhpoiMS6O
 +BlBRFN8s7KA0F4VaCxQRBz+XuqXCWSk1LigHuNpjdpaIB2s1MZM+u8o7BDTI+jJ3ZY6X3yvaN0
 rs/lKEewKcOo9F0CdDBPfP0lMLIPOyENMMqAFkmg1troEGMtH/aBgEEnJBbNScXsVeX8RKWMRhl
 GLyy6hTQs4tYTtyfELgK9t/EUgNqEcU5Cc5VYOAIMIiZM2ZCQlRE1CRemFPYI7RqfU7vcYAayxZ
 URFIv8XckU4UJD5CbJh
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1757420524;
 bh=fs5O+wHrisw1/b2wib/nuKeMb/fEt4jJ1UIGqPcNdpE=;
 h=From:Subject:Date:To:CC;
 b=gBP2kYqc8yorNecPuHRPxbVCPhYR2STk5zC8tjr/CW0GZlpHr5lJFt9ncDu/R7Xb/
 aS0xa8lbGqrRKDCGfuyDj74wNJD3E6RuPYdh80rVxTITUKq9i9oCxfMtctxOetV/id
 5CLd8bEld6xAAMeB7+1cADEzUcV3RMZdq0UPtx0E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=gBP2kYqc
Subject: [Buildroot] [PATCH 0/2] boot/ti-k3-boot-firmware: source change and
 a version bump
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Everyone!

When looking into bumping the version of ti-linux-firmware, I noticed 
git.ti.com is no longer providing archive downloads of any of the 
projects hosted there. 

So, while we work internally to understand if we can get this feature 
back, move ti-k3-boot-firmware to download from TI's Github mirror 
before bumping the version to 11.01.12 to pull in newer versions of TI's 
DM and TIFS firmware

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      boot/ti-k3-boot-firmware: switch to github mirror
      boot/ti-k3-boot-firmware: bump to 11.01.12

 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 0af159ae2b0363a90b8c5432cd4cb9bfd3476c5a
change-id: 20250909-ti-k3-boot-firmware-src-8c1fa45a0fda

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
