Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC854C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A6624157B;
	Sat, 12 Aug 2023 19:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A6624157B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vRI05pSFXnX; Sat, 12 Aug 2023 19:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D39415BB;
	Sat, 12 Aug 2023 19:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D39415BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 969391BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D28840500
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D28840500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69DQdjMPSeh6 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:29:55 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EC2940003
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC2940003
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M89L1-1qPfNn0Eip-005Ex8; Sat, 12 Aug 2023 21:29:48 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:28:36 +0200
Message-ID: <20230812192842.135682-8-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812192842.135682-1-dalang@gmx.at>
References: <20230812192842.135682-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NJNXeiIXwjuLsVDhzQZFF7ylCT2JgYlBd+5iXiHywtxhAYVL/tr
 /0jM9tEBeUk5Nzm9iaFCgkorHjgh/065YicH/BwXJ98vosfPNsFmv4wXs4+sQrrkveHSA3C
 KMl0EbCbKiYbeymrwu2nQ7heLAYsjUj72ZbVv/HWNXIblHiy8R0NpRUKZ+qnXyXHETw/ijT
 pKrz2LcARsM/Y5Mht2WFw==
UI-OutboundReport: notjunk:1;M01:P0:+fKd5qDCbSQ=;LJkSvGu25K02HDmCwfxs6AdYjnn
 NY3+XpMgFFYCK8vXsUnzSEKHIxoGbS0AW+mlr3icrBXCiwqBB0al43G5hQ9Gw9Wg1qTcyRzhh
 qkXiVoBtMr20CpIzfPV3OU6k0SX1Ap95+IA5DkqzFzbGECTYlbNLJ5b9R5VHCR3rq/eHwYRMM
 vmxYdI+9B3w6sV4nDAnI8Q138RL9IW1U46T3l4tlLoN1B0xqN8O7o8ptkbnmgCk7acZrgddz/
 mAoqEGUBNtTyFlR4PEn0w8b5qByHe4QII2eSIyOgEyPt/OUqiOUZDW3qbFYr3w+gpQoo6Nyi4
 fvqOWuD73Ph+ExlDlaqTITZ6YkRKCdl//zxHrxsw0/6WbWZ2Th/pwKMhX/kS3mA24g9Awdl/w
 QizLg9HVdfeFV97/q5LRGK2zna49jNXivbvh8rBjvEph9VtiFQt7vwWGJrrZr5RH9wsWF0b5C
 5aoXWlyrgya5tVk0X5mWi2druX8jdZVa6tpmbVNEeeFaNHfv1EYUURDPhwXy79LGUJvhdgLqX
 dc5roNlwkoC0KeLypZOb6egjWBuKSWqs2XjBvCzfqueBG4pj5jwkGNahZtt+55L1Xccoi6/gD
 38soB+H40cOkO9WWDxIqs5onlGcJ3y4lbNwMRP5um7+kI4RDuqC5WCGk1bmkhLqDim9H4RRvx
 sHbEcvcRBZ5NucWDgCEbWZyi2odygWNO+S0PScQQN9pJYo+tAKI5l1zo4dclKHVBNi1Cklc8Q
 c6EnT269+NahWzzYKAeIt42cxqV5Bf42Ds9Q6cH6wwON8+k25d5f0Hz7j0OcSly+xfMaUodRm
 P1EDC3FlEHPZDpGTAnPFjHg9n5vRPFaBoWS8aTP2JaNu9T/qx9YQYuta1pUaGYViinOFsKUF2
 wfWqMLWdiOBRWQdc/4vXmEzLc2wuV7RWG9nCEef6xbkQ+OxacvMAocS/5KOVrf3wEqDdf4XCl
 iZgLaSMUUsRfzzFO37jTNaexRG8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691868588; x=1692473388; i=dalang@gmx.at;
 bh=tl3q9ZK3uMU61tMq0c5pl91FD9rq5Z9d6z78INx67lc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=pk1aktuDoWwHIWLGavjtSdin9uKDBqyCUwCVETcnmYvdLmVXrQN7aTHMHOK+6FBFwXCNx2v
 +dNQ7olYwIj+TuuQFpuiHVvHen5v0cnCa9hjmf6KqIC5ZzVckqomi1ezM5HU4BR0w7ag5PDQH
 YuXiNSZdUsiQpiNKKl32ruxkh4oAwdbW8NVN06uMhp2ljdW6Mu3XUWRVoZPyTcYp2oMVjaxqj
 FS8t/7jWmQOsO9NO2MfC8C81O2ApDrDAhHVcvb0X1anicgYagnnH2jmjf0UiPU2meUVMEBFGn
 6INU/T0BYJewquhuqjYPzzB249N956B+WrvLbrzY4pj2H3UMIfhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=pk1aktuD
Subject: [Buildroot] [PATCH v3 8/8] support/scripts/pkg-stats: Only match
 CPE vendor and product
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of checking if the whole CPE string is known in the database,
only check if a string with the same vendor and product exists.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
- patch added
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 196cbb660e..06d3d483bf 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -649,11 +649,12 @@ def check_package_cves(nvd_path, packages):
 
 def check_package_cpes(nvd_path, packages):
     cpe_api = CPE_API(nvd_path)
-    cpes = cpe_api.load_ids()
+    cpe_api.load_ids()
+    cpe_api.generate_partials()
     for p in packages:
         if not p.cpeid:
             continue
-        if p.cpeid in cpes:
+        if cpe_api.find_partial(p.cpeid):
             p.status['cpe'] = ("ok", "verified CPE identifier")
         else:
             p.status['cpe'] = ("error", "CPE version unknown in CPE database")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
