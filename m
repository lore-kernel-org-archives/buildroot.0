Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0948EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 11:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD51142121;
	Sat, 11 Nov 2023 11:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD51142121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZXca-FnjaPH; Sat, 11 Nov 2023 11:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6D6641F87;
	Sat, 11 Nov 2023 11:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D6641F87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21AB71BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFEFA83A9C
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFEFA83A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wW_QM3CqV6Vv for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 11:44:14 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 463B483A9B
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 11:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463B483A9B
Received: from fli4l.lan.fli4l (p4fd6c5aa.dip0.t-ipconnect.de [79.214.197.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F475A4C1079
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 12:43:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48788)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r1mP9-0005O2-0X
 for buildroot@buildroot.org; Sat, 11 Nov 2023 12:43:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 12:43:57 +0100
Message-Id: <20231111114358.2674610-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231111114358.2674610-1-bernd@kuhls.net>
References: <20231111114358.2674610-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699703039;
 bh=79szJ4Zeu5lwZU3zCzYSALz4tOicXgtdImtw/l5deHw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=W6ZwRQdzMtqlwuP6B08AvYhPrZ0v8EbhuQ1hMolBkCWCn8BTTVtxsAnxMdC7jyyCE
 /w6dXSLjlCExJFKRrquV0MvkiodYi2bh45DfmzK+5lu5LTsYrChcXiigEtF/+xeltV
 tLPslUabYLbU7ajViksVI/vm9KnJJQnS+TyCxdHMTR0sD1ziJCpkk3/mjxUXRNc7mb
 9sAQQNuRzO86vaO/Yk13cmpASyAX/xewJuV3rYPhrS7CT1xQNQVVoVIBuhZMCeB40l
 78nLKFpelOTVdmyNfqFswVsRWGA1ahidbqJt/tAhrOe7iEOb3aB5ZE04kYLQsbDa/W
 FwglpDR9cQGjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=W6ZwRQdz
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-iptvsimple: bump version
 to 20.13.0-Nexus
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
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 0895b2e910..fa316b084a 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c8bd2f04b3114311294e1dc064e592f712a62ff283a451bc8c19878f05286bd  kodi-pvr-iptvsimple-20.11.1-Nexus.tar.gz
+sha256  9edf800d7d5e755c92e9e8f6d3771a74cf3fec23b3aaec5b8535f1a579941a5b  kodi-pvr-iptvsimple-20.13.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 7314e855d9..eada2c63a5 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 20.11.1-Nexus
+KODI_PVR_IPTVSIMPLE_VERSION = 20.13.0-Nexus
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
