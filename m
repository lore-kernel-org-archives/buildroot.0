Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFAEEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E54A402D4;
	Sun, 18 Jun 2023 11:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E54A402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PF5QaaHwZkxZ; Sun, 18 Jun 2023 11:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8044840193;
	Sun, 18 Jun 2023 11:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8044840193
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B60611BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D7EE81EC5
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D7EE81EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3YH1MkT3hez for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:14:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9058817A8
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9058817A8
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:14:56 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 327995FD03;
 Sun, 18 Jun 2023 14:14:54 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Sun, 18 Jun 2023 14:14:52 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Sun, 18 Jun 2023 14:14:33 +0300
Message-ID: <20230618111434.62274-1-SIBobrenok@sberdevices.ru>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/18 08:42:00 #21509530
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687086894;
 bh=0PttwntdEJgy+dES0vGvFDzMal02RwjdDBXRBMabUVs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=TT37mM5YeClBQ1yl5c4ru122+hOwG3K8av3LAZ+VdxITHOEsBTNv7ov8d/Jz1Ksr9
 Oid4sBU4eYy5ErYGuZVdGgEkRoSN2mX4DCgy8WnbJO23D2UZ32kHDUABYxchBFdkg/
 YVHWDTNaQ3p8wTXCrd3nRvdeHhom9GBEP/3XqTiQiq8QU8tKJFTuCcm3jsyttFm2Pm
 EkWdRr1psK0zYFffci5oQIv1EUS4y9FI1YuefpG1D5dYV9o2H8lhEcJzVjppU9XtTL
 ZhxhbJqnFhPLuMzMr2yQUObOF8s7et4Rbtj5ujT275PqBsxMPRpfwrppc+1wdi83vQ
 +aRACEbGv/Olw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=TT37mM5Y
Subject: [Buildroot] [PATCH 1/2] package/python-iniparse: add host variant
 dependency from python-six
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
From: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, sdfw_system_team@sberdevices.ru,
 Sergey Bobrenok <SIBobrenok@sberdevices.ru>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
---
 package/python-iniparse/python-iniparse.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index e76987d1e9..39b0de4eec 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -10,6 +10,7 @@ PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
+HOST_PYTHON_INIPARSE_DEPENDENCIES = host-python-six
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.24.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
