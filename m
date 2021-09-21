Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43486C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD4D961186
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD4D961186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0BE4069C;
	Tue, 21 Sep 2021 13:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGBCT5ulyY0y; Tue, 21 Sep 2021 13:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49684069A;
	Tue, 21 Sep 2021 13:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 092451BF995
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0378B8347D
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APEC7zASfGZr for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:03:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34D1383459
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:03:35 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B90E4200009;
 Tue, 21 Sep 2021 13:03:33 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:03:25 +0200
Message-Id: <20210921130326.3462783-9-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/8] package/gcnano-binaries: provides libgbm
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
