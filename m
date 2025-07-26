Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466E8C87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 23:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF7A14133D;
	Sat, 26 Jul 2025 23:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjZxfAHKZCqw; Sat, 26 Jul 2025 23:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A1F41296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A1F41296;
	Sat, 26 Jul 2025 23:21:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AA8CDA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 23:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 708E683F56
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 23:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hRJWWkKasCD for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 23:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C71F283F53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C71F283F53
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C71F283F53
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 23:21:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id foCxuxf0l0WuxfoCyuYPDT; Sun, 27 Jul 2025 01:21:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Louis Aussedat <aussedat.louis@gmail.com>
Date: Sun, 27 Jul 2025 01:21:39 +0200
Message-Id: <20250726232139.3052172-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOSeIvCNh7wfCNvzJW5me6AYbBV+zZfS17eHjj8iNDaryc4//EcRj2oMl74m4XAt+/MA74qmIp+fZZ/itz/8rEbwHGAh0C3c56T7gn7Qt0V0mU96yaqP
 xMxVtqgbHzE6u8r3/rQfuA8khD0+4iavT4fXUW2gSYBAuL4St/MWvxV5J9dZGyT01+eVnJfuuMLiI2GpDV+Ye3kw/Yov3W2feRPGfzOrQD+KctiRNFDROc1Y
 xOoyyBbovPv6UV+VMj7TF+8eHOW83SKxBgbJ6bH5obkcJ6uA8cVt3u1yZTLBtadh44HP1QkAzXYO81tjRDjiiw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753572100; bh=fxJJbiApdvmpikYCoX/GX6dLU02A2157SAeeJZj6NXU=;
 h=From:To:Subject:Date:MIME-Version;
 b=MogZmKBvp4RAw5IrYQsrKBSmV3G0QDuj+glDOBTNa2qFiA49an5hfJHIp9DUc6zs1
 BjRxdyu2r3iBkcVcvA1OWb/x+cFQBVLaD1cP1Q1dhb8FR2oIFIV2VDrhorgosw9XCh
 sZqrW4/4+yE9lfjA3yA5FdeVXKp+n8gWgUDbX1n9RCYa6s31tgQ3k8VF9AVTCWiuvw
 Jc9fb12UiPck+f2sNmp7KNW5/8D6zNmDlhbeXIM7FC7YjYMWb98xwxoJ2Hw6NPsI6I
 cvsfMiMgGXDryduGDiyoLXKpR9t1dXbn9QCcS2V+DZrh4lgM7obqNNMx4rMdAl3/J/
 NanUHYfBkJHsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MogZmKBv
Subject: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
 missing Linux CONFIG_NET
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since not every defconfig provides it let's enable CONFIG_NET that is
required to build rtl8189es successfully.

Fixes:
https://autobuild.buildroot.org/results/835973d5b71bb085f62c533867746fc3d6b3a8c7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index b60b08fe34..9a2ca09668 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -20,6 +20,7 @@ endif
 
 define RTL8189ES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
