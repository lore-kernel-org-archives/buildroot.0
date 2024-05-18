Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5382AC25B79
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 20:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E93AD405D5;
	Sat, 18 May 2024 20:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBNG1rncqc8i; Sat, 18 May 2024 20:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD282405EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD282405EA;
	Sat, 18 May 2024 20:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AF361BF3F0
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67D5460614
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkGF839JJi8n for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 20:45:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C1D9605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C1D9605ED
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C1D9605ED
 for <buildroot@buildroot.org>; Sat, 18 May 2024 20:45:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F24B60ADA;
 Sat, 18 May 2024 20:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F912C4AF07;
 Sat, 18 May 2024 20:45:55 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 23:45:42 +0300
Message-ID: <20240518204542.787-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716065156;
 bh=Wr5febs6pQBbhqve0/ZHueBTKLoChw4Z36KCaHTCK9Y=;
 h=From:To:Cc:Subject:Date:From;
 b=eIIqfQair9TZO8nxHdJOTRTl9jwJ1GqZjQ+dBUGElty+G9/UzJ6A+OH/BGYb8sN5+
 ECb9avr8ZIx9SRJnifnm2L0geiFmf3XdS991VxhNb0bir7xspQRQDhZSuBb4iAWMMi
 eKJ5ZbDviuu5Gem4bpJ/xGi0ssWY1KyP7aOl9gPYouoB2NZPaaeS/sbkZLV7nKmHG8
 JTknh1pKwD8I4735+H88crp779pQX1gd6234FIIUycQQB7rde4pG84nXOSmohaB7ro
 9F2aJyDfNZzRwbdphVvVUxFM+7taBAmVOfw7beG69ScivLpRSekiECi5LpkoJgJkAp
 xRG6g7dYoaJyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eIIqfQai
Subject: [Buildroot] [PATCH] package/tpm2-tools:  bump version to 5.7
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Includes tpm2_encodeobject, which is useful for converting TPM2 keys
to ASN.1. This needed to support asymmetric TPM2 keys in the kernel.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/tpm2-tools/tpm2-tools.hash | 2 +-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index f50a896363..a7b1ef559e 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c0b402f6a7b3456e8eb2445211e2d41c46c7e769e05fe4d8909ff64119f7a630  tpm2-tools-5.2.tar.gz
+sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
 sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 12f924eee5..cd9c582aa9 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 5.2
+TPM2_TOOLS_VERSION = 5.7
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
