Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD59EC52D73
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 17:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C2B640571;
	Wed,  7 Aug 2024 17:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVg8k5CHbYsu; Wed,  7 Aug 2024 17:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102144065B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102144065B;
	Wed,  7 Aug 2024 17:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5815F1BF30E
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 463EA404D3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6o3p5RMf1ez for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 17:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EE4240322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE4240322
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE4240322
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 17:48:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477HmRE4072071;
 Wed, 7 Aug 2024 12:48:27 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477HmRXi030253
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Aug 2024 12:48:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 12:48:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 12:48:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477HmRQW068639;
 Wed, 7 Aug 2024 12:48:27 -0500
Date: Wed, 7 Aug 2024 12:48:18 -0500
Message-ID: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGKzs2YC/13MQQ6CMBCF4auQWTumjFiJK+5hWJR2KrOQkrYSD
 eHuVty5/F/yvhUSR+EE12qFyIskCVMJOlRgRzPdGcWVBlLUKE0nzN5gihafszOZsXXcWOfPltl
 BOc2Rvbx28NaXHiXlEN+7v9Tf9UddiP6ppUaFrNthMJp83eguy9GGB/Tbtn0A0Ruxo6kAAAA=
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149; i=bb@ti.com;
 h=from:subject:message-id; bh=OY3CnkH61rGBMIsZjrGeM2qv7Iix6sjexTAv+UjXwRE=;
 b=owNCWmg5MUFZJlNZa0iHwwAAZf////5rfuPuvX395r7/n/8rDO375n+e636f9847897a31WwA
 RssDtQAGQAADQ0BoaAANqGgGgAA9QBoAA0GmgAHqaD1GhpoaGJoeo0PRpgogAaBppkAAZGI0NGg
 0AGjJ6gZAYgNGmI0NBkZDEDTQNGm0hoGmCehAYRoAOQ2obUGIyMRpoGIAMjQaDQANMIaaaAAaGg
 0wgZBpiGhoMgMI0GgNMmTQ0AYMehjQGPBCAUoqZkQNmljzYMXFRISbLdYXOHscXxCibRJMNmRSd
 OJBGtTCzRy89fEkiO1PGx6eZFFA4s3knMA7/T9sA0ZdTe5fcoegb6f3SKih+S2CqbZYmmAvhJvS
 nAvdpuS0atgpBDtNkZlLENaMQF29/QD3dbl4AFxSO+bJ1uuf22AAIfQMzAKM6Eb74BGfg7u9jYX
 7dou556C3QpFLdXnOOPh0y3cisLDGfCn1BOJA0EPxc3T/d6oda+qwQom+qxdd0Pn1oVp6pEnp++
 ZC/YPTqonPQKPdFCAVIuUuIEFvToJpHgmhFa7DZuOgwDekqYZGoYsCZZpTiv/JoryW8Zk5finaO
 /KU2bbFj5/Rh4cANMQxATsk7qhB4RkIXlknAHkRYOV1FSMfRhmMzm5KF1CJSQZQkl3AOd7NHcDE
 LKM+kBn+LuSKcKEg1pEPhg=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723052907;
 bh=us9tio3sttIHUh211Pc+Urf7y4hNEOoGilpR6rT0Ar0=;
 h=From:Subject:Date:To:CC;
 b=RMwIsFaRxKzyPhO+2EFldacdU2I6dcTyu3qTp2eZR8KTVppT1HcAtr3cGqXobzUkc
 xl/cX7sisW7hmpWF/JhLUVuLbjbCNK6KkxxLFLg5PgNRo2oElF84jTLnUXmxpRBV7X
 d/e63EiYJUMYdJXTS0BroyMfAvPLTkBBGT8ufOuQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=RMwIsFaR
Subject: [Buildroot] [PATCH v2 0/4] boot/arm-trusted-firmware: version bump
 and source update
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
Cc: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello again everyone,

When trying to bump the versions for arm-trusted-firmware I noticed 
we're using the old mirror which hasn't received any new tags in a 
while. So this changes ARM_TRUSTED_FIRMWARE_SITE to point to the 
trustedfirmware.org source and updates all the hashes I could see

Happy reviewing
~Bryan

[0] https://github.com/TrustedFirmware-A

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v2:
- added the lts-v2.10.x branch to the selection logic
- moved to using the git.trustedfirmware.org source to avoid the github 
  tarball weirdness. This should prevent this from happening again
- Link to v1: https://lore.kernel.org/r/20240722-tfa-src-update-v1-0-e68bba62f146@ti.com

---
Bryan Brattlof (4):
      boot/arm-trusted-firmware: move to official source for tf-a
      boot/arm-trusted-firmware: bump to v2.11
      boot/arm-trusted-firmware: bump lts-v2.8 to v22.8.20
      boot/arm-trusted-firmware: add lts-v2.10.x selection

 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash    |  2 +-
 boot/arm-trusted-firmware/Config.in                           | 11 ++++++++---
 boot/arm-trusted-firmware/arm-trusted-firmware.hash           |  5 +++--
 boot/arm-trusted-firmware/arm-trusted-firmware.mk             |  3 ++-
 13 files changed, 23 insertions(+), 16 deletions(-)
---
base-commit: e321e81cf921346ec2d4cd1a9439016c7b2d3fb5
change-id: 20240623-tfa-src-update-8de4cdf5ceed

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
