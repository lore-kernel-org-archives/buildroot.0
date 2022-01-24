Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F61C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 14:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2F94404C9;
	Mon, 24 Jan 2022 14:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCzQo36Bp6mX; Mon, 24 Jan 2022 14:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC611400F2;
	Mon, 24 Jan 2022 14:02:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFC01BF3BB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 14:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBA52400F2
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 14:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u57CGTAXTlTD for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 14:02:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E39C400A9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wZDSGfv+5v5ihKJJULS/D7PHebwh9RR6rzKLxBMm2Po=; b=m/u7vr/eLBBjuDkcI8TMUEXznD
 OEbyvOjBQpwr0y7xPvBzNXtFKcs7l8OR16/NZEe5wX7Hb/0ACPDjk0JLbA9ys/2Yzg5+68AjN6l/2
 vjXljiT2ZRCfe6rKu6kXGga1Ro3xGyOw/8dogmo3mDAC1OQzq+hTh3trDTLbpvzf4Peijorx4mn9u
 CblM8lsExS/ohKr+IDU/H0P2LRWlC4cHVJWU5zzaVSBGUTpl7mn6NuJoJUdxtE9Bc8e0iLzXiaFfR
 7geiDGu01j5R9cR7Coqdsbi3dB53kgmgW56tO8iJIqlkAWCL8k2rZlRSJqGh8+M0pXRuUy1Au9qp1
 C+CjJIyQ==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nBzve-0001Dt-28; Mon, 24 Jan 2022 15:02:42 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 18917203;
 Mon, 24 Jan 2022 14:02:30 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 16:02:30 +0200
Message-Id: <20220124140230.1697395-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.34.4
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

This is a minor release which provides fixes for CVE-2021-30934,
CVE-2021-30936, CVE-2021-30951, CVE-2021-30952, CVE-2021-30953,
CVE-2021-30954, CVE-2021-30984, and the safarileaks.com vulnerability
(which has not yet been assigned a CVE number). Release notes can be
found at:

  https://wpewebkit.org/release/wpewebkit-2.34.4.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2022-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 52652b72ae..b863a0d705 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.3.tar.xz.sums
-md5  f8eb92825bf6477fb04ca017926c2458  wpewebkit-2.34.3.tar.xz
-sha1  a72f507dfd6d4d579b2e6c939d7c171c2cfb1d92  wpewebkit-2.34.3.tar.xz
-sha256  c35de4bfce35c81cbd6c1da27879b4ea33e20bd51d750ce296a4d100d45f40fc  wpewebkit-2.34.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.34.4.tar.xz.sums
+md5  b0f7dcb18acfa94cfb42fea0fe10fb0d  wpewebkit-2.34.4.tar.xz
+sha1  de58481b43a6dba054097f619ee486f7889d7a56  wpewebkit-2.34.4.tar.xz
+sha256  3653ba42dbe22a4e6751b3f7cab8d2ebb2db5b7654c5d135a2f9bedf94778cee  wpewebkit-2.34.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 2cbed60cb3..25b71f0f50 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.3
+WPEWEBKIT_VERSION = 2.34.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
