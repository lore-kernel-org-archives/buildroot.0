Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B230AC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 12:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD9E84209;
	Thu,  6 Jun 2024 12:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cb7TzcKFWfwW; Thu,  6 Jun 2024 12:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D9A84539
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D9A84539;
	Thu,  6 Jun 2024 12:28:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5112B1BF593
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B544608EB
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEhAwXRtLSh0 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 12:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5E926087C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E926087C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5E926087C
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 12:28:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 284C7FF806;
 Thu,  6 Jun 2024 12:27:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sFCDk-00ChpY-2b;
 Thu, 06 Jun 2024 14:27:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 14:27:52 +0200
Message-Id: <20240606122753.3028347-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] configs/qemu_ppc64le_pseries_defconfig:
 Linux needs host-openssl
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
Cc: Romain Naour <romain.naour@gmail.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7019514688

The kernel build needs host-openssl since commit 9982e0b5a63ca
(configs/qemu: update defconfigs to Linux 6.6.18), so enable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_ppc64le_pseries_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index ebc3b7a6fd..9c678ec1e5 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
