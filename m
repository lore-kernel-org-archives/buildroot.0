Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E347C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDCF240569;
	Mon,  5 Dec 2022 12:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDCF240569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnCod3tL1vAe; Mon,  5 Dec 2022 12:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E616404F5;
	Mon,  5 Dec 2022 12:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E616404F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3A41BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26CB44052E
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CB44052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnIh_4ENq2s1 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96D2E408A6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D2E408A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FB2785B9E; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 21:28:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb449c72cd6a2983e1d9ebffcd6b0f87fbe7df96
X-Git-Newrev: 338375d88de1baae5e3a178813f53334a891656b
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.8FB2785B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: bump to version 2022.83
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=338375d88de1baae5e3a178813f53334a891656b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DROPBEAR_DSS is now disabled by default. Enable only when
BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is enabled.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index ff6e312fde..8f6c49c62b 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1  dropbear-2022.82.tar.bz2
+sha256  bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b  dropbear-2022.83.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bfb80345ec..36eb7898ba 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2022.82
+DROPBEAR_VERSION = 2022.83
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
@@ -64,13 +64,9 @@ define DROPBEAR_ENABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_ENABLE_CBC_MODE 1'       >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_DSS 1'                   >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
-else
-define DROPBEAR_DISABLE_LEGACY_CRYPTO
-	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
-endef
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_LEGACY_CRYPTO
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
