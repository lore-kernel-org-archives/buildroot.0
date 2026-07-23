Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFBC531F7
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 16:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B61A40A8F;
	Thu, 23 Jul 2026 16:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qa7TMJ-KvQNm; Thu, 23 Jul 2026 16:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3349140A84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784825859;
	bh=zIjQH+owHoIsOaxQ7wGgUuXKtknYIrkovCRRR0djfOY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DNZPzdHtDlQ9+20weSchmCUlWzMfUnNxc+9Wy8vT4qMgZj3PPdZJlxcBJ19HCbEU2
	 1uF3alRv+R1fgCpt0IpFPQ4lWI/5cx1LiHnLr8tp59C62tLHArkkFe6oANup8ZR9tZ
	 T/Uxs+cn3GBYC+GCfMoHxJYoOq+jTvVBucyGT+OYZ3AxP96IEbZgecvOybqD8d8QNB
	 VjGwmlRvQ1E5V3LVFadAdKKChs/2tcRFKxfTfr70fWrS8DCLmlJNHU5l8YzXDFKsLU
	 PvwOTB4a5aZWboLE4loMQNRuCPn+IRRDUTwTZegvMAy2Vnx7BeAJTEaJ8jmi4BkKTq
	 FAIlCwE4KMnqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3349140A84;
	Thu, 23 Jul 2026 16:57:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0667C2E5
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E091340443
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjfo90cLpuih for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 16:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA3240442
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CA3240442
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E108F8A3F5; Thu, 23 Jul 2026 16:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 18:48:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32d1ebf9fc6b311cda598ea7b585bb695437b3ff
X-Git-Newrev: 62960bded53afe6189152a8c44d0b45972518038
X-Patchwork-Hint: ignore
Message-Id: <20260723165657.E108F8A3F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: bump version to 3.6.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/62960bded53afe6189152a8c44d0b45972518038
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/postgis/postgis/blob/3.6.4/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 8ca0fa48c3..aef1864016 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d488089a64ee4060bce7dbba0291fcca358e7f7ac5230e2ee5b344e7485729c4  postgis-3.6.2.tar.gz
+sha256  ed8dc6679f1e06f7b113592b04cde2a7e00f1b1e681294c8ca2204058990cec6  postgis-3.6.4.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 0a55ee0e58..8a52027967 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.6.2
+POSTGIS_VERSION = 3.6.4
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
