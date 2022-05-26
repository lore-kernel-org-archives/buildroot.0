Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D2AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 11:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDFA61061;
	Thu, 26 May 2022 11:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DEIlKbnr-d0; Thu, 26 May 2022 11:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49DD16105D;
	Thu, 26 May 2022 11:37:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49B531BF299
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 11:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45EE3411A1
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 11:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zwSVpWdQNUl for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 11:37:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBAF740AF1
 for <buildroot@buildroot.org>; Thu, 26 May 2022 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=83ILX1T+kFGOpFPQjUK4s0DfYe/lOepbJ7WC9urQT1Q=; b=j5lRiPPIeE5EZoXAci6pKKXF0U
 LdYXi4/M2XT52hVpfzO3EzRC03F+uTDWxkgSOUnsz0A3UDx1agaEYMDC/4kXd4kb+aEL3byi4Q1vM
 YFpQ6DY6UCvyxWEu+te6zWsii5vv4MCErr0OS4ajEk6mDGEtrL+jrmayU5nXSm2j3QlBYuTh0Jzvk
 vdaTbmCBTBAYI+Uw5XIMwG6A/65S3ADDebmyonyQlXxqPJ5wlNzMafaZQih1j2z0qts4lNMrHNU/E
 9jGBE+U+1qsu5bnvFO1vAe6bZpR/BWLz54Mf0429v4HpMcc9TE2aPmGyTg5pFGKEJ6VBV4e+rfARp
 zwE3tSlw==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nuBoI-00228u-41; Thu, 26 May 2022 13:37:46 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 52fb8725;
 Thu, 26 May 2022 11:37:34 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 14:37:33 +0300
Message-Id: <20220526113734.754047-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/wpewebkit: allow building for risc-v
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WPE WebKit works just fine on RISC-V. For the current stable version
the build system automatically picks the LLint JavaScript interpreter,
and the upcoming 2.38.x release series will include (and automatically
enable) JIT support.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 36523bdb41..8e80c73302 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -7,6 +7,10 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	# Disabled on MIPS big endian due to sigbus
 	default y if BR2_mipsel || BR2_mips64el
 	# Disabled on PowerPC pending runtime testing
+	# RISC-V needs the g/imafd ISA.
+	default y if BR2_riscv && BR2_RISCV_ISA_RVI \
+		&& BR2_RISCV_ISA_RVM && BR2_RISCV_ISA_RVA \
+		&& BR2_RISCV_ISA_RVF && BR2_RISCV_ISA_RVD
 	# Disabled on SuperH because of segfault
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
