Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 09:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49C7241008;
	Mon, 18 Apr 2022 09:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4g1HmR1Cfz2; Mon, 18 Apr 2022 09:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 899B641005;
	Mon, 18 Apr 2022 09:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19CCE1BF391
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 09:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16A1183F23
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 09:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxvPcS1atz_W for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 09:30:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55F2583EDF
 for <buildroot@busybox.net>; Mon, 18 Apr 2022 09:30:57 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id CFE9F440757;
 Mon, 18 Apr 2022 12:30:15 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1650274215;
 bh=nW2E8fLlm9WErPPcv4cSMo/c579gjHlkGtVPhaD2osI=;
 h=From:To:Cc:Subject:Date:From;
 b=wBKlgPOQxKrQTPAULJRY6duTRrpem01/jQnvpJ/ZoemqdNfTJswAkrrz7NAQvwZCe
 UkBYc3HBV/FZJ/0xEHno4idpy8RtFW9aEyxIUrV3HqEg3nOQq/gv0Mi2oQD0/It0kp
 zDunv7WSWGC/9aOf2dXE5qqIPi7t6qQri9ydhWKc+K7F5Sl5pxrPHfKEdnWAIY/xT2
 79NalClWUdODUIpyntjDLKt3uAJWCv5EyYAUT8eeU33eS2xqUR/10iwfm16PH2QKoF
 3xd+niP5nYX/XcWoh1KQuY6s3OGn0fKfCwOmy3x2DH60LXLzr2iylLAi/1365JtS3E
 LUfVCEmgzgCsg==
To: buildroot@busybox.net
Date: Mon, 18 Apr 2022 12:30:50 +0300
Message-Id: <05c2ec866042ea7dd9a215c76c6382f2096199ab.1650274250.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2022.82
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support for the Twofish algorithm is removed upstream.

The dh_group1 algorithm is now disabled by default. Enable only when
BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is enabled.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 82ff454f0a56..ff6e312fde24 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  48235d10b37775dbda59341ac0c4b239b82ad6318c31568b985730c788aac53b  dropbear-2020.81.tar.bz2
+sha256  3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1  dropbear-2022.82.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 1cbe63682c5b..bfb80345ece7 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2020.81
+DROPBEAR_VERSION = 2022.82
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
@@ -63,12 +63,12 @@ define DROPBEAR_ENABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_ENABLE_CBC_MODE 1'       >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
 else
 define DROPBEAR_DISABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
-	echo '#define DROPBEAR_DH_GROUP1 0'             >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_LEGACY_CRYPTO
 endif
@@ -87,8 +87,6 @@ DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
 else
 define DROPBEAR_BUILD_FEATURED
 	echo '#define DROPBEAR_SMALL_CODE 0'            >> $(@D)/localoptions.h
-	echo '#define DROPBEAR_TWOFISH128 1'            >> $(@D)/localoptions.h
-	echo '#define DROPBEAR_TWOFISH256 1'            >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
 DROPBEAR_DEPENDENCIES += zlib libtomcrypt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
