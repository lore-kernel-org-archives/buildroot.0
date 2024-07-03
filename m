Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BE2C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 10:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6365640695;
	Wed,  3 Jul 2024 10:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cys9qyfmhRwv; Wed,  3 Jul 2024 10:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F62A4071C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F62A4071C;
	Wed,  3 Jul 2024 10:42:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE5DF1BF308
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 10:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAAF04071C
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 10:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cz2vuur6TsRn for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 10:42:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F15840695
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F15840695
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F15840695
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 10:42:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OxRaswQ6czLFGOxRas9lKg; Wed, 03 Jul 2024 12:42:34 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Arnout Vandecappelle <arnout@mind.be>
Date: Wed,  3 Jul 2024 12:42:33 +0200
Message-Id: <20240703104233.340464-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c6940b68-5fc2-4f4a-bccd-c654f510a3ce@mind.be>
References: <c6940b68-5fc2-4f4a-bccd-c654f510a3ce@mind.be>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBgiA0pytapPSl6EKSdAJM+eIEYo0Zf2d7EikRj2YMVzka7zmZOOsuOzq0SLNl0zp+9TsBzxTxW1PJUZ6O27b0Te+Xriy80HRk1DCS994TeFpML6BGEr
 dMYyyExrLSGiayGGOG9bxU06QttZ5bl/q4VXPpAM7RfIiM2qzE8jKgFbmWtZ9+ym7x6aHZwVLySbGAW/m20Y6f1P/BWOzekf2WfQqAWPdhjZS80mMyyLfWre
 dFTmbu1v/1OF03e5TNkiHKfXtGoDPX/KzFLzGluCPeY9qQa1uiQpTkl36Sa68hgozXypPnfvIsV6010Wdlfyjg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1720003354; bh=0y/ltsd2ddCtPsHDTVpznCPAzY5SuLoYA02u7UowrnE=;
 h=From:To:Subject:Date:MIME-Version;
 b=OJdlTU1TsVK8sMka/yUD5DZUjq1fm7WfuO1x2nD2VpgYwNQpSTufPjxzE/oevOP1n
 ACRzxlgYClSjYW9bLvegM2vjWLIgBtbRQu7sKl7fDFBMouJn0JIA+0KoTOIew/SO4Q
 ijpNjUo1L2+w9DVWKPb6TSPduInnlVueu/N9YYFtUBZjtLjLgmahGlO0Yqq9GggfC0
 CzyfHQypUBkegEZpTyZWU6HyzFBRVu+wz4dqwSDLPe3FRIq1xb91w5k50W/7PUN5y8
 c7YLJIeHWtGhYruki0T3CU5gZMX/uh+zaqiOGHrgB5Us0MPTKK31N8RLS92Duakd7A
 16Ct4H0Lrc7mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OJdlTU1T
Subject: [Buildroot] [PATCH v2] package/harfbuzz: bump to version 9.0.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the major release changed all the packages that have direct
dependency to harfbuzz have been succesfully built:
- efl
- libass
- mupdf
- pango
- qt5base
- qt5webengine
- qt6base
- sdl2_ttf
- supertuxkart
- vlc
- webkitgtk
- wpewebkit

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix patch to apply against master
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1ea54e8ee9..fa4ee16a9f 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  af4ea73e25ab748c8c063b78c2f88e48833db9b2ac369e29bd115702e789755e  harfbuzz-8.4.0.tar.xz
+sha256  a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e  harfbuzz-9.0.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 848fac4dd6..946b2b0f70 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.4.0
+HARFBUZZ_VERSION = 9.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
