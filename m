Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91427C3DA70
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 01:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA4A606EE;
	Tue, 23 Jul 2024 01:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuNRLn0n9XxE; Tue, 23 Jul 2024 01:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 094CE606F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 094CE606F5;
	Tue, 23 Jul 2024 01:32:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8564E1BF2F4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72DB6401DD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmMeKxW7Pg3G for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 763AF400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 763AF400B9
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 763AF400B9
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDSQ097067;
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46N1WDBs003434
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 20:32:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 20:32:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDVL127505;
 Mon, 22 Jul 2024 20:32:13 -0500
Date: Mon, 22 Jul 2024 20:32:05 -0500
Message-ID: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABUIn2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyMj3fyCktRU3aTS3AJdwyRDc2MTc7NEkzRDJaCGgqLUtMwKsGHRsbW
 1ANKC1UNcAAAA
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721698333;
 bh=U3fbb7Ncd/WfgxOI41b9AXfHz7Z9k9y0fn0cNJ18FjY=;
 h=From:Subject:Date:To:CC;
 b=spW/BUIzu9oUchvit4WEhB/IAGveDGQtzV4O5vd55k1ErIfcsxY07k9/um0aDjJiS
 +3StnAa2v3svPc/nP1YbjStlGLmSqrMlqdJxu01Y47mVciEEtKmdfNjXz/8z9Fdxij
 3tcOgn7Mghlmh9kPhXZgm8qTG34yfm/M9h2hkpC0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=spW/BUIz
Subject: [Buildroot] [PATCH 0/4] bump optee to 4.3.0
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

This small series bumps all optee packages to 4.3.0 and updates their 
default hashes.

Happy reviewing
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (4):
      boot/optee-os: bump to 4.3.0
      package/optee-client: bump to 4.3.0
      package/optee-examples: bump to 4.3.0
      package/optee-test: bump to 4.3.0

 boot/optee-os/Config.in                    | 4 ++--
 boot/optee-os/optee-os.hash                | 4 ++--
 package/optee-client/optee-client.hash     | 4 ++--
 package/optee-client/optee-client.mk       | 2 +-
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 package/optee-test/optee-test.hash         | 4 ++--
 package/optee-test/optee-test.mk           | 2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 4e4554eeb76e8b516c6cbcd66f15868492aac594
change-id: 20240722-optee-bump-1b173476a4f1

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
