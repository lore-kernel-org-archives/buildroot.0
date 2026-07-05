Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2170CC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 09:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E88807D5;
	Sun,  5 Jul 2026 09:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBj_odMgEsyN; Sun,  5 Jul 2026 09:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D50A5807DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783243898;
	bh=vLtjXxYKWt3bDmFML7nA37YLlMHbOmWrTT9WgfL/MPQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ap+Q84nk6oCphscx+DTb2FLNetiRndA3H7caax1HPmpItmggd46uGobULp89It47H
	 eLZMMy0J3YrpYMH664PCbzbVn/Jqrn8BUltGPyL8X/U1xqSFBc2VjGQnzbgFQqG/VF
	 GZOgG+n6fW8tG6XzWjp9FpyhD6ps2ETYe9qdh5ZC5sg5UdtF89ZjVgC5NU7HYQvXOg
	 BkPMaSH1xExx2uVq97egVqpvMF5STW/GpnIn0PgiWKO1HxOA641mIs2150Jqjdn5QQ
	 O7FXOxbr6T1jYhAPE1whkot9xyJGeWUtpRx24K2frz7qHeZTyXsUXrSdKivP9szORs
	 kDmXLo+kXvlKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50A5807DC;
	Sun,  5 Jul 2026 09:31:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AF42A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6790E40850
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Wct75mfR4kk for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 09:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA5BB40758
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA5BB40758
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:31:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A5AB88469; Sun,  5 Jul 2026 09:31:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 11:30:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b2e2bdd9bf982b64703097954bd9be33dbf4fc8
X-Git-Newrev: a34e6a1938040d95372f81da0a8a1d699754d066
X-Patchwork-Hint: ignore
Message-Id: <20260705093106.6A5AB88469@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwdata: bump version to 0.409
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a34e6a1938040d95372f81da0a8a1d699754d066
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/vcrhonek/hwdata/releases/tag/v0.409
https://github.com/vcrhonek/hwdata/releases/tag/v0.408
https://github.com/vcrhonek/hwdata/releases/tag/v0.407

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index b7323fe117..74a7f5e7e7 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1ccfd1ca723595b1fe8794f4157ec5635be1ebedb5d13769b4be75d0b75bc199  hwdata-0.406.tar.gz
+sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index e12ce7efb6..7300b908b1 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.406
+HWDATA_VERSION = 0.409
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
