Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E95C001B0
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC480410CB;
	Sun, 25 Jun 2023 14:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC480410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L35axWcSncuu; Sun, 25 Jun 2023 14:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7786410C6;
	Sun, 25 Jun 2023 14:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7786410C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97A611BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F67D410C6
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F67D410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuKGP3ACVlB2 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:48:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A14C4099D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A14C4099D
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:48:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 466CCA4C00B8
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 16:48:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49392)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDR2Y-0005JU-01
 for buildroot@buildroot.org; Sun, 25 Jun 2023 16:48:34 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:48:33 +0200
Message-Id: <20230625144833.296862-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687704514;
 bh=6IQYRYM2oqNB09cGzB1vUZdVDRyS/4b8J+JMR7ei9m4=;
 h=From:To:Subject:Date:From;
 b=x3iJY1Y5/d3ZJ+8WlvMjWipcKA4gVc3lNpGtHgfA//VFLrUd0iO0Yer13wTlsFJhn
 oTPzZ0Ev35o7vZnqv+fnayUtE3ZFZ2VJDU1RuXnAxUeYyrU82DiiyBQvzyesYLZZQZ
 1rzws2vgo39LFPAJh894majpoaanlJiEHvOcpvoOA/cuXoo0OIFmdNW4y/58Lt36XF
 k0sPqSvWlRk77ZT2fUW4JbABTGBozd7qEK5ouEuavu8pmAYews/024dVILoLaLPmKj
 fUjQGTevlCyjpXjgya9VXF9g/6ylggaI4vu7LRW5/LD5IrDlxyJLrBJEmtaJDf+/qI
 EuQIXLLTExgkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=x3iJY1Y5
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version to
 20.3.10-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 87df4f7de0..9939c6f73b 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  451d4e4dbdca71c9bd31d3d11528db4759b93c323476e5e881f617fa3eadc600  kodi-pvr-zattoo-20.3.8-Nexus.tar.gz
+sha256  68aa0a3af4f10396c866b0da225928033d0bbf980b8884c944dd1829e013435d  kodi-pvr-zattoo-20.3.10-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index ed3c96f3e8..53153f8f59 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 20.3.8-Nexus
+KODI_PVR_ZATTOO_VERSION = 20.3.10-Nexus
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
