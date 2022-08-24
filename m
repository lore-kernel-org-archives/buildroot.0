Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07DFC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 12:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22BF741694;
	Wed, 24 Aug 2022 12:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22BF741694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id btGhQeJ39kyA; Wed, 24 Aug 2022 12:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E99674167B;
	Wed, 24 Aug 2022 12:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E99674167B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE9F1BF29A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 12:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 442114167B
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 12:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442114167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkfFV0LT_Hbt for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 12:26:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1872041678
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1872041678
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:16 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oQpSX-00HE4w-4i; Wed, 24 Aug 2022 14:26:13 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cbf8f55e;
 Wed, 24 Aug 2022 12:26:01 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 15:26:01 +0300
Message-Id: <20220824122601.266641-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FOb8J0/wkF1XULgYvfAhl0zlWTRHeLhHOGEyhKqrodc=; b=C+k7KqtQw3x9Jw07iU46NOjLja
 6y8rOGCz3ibzrZWoIOXANN769Kt1jQFyo/yFyvrYUVtj8JrCRheRuCYbpBd5B8wA7wEb6dcJYJOO/
 8t8Zo+TCVL6h4cXg/Kw09bIpXHXfWDkd1Ns4A4dCXQLaeSXGUFRaOQlTlbji47fvb/GZmXQ5fEiMy
 M8+Vi0Tk9hB/6/w3ONiXy6PAZSEMaqMMyXtNtBSymk1ycvomue76NRx+F8TVzL9NZCcABFWGmhSvC
 DoS2OSQG6UkCUdl2SDAz7v9EjrghiggYn7gvtpM0UaYf1cCLhgz8w6P3Rkjnl1/caAYxGj5uQAluv
 0/CNMZXw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=C+k7KqtQ
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.12.1
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

This minor release fixes a crash. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.12.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 06289900b0..49c60fce0f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.12.0.tar.xz.sums
-md5  c43b34a4b4933bcd80068ae5776ee346  wpebackend-fdo-1.12.0.tar.xz
-sha1  e2576d564bd6d9a86737a4cd31dd5827ebc00fdf  wpebackend-fdo-1.12.0.tar.xz
-sha256  6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac  wpebackend-fdo-1.12.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.12.1.tar.xz.sums
+md5  494f4a5b2bd89dacef37b69534b2e1ce  wpebackend-fdo-1.12.1.tar.xz
+sha1  72a85e4615e085926f7ad8fc8414f9c6a878ef28  wpebackend-fdo-1.12.1.tar.xz
+sha256  45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629  wpebackend-fdo-1.12.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 5fe9c5397f..2e2bdee94e 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.12.0
+WPEBACKEND_FDO_VERSION = 1.12.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
