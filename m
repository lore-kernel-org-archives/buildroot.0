Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72739C25B6F
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 18:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08EBB4F27D;
	Fri, 27 Oct 2023 18:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08EBB4F27D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6lGHujteaNAi; Fri, 27 Oct 2023 18:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E29F4F277;
	Fri, 27 Oct 2023 18:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E29F4F277
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC3811BF344
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 18:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80CD54F277
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 18:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80CD54F277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y272q1jhxUZ for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 18:07:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3180A4F255
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 18:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3180A4F255
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A00E0A4C0107
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 20:07:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54926)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qwREj-0000x3-09
 for buildroot@buildroot.org; Fri, 27 Oct 2023 20:07:09 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 20:07:09 +0200
Message-Id: <20231027180709.47696-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698430029;
 bh=V481r2S2UooYXiGzalS2AzEwx7UxPW765vYGbpeFRNg=;
 h=From:To:Subject:Date:From;
 b=EL6bMV57cXF1dVDlWdyr/uAcNfbsJj3Puug1JmiIjDtpRHlOE2jvkjozFDydF8SyR
 eaKGJF1p/B4Jfu/b/xFIIRCXqcSDb8rrVWG5bW6uYEzeUe1V9wRzv1iHn8HNPQdC+U
 36+NFalRqOr97kmImef+hLwXRnFtH6YruO7pKKaOtJ1sHSSANAY4zUx+gGD71gzPT9
 rbkM7g/DT9Mx1M7Yvq1n8D8REwkgqquyNfqyTNuU0vD6ppN68jsLg8lQtXjtpqwOVa
 YjQl97ISHCLqViTT1VmZWjL/rNqW7STUeBQkGsR+l51pRzzo0f6vMGO9pQY8YMcGWL
 QiFQ7sjtOtpuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=EL6bMV57
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump version
 to 20.11.1-Nexus
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
index 8f60721163..0895b2e910 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2014b11dd928a1d4789279d7f3ce25af8af4047194e8406f9dfd99d16fe2ee2  kodi-pvr-iptvsimple-20.11.0-Nexus.tar.gz
+sha256  5c8bd2f04b3114311294e1dc064e592f712a62ff283a451bc8c19878f05286bd  kodi-pvr-iptvsimple-20.11.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 1ea3975be5..7314e855d9 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 20.11.0-Nexus
+KODI_PVR_IPTVSIMPLE_VERSION = 20.11.1-Nexus
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
