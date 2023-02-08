Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1543CC636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 23:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BE8820D6;
	Wed,  8 Feb 2023 23:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BE8820D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcRACGKGGjvi; Wed,  8 Feb 2023 23:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD948820C3;
	Wed,  8 Feb 2023 23:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD948820C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09C0A1BF2A6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 23:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E518D41517
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 23:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E518D41517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2ddnSHVVq_R for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 23:07:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A377E41061
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A377E41061
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 23:07:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PtX7pysl2niHoPtX8pTp8U; Thu, 09 Feb 2023 00:07:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 00:07:21 +0100
Message-Id: <20230208230721.3269610-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
References: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIRFQOlkk/yCs7FD9zHu8vxTS9b5oBfZHGy0azkCJP0CvnMrpAIl25pV8iSbRADF8o7zMJWOW6p7jXmwniJDLuBNWwshYaxXOhP/YYvyXl83ukaB9rw7
 5K4r0GxNv1qDUPwH+di0Mdwnin1TtHYC7JZVXlk4JXa2ZdIntS7ALXqfOMZ3SvyXDC2Fn6QNQ/gGVLgWFWKxWWGhq+whV85rmkpAS0owxFSr0a9JXXinU4PO
 qj4mghoRKmWdeebru3WPRf3zbwVdItugl3PcAVwSmofMksIo+ofmOcGjpEo+69qEhfxBRG4Rf9+twMC9GUIjg7O4tMwEgrLQfowRcYHEtYE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675897642; bh=TVkHJvEsVRnOaBJqiE3prHtoUwcRu+7+Uxtips4QLNI=;
 h=From:To:Subject:Date:MIME-Version;
 b=W0VjA6K5knXVSZO/aIWf+ZvmlaZpA75ZTNzpBnNgoI1LwRCgBCJm8aCMeWImpE1DF
 K1Q/qPhS/xObG74eE7oCUvUc+kQBYCg+Tf3hcNMr+vFfG0ynBTCsl+1sOjvAcIRUUb
 LnRPmxO4u/BFmeVtuLfhuoUpftKLnm30kmLIWMdiNjn0StSj+eiu8bYzASWnTribDS
 6KQOoDB9vMViLtjNkNogAVekHj7KnIMWdjMQY0/g7PFj6W+KvDThoqbwpFOUn1uacA
 U1oYRC+vcZL8uNBeMIo593xMZfMRldWDcfwX3p9Ytsfllu3r4+b+AZZtb4bPrAEtWL
 2a3tDiv4xnkYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=W0VjA6K5
Subject: [Buildroot] [PATCH 2/2] package/harfbuzz: bump to version 6.0.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
index 9489f25c6a..faae7b91e3 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d  harfbuzz-5.3.1.tar.xz
+sha256  1d1010a1751d076d5291e433c138502a794d679a7498d1268ee21e2d4a140eb4  harfbuzz-6.0.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index b0112168e1..02fe4ecec3 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 5.3.1
+HARFBUZZ_VERSION = 6.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
