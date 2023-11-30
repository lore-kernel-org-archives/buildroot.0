Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6879BC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 13:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE5D41989;
	Thu, 30 Nov 2023 13:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE5D41989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tM2CKGM3ll0Q; Thu, 30 Nov 2023 13:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2100241BB7;
	Thu, 30 Nov 2023 13:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2100241BB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09BF41BF37F
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 13:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D689441BB7
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 13:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D689441BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1sElp4S83kJ for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 13:33:41 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B178C41989
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 13:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B178C41989
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8hAa-008otq-Td; Thu, 30 Nov 2023 14:33:33 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 494baa99;
 Thu, 30 Nov 2023 13:33:31 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 15:33:29 +0200
Message-ID: <20231130133331.1374583-1-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0mN4t3LvBXqny3BmegbtxnAB3QVfGbqqt658AV1Pd/M=; b=BcgpjBUAhaRL9Q8c6cFl/4ad0x
 1x241d5pZl4XIuf7OkVvbn+/tP/zsoQwettCEH65graxk23Qefb9SPwVcVDCGfyo+oQ6eSFue78e2
 7tgnQbgDpyUc9lXMpijtDTMe/i3C7YEyNo0pDaSkih0DcDzY2OQ9X4cFu3hfXoC5oKuSygx8Nu3hZ
 RU5CIYPaOa5DnDWzQMIsbq0E/7GeA0YrWh6w7kg0dO07tL+WQw+cci48BNWnaXQDg37U6F/E/cMna
 OsP0Zs95RWbfj0SWzvMo8qlhOAgHq9Oya20pwlFkcNenx2RUe6KP7ypQI8HoCIaK8Zr7p88DzircR
 hUeu48jA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=BcgpjBUA
Subject: [Buildroot] [PATCH] package/cog: bump to version 0.18.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a small bugfix release which solves a build issue, a memory
leak, and fixes touch input on rotated screens with the DRM/KMS module.
Release notes:

  https://wpewebkit.org/release/cog-0.18.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 9fb386dfa0..177113bb42 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.0.tar.xz.sums
-md5  9521458c72322e1b2e39e8b1cca93d24  cog-0.18.0.tar.xz
-sha1  73ec1684c31de7247ecbd5e852c16cf88416bedd  cog-0.18.0.tar.xz
-sha256  410bf70f9aa3812db72d75c25cefee421efa0391ab03dc3c37299dfaa388f4fd  cog-0.18.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.1.tar.xz.sums
+md5  204ae9353ed828e4ac39b1dd4c5c35dd  cog-0.18.1.tar.xz
+sha1  f0f0ebcd279170f427be0ad57fd356faff1a2732  cog-0.18.1.tar.xz
+sha256  72e3a84052b459e2d53d0e8b947f20e27bf5d8049766c4c1594eb9c6b6cf7ab3  cog-0.18.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index f41c114fa5..bd34f124c5 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.0
+COG_VERSION = 0.18.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
