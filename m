Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2186EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBB16117A
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDBB16117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C2784097F;
	Thu,  7 Oct 2021 09:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d71z1dxVW4ez; Thu,  7 Oct 2021 09:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20BE440948;
	Thu,  7 Oct 2021 09:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 220C81BF9C2
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F31960754
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpnBmzgeUeZh for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:52:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F25A60610
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:52:02 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 809EBC000E;
 Thu,  7 Oct 2021 09:52:00 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 11:51:47 +0200
Message-Id: <20211007095147.688449-7-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 7/7] package/gcnano-binaries: provides libgbm
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add package as a libgbm provider

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/gcnano-binaries/Config.in          | 6 ++++++
 package/gcnano-binaries/gcnano-binaries.mk | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
index 01e1aacf1d..ade19e2121 100644
--- a/package/gcnano-binaries/Config.in
+++ b/package/gcnano-binaries/Config.in
@@ -15,6 +15,9 @@ config BR2_PACKAGE_GCNANO_BINARIES
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
@@ -27,6 +30,9 @@ if BR2_PACKAGE_GCNANO_BINARIES
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "gcnano-binaries"
 
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "gcnano-binaries"
+
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "gcnano-binaries"
 
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index af5fdd1b7e..f6adc36dbd 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -20,7 +20,7 @@ GCNANO_BINARIES_DEPENDENCIES = linux wayland libdrm
 
 GCNANO_BINARIES_INSTALL_STAGING = YES
 
-GCNANO_BINARIES_PROVIDES = libegl libgles
+GCNANO_BINARIES_PROVIDES = libegl libgles libgbm
 
 # The Github repository doesn't contain the source code as-is: it
 # contains a tarball with the kernel driver source code, and a
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
