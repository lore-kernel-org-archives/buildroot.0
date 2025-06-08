Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A244C5B552
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12C7440A0B;
	Sun,  8 Jun 2025 11:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsDS2vDeyiKG; Sun,  8 Jun 2025 11:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36AEB409FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36AEB409FB;
	Sun,  8 Jun 2025 11:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B7961F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D80540210
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLO5Yo4p_Jds for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24E6E40287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E6E40287
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24E6E40287
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:01:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3328CB0051E;
 Sun,  8 Jun 2025 13:01:05 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  8 Jun 2025 13:00:58 +0200
Message-ID: <20250608110058.15627-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749380467;
 bh=2///GNBn6WP2TM/DE9uZtV8MPGhcUyKxDFYlaLYmjoQ=;
 h=From:To:Cc:Subject:Date:From;
 b=j6l6t5foQW2giP1DaQth1vKn77pcOqX4xe3mw6aZP3Puv98kAAX3Fz1dexK+ivGOe
 bY7mjMFmb3jEua9+dRb6/7PGlrf7xh5ZkGgX7DTrg239p7ojMG4jlR4uWJv9QBdQNI
 kx55eoOn6DLfqSAtFrJi4aVjDx6tTuRvqyB5CpHZuS5U01SSZzRUFIQ7ohVFMO/qYB
 yOQfwqslG6qCutuEN6lr0qEGvkGpxtmJpVnhFzBdzOZHo/+c22zMBzcIZDnuTE++mS
 VwF8l5FUAxMhXOVsHfffTetA/0iitRXRCyS+YE5ubCPLeQvgzQpvVEuqERhOkuM0A3
 AKE7pv4l3C0Cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j6l6t5fo
Subject: [Buildroot] [PATCH 1/1] package/mender-update-modules: ipk support
 depends on MMU, wchar
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

Since its inclusion in commit [1], the
BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK config selects
BR2_PACKAGE_OPKG without propagating its dependencies on MMU and
wchar.

This commit fixes this issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPKG
      Depends on [n]: BR2_USE_MMU [=y] && BR2_USE_WCHAR [=n]
      Selected by [y]:
      - BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK [=y] && BR2_PACKAGE_MENDER_UPDATE_MODULES [=y]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a474642fdcd8c69e12126bbe8304479aa855d916

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-update-modules/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index beec9d24e7..76158ab6c7 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -108,6 +108,8 @@ comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 3
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
 	bool "ipk"
+	depends on BR2_USE_MMU # opkg
+	depends on BR2_USE_WCHAR # opkg -> libarchive
 	select BR2_PACKAGE_OPKG
 	help
 	  The IPK Update Module allows opkg-based packages to be
@@ -118,6 +120,10 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/ipk
 
+comment "ipk support needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
