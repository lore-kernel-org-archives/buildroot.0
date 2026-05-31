Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C8FCD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 09:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A8106105E;
	Sun, 31 May 2026 09:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2Ku6v5uNfqP; Sun, 31 May 2026 09:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6095060FC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780219182;
	bh=TGtQo1+wSd80w6JOFH9CHJtvSVUcQorMdf/KHVmhPIc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9IU6xgGJY4jV5ETpLTG1WEEnXpMyyTdcMcfsYTQB3bMQtDSUkx/cEAgrNCwaHf7P
	 DHruIDgJwmDiUZmxWkwCf+9nRTFBygWPmZmU0HeLJVmz1O6L3xFCSjzWlF3IVeaO4Q
	 /GRqYFl2uc1wmmoWzjNPqGDzoLtBB4orf3pDe7bSxatz30EoqgX695xWi6rWNTWUM1
	 18m6gCpoSg35LwSNPKtk4sR+2E5cZJxbvaQGjY6ZtOWMeSR2YCfYYL0cPHmUdeNmgp
	 hMoU6N3RKw4XNt8gKrIOY+dJ9k88aJKhsjopvJVumd1TbgON/aT9s+OY0bO3e3uaHF
	 EReLSJniHBn7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6095060FC1;
	Sun, 31 May 2026 09:19:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF9F389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 09:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2462D42783
 for <buildroot@buildroot.org>; Sun, 31 May 2026 09:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMgkrwJhIWQH for <buildroot@buildroot.org>;
 Sun, 31 May 2026 09:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABC4142628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC4142628
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABC4142628
 for <buildroot@buildroot.org>; Sun, 31 May 2026 09:19:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1xNASD2Zxt-010lCQ; Sun, 31
 May 2026 11:19:36 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 31 May 2026 09:19:32 +0000
Message-ID: <20260531091932.15865-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:wB8u/9Q69kdZ+ewzoE7eY8Jj4uOPJk2YTjr/G9SF4kodqLgekez
 3xZ8Xxh/1yGlxuWe0InC+oBrXW+rDWxfYukJLXwodRsrrgoTlaBJByNDLfLvSnzkvk42qMq
 O9Jbo+4RDHcQrZLW90k4PFs4nF9QBHO2gh6Vyj3mQoPNfWcNrSuSS2E6xLJLuhD6j8APWxI
 +4zje0jxkxlIGw/9CV4cA==
UI-OutboundReport: notjunk:1;M01:P0:Ku+iflMJBr8=;IE4fE7MbtXpMMpd0tFWGh9Y5GH3
 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
 HXgzQ/Zko9qMp3uHzc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1780219176; x=1780823976; i=and@gmx.li;
 bh=43Gz+n51uE0f1O8E0gcFqvURZ1WEC/4idwwqO6ZVlOQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KKQ871JWp6V8gsfXSJJeXlZLN6hW7z9vXEMS8GZIcAlrfbDC3YSO4czzQd8sVEn6
 V73vlWjl/yg2DD/Aqf7yinoBT4T4oMOVIMA3/R5eM5JcZ3h+5mMt+APF8oUaqt08m
 kcxfFDfEBtDAvaboLL3N49tN75bH18bYqs+by/WLMg5YwYSuoKASszfI8Fn/4bMkA
 If+g/GBxkwIWZpVLa9SX6nA/XPlgK9a8EbPWE4IgjRS+XAM+XfjsiJ+zjoa1cHWPS
 nRBS6A5m6ugGJgqcnjZvqmP6RjuwVbw+EPwjRbu/SooIlaLLElCX0O2gO0wmsKGuS
 3Sq+yrhG+yBlFVd5dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=KKQ871JW
Subject: [Buildroot] [PATCH/next 1/1] package/cryptsetup: remove libiconv
 dependency
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Iconv dependency has been removed since v2.5.0-rc1

https://gitlab.com/cryptsetup/cryptsetup/-/commit/6e47fb6d8525a96bf264fcd43c163bb4057fa99a

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/cryptsetup/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 5062bba45c..00424af8b8 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBARGON2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
