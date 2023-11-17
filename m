Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB91C197A0
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 09:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2D5D61181;
	Fri, 17 Nov 2023 09:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2D5D61181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6AiBaH9jwxm; Fri, 17 Nov 2023 09:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25AE861147;
	Fri, 17 Nov 2023 09:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25AE861147
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BA901BF3A0
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444A342C94
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 444A342C94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJbxfXRlPl4d for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 09:44:40 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 611CA42C5E
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 09:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 611CA42C5E
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 143BF120096;
 Fri, 17 Nov 2023 12:44:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 143BF120096
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 17 Nov 2023 12:44:37 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 12:44:37 +0300
To: <buildroot@buildroot.org>
Date: Fri, 17 Nov 2023 12:44:27 +0300
Message-ID: <20231117094429.30820-1-svromanov@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825233328.35c4a920@windsurf>
References: <20230825233328.35c4a920@windsurf>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181430 [Nov 17 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: svromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4,
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 salutedevices.com:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/17 08:13:00 #22469735
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1700214278;
 bh=S4RdT0nPnEfAaBWOz0AhR3aujcIcIDipFDpRr56S3dU=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=ekjH6zV6ZFTdSVILpyB6XMPUDa7SUej5UHrm4wjHnn/3SbuyiY4FzOslyuyucTyaj
 aUIjKHIk+vZj1rxOHNXpXGBmr01BfFs712EOa0hKItDGQ+kKRek1EBv5b5MoArFTTG
 o2genknpzoh9vuIkQnX3nry60MA7uJ+TYyOEN9pcsxeQBhdr2a/X2eKU5n109h8riY
 xAySCu1Xv39inEDdI9njii8xio2rNRaeG179o7toMoh6P086WVlcEHYpzADYSATUYQ
 196X5iIGVOqN80w3gV1C57LQPIJC2SePvPj4/DskJ5jNLvSa88Wzgl9BM5iO5JKXiy
 7P+PA1FxLhT6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=ekjH6zV6
Subject: [Buildroot] [RFC PATCH v2 0/2] Added package: 'sysbench' and its
 dependency: 'ck'.
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
From: Sergey Romanov via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Romanov <svromanov@salutedevices.com>
Cc: chip-club@ya.ru, akopytov@gmail.com, kernel@salutedevices.com,
 svromanov@salutedevices.com, sbahra@repnop.org,
 sdfw_system_team@salutedevices.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Sergey Romanov (2):
  package/ck: new package
  package/sysbench: new package

 DEVELOPERS                     |  4 ++
 package/Config.in              |  2 +
 package/ck/Config.in           | 19 +++++++++
 package/ck/ck.hash             |  3 ++
 package/ck/ck.mk               | 71 ++++++++++++++++++++++++++++++++++
 package/sysbench/Config.in     | 29 ++++++++++++++
 package/sysbench/sysbench.hash |  3 ++
 package/sysbench/sysbench.mk   | 31 +++++++++++++++
 8 files changed, 162 insertions(+)
 create mode 100644 package/ck/Config.in
 create mode 100644 package/ck/ck.hash
 create mode 100644 package/ck/ck.mk
 create mode 100644 package/sysbench/Config.in
 create mode 100644 package/sysbench/sysbench.hash
 create mode 100644 package/sysbench/sysbench.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
