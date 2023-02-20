Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62741C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 08:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC19981E5B;
	Mon, 20 Feb 2023 08:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC19981E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtKt-y3AwO7K; Mon, 20 Feb 2023 08:42:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A1CD81E65;
	Mon, 20 Feb 2023 08:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1CD81E65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0311BF3C6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 08:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D83D76077D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 08:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83D76077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9en64Tqdg9U for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 08:42:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8547A605AB
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8547A605AB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 08:42:44 +0000 (UTC)
Received: from 91-153-34-99.elisa-laajakaista.fi ([91.153.34.99] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pU1ku-008d5t-Is; Mon, 20 Feb 2023 09:42:40 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 26acf6ec;
 Mon, 20 Feb 2023 08:42:39 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:42:39 +0200
Message-Id: <20230220084239.3714786-1-aperez@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i/zCV9u2+qmGd+kv7quCOnlWG21TkZircoS3vc8CYcA=; b=XRHI4fXjb9mzhmmT/NzvgXWokM
 XVO6RbrX1K+HzfTTz9pnpQRvHCB478xIsl6t0Axvna+PD7ZqA0vzFCGQTDXxo06DDg4B4CJ3qYdT2
 AmDCtrL8Ocwy4r6jpsLdAjEuLqBr+dn/TEh21uvfFlUcjPVwu4wkX8jhuRhI55aVVNd75eJ0Zoy9w
 MPUASanQE75jRPyXO+jVlUecqfKm+cr7ntuxfFta9uNw1EmQdYNuM0MvQKgGS36Dm5gNbp2zAiB9x
 2Vt2qSA8XHuufK8g/NeFFmKqXfVHHFMea2mAnVe5I46gdDOydLTMzJmOzh2X4IhQM1ZdP4cL19gCy
 1/scRm3A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=XRHI4fXj
Subject: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.38.5
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

Bugfix release, fixes zero-day CVE-2023-23529 and includes a few build
and behaviour patches as well.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.5.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2023-0002.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index dcd082e045..0fa1018721 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.4.tar.xz.sums
-md5  1c947ef5b73049fc6c102c92013009bf  wpewebkit-2.38.4.tar.xz
-sha1  7fe9a7d98401256b0c9872f1c2b702e56840cbd3  wpewebkit-2.38.4.tar.xz
-sha256  8c1bc113ef151fb0be2640824d323bc755dc97295ab7a1bc05e7ec589937a07b  wpewebkit-2.38.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.5.tar.xz.sums
+md5  73f7abd0c1cc808032869f72602166e3  wpewebkit-2.38.5.tar.xz
+sha1  3f10a04758eeb349f63f841aff765dae25bcde1b  wpewebkit-2.38.5.tar.xz
+sha256  ff00fd3d0a4c6d551850a78a7dfe4883b6b7ebd93c5549e1121b2f43d3ac1661  wpewebkit-2.38.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index b9c2fef395..48e5c2f8cd 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.4
+WPEWEBKIT_VERSION = 2.38.5
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
