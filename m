Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD0C48BF6
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 13:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCDE8148D;
	Mon, 26 Feb 2024 13:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2l2Owi6KSZ6; Mon, 26 Feb 2024 13:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B294481EA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B294481EA2;
	Mon, 26 Feb 2024 13:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C898E1BF31C
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 13:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22D240602
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 13:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kldXoxcaMqit for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 13:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.104.67.6;
 helo=mail.eaton.com; envelope-from=laurentbadel@eaton.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2E3B40131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2E3B40131
Received: from mail.eaton.com (mail.eaton.com [192.104.67.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2E3B40131
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 13:17:42 +0000 (UTC)
Received: from mail.eaton.com (simtcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89D199622A;
 Mon, 26 Feb 2024 08:17:40 -0500 (EST)
Received: from mail.eaton.com (simtcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 727EF9621A;
 Mon, 26 Feb 2024 08:17:40 -0500 (EST)
Received: from USLTCSPGWY04.napa.ad.etn.com (USLTCSPGWY04.napa.ad.etn.com
 [151.110.126.225]) by mail.eaton.com (Postfix) with ESMTPS;
 Mon, 26 Feb 2024 08:17:40 -0500 (EST)
Received: from USLTCSPGWY03.napa.ad.etn.com (151.110.126.211) by
 USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 26 Feb 2024 08:17:40 -0500
Received: from localhost (151.110.234.152) by USLTCSPGWY03.napa.ad.etn.com
 (151.110.126.205) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 26 Feb 2024 08:17:39 -0500
To: <buildroot@buildroot.org>
Date: Mon, 26 Feb 2024 09:19:04 +0000
Message-ID: <20240226091904.14928-1-laurentbadel@eaton.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-on-prem-Exchange: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eaton.com; 
 s=eaton-s2020-01; t=1708953461;
 bh=tf5txdVp9zHiFUZ2NUKLy3bgOQFTGjvMvl436TYkOow=; h=From:To:Date;
 b=EqkcHIk1qkl0c+UASpgVOCT39xUIGXM9eA4BsC6lXeXVpuT4smOUUdJcppnnrMUKl
 ma4MFPI/3BBbaVX6AL8NlZa5pBE/q3XtFPwqUIM3g37sLmTNGAs3FpKpIB76OoVjNq
 sMNgFzk3VIM9OIU2pb4cR2fub4XqiRANkAhV91ZDfz6CYlGzRJG3Zb3odIxliMOVvr
 baTAG19AYnW4c7eUOPd7wZfVP7JYMjpWksfzMQBxa5VWQxWHqZVWlBcXjGqWtweNEn
 FkjYtnDxCarCyS32CBcPSJqB0ktUW8ukdiq2r3JhnkJWY2gzcv2qFaxn13WoRyFJuD
 f8kI1Es0F6JQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=eaton.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=eaton.com header.i=@eaton.com header.a=rsa-sha256
 header.s=eaton-s2020-01 header.b=EqkcHIk1
Subject: [Buildroot] [PATCH 1/1] package/micropython: update PCRE dependency
 to PCRE2
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
From: Laurent Badel via buildroot <buildroot@buildroot.org>
Reply-To: Laurent Badel <laurentbadel@eaton.com>
Cc: Laurent Badel <laurentbadel@eaton.com>,
 Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

micropython-lib/unix-ffi/re/re.py uses libpcre2-8 since commit d8e163b.
Thus, update micropython package to select the PCRE2 package instead of PCRE.

Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
---
 package/micropython/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 26a00baa..849a5452 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_MICROPYTHON
 
 config BR2_PACKAGE_MICROPYTHON_LIB
 	bool "micropython-lib"
-	select BR2_PACKAGE_PCRE # runtime
+	select BR2_PACKAGE_PCRE2 # runtime
 	help
 	  Core Python libraries ported to MicroPython.
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
