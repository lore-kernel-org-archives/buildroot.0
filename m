Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D474C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 23:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E6E829DC;
	Tue, 20 Sep 2022 23:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E6E829DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7I0WSumv42d; Tue, 20 Sep 2022 23:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67258299E;
	Tue, 20 Sep 2022 23:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D67258299E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2DB1BF377
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33D5F4032B
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D5F4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8F338p1TXal for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 23:00:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C3040129
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13C3040129
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 23:00:48 +0000 (UTC)
Received: from 91-153-34-150.elisa-laajakaista.fi ([91.153.34.150] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oamEQ-00EmtG-GF; Wed, 21 Sep 2022 01:00:46 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 48cf2aea;
 Tue, 20 Sep 2022 23:00:29 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 02:00:28 +0300
Message-Id: <20220920230029.1680134-3-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920230029.1680134-1-aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hOb02aoAT+gInbL7wjs5ajPmi/lupAwM1AYFLXKMEng=; b=JrV5RLdgjID7lDuNb1KckYqJBA
 GVXnNfypP/sWQZ6TpwQASvl39DGpO0McsMbDrV7KFBFERB2WavLJ3E0pj+G5ztzYT9CZaijmsJsLO
 9OzVlxI0dYHYI6JET7fxYyFWW6lqbdiRnCDss83mKrDAt5iMTLBjmofgiJ6YHM1fann6KTunJibBh
 LNNLFtQpRU+8XDuTXFg0upncZQ0rJjKVowMMOgoW2MdYrixisZRFH39nL8lbD90GpUfhzp0YiDG3G
 Ury73OTyzMaIKscEc0USu2i22l8PMS43mVQn2VEC8nMzHpy85mKuBtEOReFCvd7WpbQAiZCaJk4Hz
 MVTYKuRA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=JrV5RLdg
Subject: [Buildroot] [PATCH 2/3] package/wpebackend-fdo: bump to version
 1.14.0
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

This new version contains only small fixes after 1.12.1.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.14.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 49c60fce0f..e2f2c6c89f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.12.1.tar.xz.sums
-md5  494f4a5b2bd89dacef37b69534b2e1ce  wpebackend-fdo-1.12.1.tar.xz
-sha1  72a85e4615e085926f7ad8fc8414f9c6a878ef28  wpebackend-fdo-1.12.1.tar.xz
-sha256  45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629  wpebackend-fdo-1.12.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.0.tar.xz.sums
+md5  ea62dfa9ecb366598a837d7446ed48ac  wpebackend-fdo-1.14.0.tar.xz
+sha1  1500be9212381a404f4a46b22b90a9880ba11c01  wpebackend-fdo-1.14.0.tar.xz
+sha256  e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155  wpebackend-fdo-1.14.0.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 2e2bdee94e..afe37b086e 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.12.1
+WPEBACKEND_FDO_VERSION = 1.14.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
