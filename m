Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A75DC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 175AD606F3;
	Wed,  7 Aug 2024 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gkvc5IfRY_5; Wed,  7 Aug 2024 20:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A702608D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A702608D0;
	Wed,  7 Aug 2024 20:55:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02E781BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E421A608DA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOzvGiQtWgcz for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 565CD60811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 565CD60811
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 565CD60811
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:55:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bngbsWMVBwy3rbngcsgsbD; Wed, 07 Aug 2024 22:55:10 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 22:55:09 +0200
Message-Id: <20240807205509.382108-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL/Nsi82SKtnhvUa1KJwQ3a/a9qOD+rFaF9ZMIQ9HKx1h8obrxkxXCzMVPFLTtMmdd8eyhzNkJ1Az4hiGVPrxRgvvo7HCukUsvEyFIs7bl2qJHwwWDqW
 ZrXjs5VhHGKDseeKLDVOl4YSOxi+GQyl6CSSQ7biZxkSD2PcVVRN2RgHtqi94HZ+2ol2FCo5X/p5gyXU052L9VdNKOKUjFAh57H8J9pvJqcFsfyj6CxwTg5C
 n+ULevgGmA7RlzNleZeXq72GiuWb0XDsbrFV7Wj3CHY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1723064110; bh=USLcajsTBsIiMC9Af8HKb0Yc4T5U5OdfJBu3YGEM+MI=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rl7rl8LUSxSzSL4CyZob3R8jA5bIytZUnn7jk2+Pi6JqjJhC885fsXNPx/Z+/Wecm
 jmpnK/Es9Mj7n3oBliXytImymR1NWSkZU2a0MXYY36lU2TltyORXOu+Ja04ELfKmkj
 JLprZvJu9b63LuwO7bomK28dkh7lPRxpZE/1oIl5E3rRSLpYdYOJmTYkzrQCeGFTo8
 Z3ygDXrepJvFhyt+/BPs9Zo8WZb7kfmfS7m7yh77nNni4/YV1/M10vGLQDv103pPch
 4Xq7eBDqTF2V0VrA43bCfviGAjIndPek6FpDEKcNg9mwyspBiBnieIHAszZtxr0EBE
 uxtasDi0YTCSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Rl7rl8LU
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.7.4
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index dfee537a4a..e0cb65642d 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
-sha256  b772ae4f6df0cee7200b28cea960e4daaff2a203d2fd502beab3c1317b07a456  cryptsetup-2.7.3.tar.xz
+sha256  dce29903a58f7b774fe61191e7e6de955de0f40d9e27b0028ffcf3438c0e9480  cryptsetup-2.7.4.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index d5046d9943..15cadb2840 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
