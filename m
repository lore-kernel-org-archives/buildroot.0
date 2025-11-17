Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7427ECE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 16:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C01060E21;
	Mon, 17 Nov 2025 16:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dz-CMSHcTbrO; Mon, 17 Nov 2025 16:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3795060BE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3795060BE4;
	Mon, 17 Nov 2025 16:33:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FDDCD5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C4E9409F6
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDavE1VPCuX3 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 16:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.101;
 helo=smtpcmd10101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C11540399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C11540399
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C11540399
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 16:32:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id L29svD2bIIfDkL29tvAX5b; Mon, 17 Nov 2025 17:32:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 17 Nov 2025 17:30:09 +0100
Message-ID: <20251117163009.2682313-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGhctAV1ldsH4gPDI5IdxqJsXN4b+lyn0BPEPpg/JByqTZOfdArmz54HQ4Rq5S6o1bSUmUC7D3YMxgBogTddJ22IqrI7W+Lo+sxhdCMBcH+i9MrRRNQe
 lDiZtq38IGRxIFpJYnJ3kwyCva+NIX9+bVfglG1Gh+9ulyDzkwuOzCD0kTuIFEi3JzaoJyB9jKGjAaxH8H0SrObaGnITBkhsclRomFzYYkSSm9UtrqVDSS1X
 t23NS9Df+yKDvbwIaVmZElvi/aiEMpM9T4Y5cKP3utgV83BX8KGpntVlpR2RWknjopH2K5RrS1CqmxTCf7uDqJd058dA07HnzrXYtCGtbMU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1763397173; bh=KpcOOwpdjfWDPJMdCi12Uf3mZwpVsrFrbAYxjqfvB8k=;
 h=From:To:Subject:Date:MIME-Version;
 b=kdRdKSM6A62bk/ymXzxsjNsi0z4lbwFNYtdJ2ZHRKadi07egph5ca33cv/A2V6lD2
 UodonWMACEn/zLml98eLy6BMUVQWRoSyaK57DVPSBKyKWLj25ceFfcPql//Ybr6tGX
 3LGIWqri5a+wPkJOWZfVpF2KHgGm34oUlAj4U8pNG7V+l4x6wzzwQNeaBs+clRkoSX
 jwOVK6c2UddhO5747jqw+ObUSH2+Kh2ETivkZ6sQ57c6U9JcshvdC4faGicgZenxLa
 l2+ifCvFa2Nhdkxy6UwHd9d/fXCcH4dMnLAIeEIE0CHnYQCc129DfzIgrGzMK1zFvk
 s5g75uGPoQgvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kdRdKSM6
Subject: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.6
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtraceevent/libtraceevent.hash | 2 +-
 package/libtraceevent/libtraceevent.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index 8830a5e998..a974f326e0 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  1f2f5b8981818638ed51cdafc9b5e95316b5602255aa8ae19a3a5c8abede0e9a  libtraceevent-1.8.5.tar.gz
+sha256  812547d2f7b248485c183be2799b7041038ee44183000705609754b128c84c6f  libtraceevent-1.8.6.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index d25f6b520e..cc0190f84a 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.5
+LIBTRACEEVENT_VERSION = 1.8.6
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
