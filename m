Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB7D24460
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 23:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16B580551;
	Thu, 10 Oct 2024 23:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJNBByx6Kyv3; Thu, 10 Oct 2024 23:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052E48056B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052E48056B;
	Thu, 10 Oct 2024 23:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEB431BF5B5
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D591401F3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjKr-sECbIEH for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 23:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A21DC400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A21DC400C5
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A21DC400C5
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 23:39:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdT41117734;
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49ANdTDu019319
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 18:39:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 18:39:29 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdT53070674;
 Thu, 10 Oct 2024 18:39:29 -0500
Date: Thu, 10 Oct 2024 18:39:21 -0500
Message-ID: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKllCGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwNz3dKk/PwS3aTS3ALdZNMkSwsDA4NEo1QLJaCGgqLUtMwKsGHRsbW
 1AF881/JcAAAA
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=bb@ti.com;
 h=from:subject:message-id; bh=SSrcPQBf4sCfKFrxekAO0oQXDzSsTTUxlUK1PpybfIg=;
 b=owNCWmg5MUFZJlNZjijzywAAan/////9H6u7z7+evLX3k/k+31W7e3z2Pdb73rrI599J+t6wA
 RmsRigABoaAGgAAANAyHqDT1PUAAGnqANAAMhpoGmh6gD1AaMjammmR6no0nplEAGgDIGTIDIDI
 000MCaAPUyBoMIyMmRgmJphMBGj1ADCNGIaABoADQZQaZD1MTRppobUeoeoDQA0HqGgeoA0BoyB
 oD1DQNA0yB6Q0AyaGgDQyB6RkaDaQsWIBsQS47UMucM60KYl1D+Ytwjbny+n4BObdhHzoC6V8QL
 Z7rsnQ4CrNQpbygTbruVKAl6TCjzQrg0kQQAwoeovQo0/eO1K3qFkkxWcEsVHiGTT2hkTjhZgpD
 bDAWgzudEkNTu5oiu8rO3fdvEQDZhQO1Gm3n3hJYDD5Fy0CbrYoBv+XXe5JjbaXTGbkKni08fIR
 AbH4UtSiXfFsrl4O60NO5DjnvPlqBG24jJOzAbomLc+DW0HEJD8qpewZcbhCwVkKh5o0JOjI2bN
 mxakiKCrlahFnLIIMADGZALi+FSZ+qkhZjvGf1uOI2MlGeEU+Ct09ijaHgkuwLROXw3SXUe4mxj
 3YTj+LaJNWA64LEYpAoU8iDJkhl4LR2LWHJu/r5SIM+amPhnH6f3XVfpSQStKaatB1DkJQkTaYZ
 x4s/xdyRThQkI4o88s=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728603569;
 bh=+wwTy2+tHVRzxLrbCdGELc48oLJdfID21C14QSC+5y0=;
 h=From:Subject:Date:To:CC;
 b=aNw41CvAbIPsZ95L9ZQ5sfAE/SCpSp1gZigd31VlghVMUQKwa44JT+X3YTlxBXFOX
 xxqOjS6RntD2O/UvEjKVWf3BX3MElRmhxwEZE+UkShb/j9SJuZYpmcgobdTQaSNrjC
 OHiijZw9HGG8KYmLMkqaINA1hGf4Nt3gsoR36Xx0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=aNw41CvA
Subject: [Buildroot] [PATCH 0/3] bump ti-k3-r5-loader version
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone!

Now that the v2024.10 tag has been released for U-boot, update the 
default versions of ti-k3-r5-loader to match.

The only interesting thing is efi capsule tools seems to be more 
mandatory now, so I added an option to enable host-gnutls if needed to 
ti-k3-r5-loader

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (3):
      boot/uboot: update link to the U-Boot docs
      boot/ti-k3-r5-loader: add option to include GnuTLS
      boot/ti-k3-r5-loader: bump to v2024.10

 boot/ti-k3-r5-loader/Config.in            | 11 +++++++++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   |  4 ++++
 boot/uboot/Config.in                      |  2 +-
 4 files changed, 15 insertions(+), 4 deletions(-)
---
base-commit: 83be59ae50cbbabc700d875efc803184250d2631
change-id: 20241007-uboot-bump-c5b98000a2e8

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
