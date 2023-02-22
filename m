Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D827C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 093C540108;
	Wed, 22 Feb 2023 14:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 093C540108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDjvgA-9JSPb; Wed, 22 Feb 2023 14:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3265A415B3;
	Wed, 22 Feb 2023 14:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3265A415B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16F741BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E592A82103
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E592A82103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlG52mc0zh7v for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:58:10 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71530820FC
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71530820FC
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:58:09 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UqSSpNjOdGxLrUqSSpkGGk; Wed, 22 Feb 2023 15:51:00 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:50:59 +0100
Message-Id: <20230222145059.1939094-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI9G0RCwDoK3d9hjfuB0Ol8U3ee/cPLY6j391w3dxGc5pFbAqhzsBE4A/z5UovAM2U9p7oV5KLT9+wssm5G3euaZQtUaGhOLVb6fxwSMP1XVcbzWX+J5
 mcNHOe5B4CoX2G4K4t3pqnAQPE2VdGiimZp6yxqHXbJ9Zv5DP8SsUL6dzopjdR2EKVdcov+dlCkHw08TPHXkeTKf3QoVC4RJbvOLYTGnqmxXTc8rdSvxE2id
 2q0IMNGmm/lVsSKuBexSDt6wb33H04cQiLQcIaS2tcMrMPHiG7ubcfOKGacdBqqZ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677077460; bh=uZyyHP1ISSd6Pe+JfSzeQEnYQm6xNEG3sbs5GOILNBM=;
 h=From:To:Subject:Date:MIME-Version;
 b=luXzfnr7wlZVpNOzp22rUmhtAxUhVHrLtQKY01Eh9bmv9ksknt5w1D+cg3nBMBpYs
 6/cKXEEn72FWbr/GW5wWh51WKHYLKD26WiRosfedUZy6iZviEycmT+MCzGmFZO4Qrw
 zmB9M9ypDheyT/snh7BW0N70CVC49zJO1U4M4+/zVXfgzDpl9E1DePT+BA34xEG9ov
 ZLv/h4NlFpyM/HcorOeUWp+3iicaTjF8i+a7yk/oG+uFMlsfErxfATuFLbyE3qQ2D7
 sVMKWqPQ1JT5+RPjdCb1tbhCIINa7xRu7hFu56IOx/x9KiE0i7qlHl3SZJvAhTVYxm
 DNWlmZMlpeFxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=luXzfnr7
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 7.0.1
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
dependency to harfbuzz has been succesfully built:
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
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 9489f25c6a..eee48c0b68 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d  harfbuzz-5.3.1.tar.xz
+sha256  2cf4d3d8f225007511990a36a34195f0d6562ca56df0a8b0885b382837948199  harfbuzz-7.0.1.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index b0112168e1..f8724793a9 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 5.3.1
+HARFBUZZ_VERSION = 7.0.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
