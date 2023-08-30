Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F93BC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6BEE417F6;
	Wed, 30 Aug 2023 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6BEE417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gTu1-rJbpoAT; Wed, 30 Aug 2023 20:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E87417F0;
	Wed, 30 Aug 2023 20:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E87417F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F15E1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55CA3417F0
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CA3417F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZqYr9txXh-Z for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:45:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DFAC417EB
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DFAC417EB
Received: from fli4l.lan.fli4l (p5b3a0af8.dip0.t-ipconnect.de [91.58.10.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38C72A4C02EA
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:45:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38232)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qbS3p-0006bb-3B
 for buildroot@buildroot.org; Wed, 30 Aug 2023 22:45:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:45:09 +0200
Message-Id: <20230830204509.1181166-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693428310;
 bh=3rlnT1lWbcrW3Rv2TdIisE1Jf6MvBcOnKT2lRCdObQc=;
 h=From:To:Subject:Date:From;
 b=NkdjwS8+b7/4Mver2XRulLlxJNZ9vqZhG9wYknUdTAfNhYxD0hdQ8R7K1PZygFUKL
 7QDaOE9R0pDEm5u8c0CMMn0Helsovchv1BSudgGKPjs+S1JOcnw+8ytNjnQdRwg25t
 4CoFbEj1mX8Q3BtxbguDanIUcoUOO14FTRWxV18W5LhAWnZOEyFDj2RZg0q1Jtgx/9
 LgTy5PL2ofqNAGOT2TiAguettsGYkd/rPsJDllANhwP5wBxLg/y+f4qVI/h7MbhphD
 LWAuhiHV/3m9iPTgbjibi0p9oATryqQpiEsdBbv4kwbO0mKz6BZ46fHBWimk8j+WU5
 7miEb71W0zA3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=NkdjwS8+
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to 2.4.116
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

Release notes:
https://lists.x.org/archives/xorg-announce/2023-August/003416.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 87cc170617..32b39d6a1b 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003323.html
-sha256  554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb  libdrm-2.4.115.tar.xz
-sha512  0c38d3cfd76f627b899f052527c2939d5fc87a417422dceb0761839ba21e69736703a87ba170b5ba7a4aca2506a240760c8c97ca1781a7fb78468225295293bd  libdrm-2.4.115.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-August/003416.html
+sha256  46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a  libdrm-2.4.116.tar.xz
+sha512  1287d1896deeb8cfb4532c6750eb43493dcefbfaaa598a73bbb682aa749594eaad3ed1fa2fe73d06280350f365a92a0c20cad8be76f3da2ed59b04aa008de911  libdrm-2.4.116.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 52ac13b7d0..70f449037d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.115
+LIBDRM_VERSION = 2.4.116
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
