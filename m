Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B973C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 05:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1624B41721;
	Wed, 18 May 2022 05:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17ujD2PnKQUk; Wed, 18 May 2022 05:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5424416CC;
	Wed, 18 May 2022 05:02:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9221BF414
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 05:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C487812EA
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 05:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJs-dxP2brMn for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 05:01:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C3EA812E0
 for <buildroot@busybox.net>; Wed, 18 May 2022 05:01:58 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id D7A4644042A;
 Wed, 18 May 2022 08:00:47 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652850047;
 bh=OzSy+2ao1h1i+RV7pql4HivEqNIGj2sS84r8fHb/hlY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HmsFIJQgHYCU+FMeuxNd6UDNS2m2GmAsVFqF7hMbK9XnEpd79fgCck/yqMtQKo52W
 t8u9/oafatIpNNf4y+I+06gdSBV1B6AqzgDJHkIxBcyEuQuWNOwcX1eeZY2SrF/n/5
 2EEB8WsIa0SYqNOIUo+Dy5ZdB9dFDtHsVYkc27VMIcMBRw4E/QR2gNB73grVczWHlW
 NHrV8vcp2J7HQ0W6dqcRs/YffHEJPxPSAwsDiaGa5UFfBjwNg/M29ZaXduD/4TsdFY
 8vJ6rfPLNFbW3a36vYs4Gl5Gv3hhQjFOmrQaro/2MOd9x/ORobJNHDO/TSOwwvK3BG
 tvl1kO8gdJPIw==
To: buildroot@busybox.net
Date: Wed, 18 May 2022 08:01:40 +0300
Message-Id: <6a9969d764424f349d12b3f48c18ebcaaa16ecb4.1652850100.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <bec277739a5ac72c0dc81e9b0566a0c77c90823d.1652850100.git.baruch@tkos.co.il>
References: <bec277739a5ac72c0dc81e9b0566a0c77c90823d.1652850100.git.baruch@tkos.co.il>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] toolchain-external: codescape-img-mips:
 needs shared library support
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a glibc toolchain that does not support static linking.

Fixes:
http://autobuild.buildroot.net/results/4dcccda4e1600100c942a3f5793bd7a20165fff3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../toolchain-external-codescape-img-mips/Config.in              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 2341d0883256..8ea9508f9f89 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -4,6 +4,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
