Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86980C77B7C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC8C941A46;
	Wed,  2 Jul 2025 17:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T32qQU_XhfdG; Wed,  2 Jul 2025 17:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CD741895
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CD741895;
	Wed,  2 Jul 2025 17:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E213196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 17:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4452683C1E
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 17:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to-3A5SJYs3M for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 17:09:08 +0000 (UTC)
X-Greylist: delayed 1858 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 02 Jul 2025 17:09:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A667381460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A667381460
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A667381460
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 17:09:05 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uX0TD-00BXaf-DN; Wed, 02 Jul 2025 18:38:03 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 2bb36674;
 Wed, 2 Jul 2025 16:38:02 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 19:38:01 +0300
Message-ID: <20250702163802.2754805-1-aperez@igalia.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3LlOmY9lUaKuP/wECpcBhkB4zTxuUIaZutJT8Zz7H5Q=; b=GRnpkYQdXjViukVcgKJy32WSIB
 bMG1w5su/8lh7gL5Kk6UVkEvMCWPGnYKNmgeCeDng88fI0Mj2IE0GztuNqhxYZ8MlGTfg2A5N7WZl
 ye3VZoksJiTF3Ht5qDKf2dcvZS/HieAtNVEOcr69YjnDvYgn0FcX0eob0kjBHeYs/VJnESCIe9Lpr
 FieDKr+DX9MrtcQJxKQ3oYNQxS1uJ9syl3/uIiJ7n4uq3BUCv3sBvbetFXlnA78bZmG0noflTkfmi
 0cmDSEp8zwnTUyWk8zpjah1bmML+8pbqO3O9Av5sQFb7eNJ2eqI4GUSHeGzt6UtkRAEnOHHmc4Usw
 UjQ1GIog==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=GRnpkYQd
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a small bugfix release, mainly containing event handling fixes
for Wayland, and the possibility to explicitly configure the gamepad
support at build time.

Release notes:

  https://wpewebkit.org/release/cog-0.18.5.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index b59b5f4795..d513ae72ba 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.4.tar.xz.sums
-md5  0566ab6676b499ebcff372fbe39e24fc  cog-0.18.4.tar.xz
-sha1  2d6f88cfb07eaac1be2bf9954832f19f8a856631  cog-0.18.4.tar.xz
-sha256  31d7079db2eeed790899d2f1f824dd6a54bf30d072d196d737be572f105d99b1  cog-0.18.4.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.5.tar.xz.sums
+md5  3df784f9930353ac4cb2d95fdd56e21d  cog-0.18.5.tar.xz
+sha1  49a79797fa4d0aa41680095161df7cdb155f8fe9  cog-0.18.5.tar.xz
+sha256  0ede9d09ab635ac519beec0543378e3fc51b56561a5fb7aa9c0cbca54c31b97c  cog-0.18.5.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 7f680bb700..418ed19d86 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.4
+COG_VERSION = 0.18.5
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -45,7 +45,10 @@ COG_CONF_OPTS += -Dcog_dbus_control=user
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+COG_CONF_OPTS += -Dlibmanette=enabled
 COG_DEPENDENCIES += libmanette
+else
+COG_CONF_OPTS += -Dlibmanette=disabled
 endif
 
 $(eval $(meson-package))
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
