Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 23:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06F940122;
	Wed, 22 Dec 2021 23:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u97AMZ7ZiJrz; Wed, 22 Dec 2021 23:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A08540356;
	Wed, 22 Dec 2021 23:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20FD51BF383
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 23:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 096F781B26
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 23:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKvUvW-jNg8l for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 23:18:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE9DA81B17
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wLYlm6OEpU7fSzVdN2wxDcZCYW7WUOQ+o6/Su3OdVD4=; b=aO0nnnz5sKiU3YHQj9HKHl+UoV
 zCaF0Kb5YhqUPU0hvNaMlW6wI2yZdbZZUqhitSReJ1xSXOXiD1Vlebv+yxFG40KTp81ovCCgTPRoQ
 QQVMpiDYwmtl5MT9eujhza8SLelwIQViYhQ7OzC4A1O+DEgDBkzFskegjLM6Qwy5FO/1b1c2m+DSp
 bLoy2hKZc/s2gzR+r5RSLze0zjdDbcGQee9Ti1rn8a74cR8l36IYXWLWiJs6KHa2hZm31pLaUpd2l
 yb2eS7QEXLjuX7BexJXQ5cx+yrNbFAWYcwKMBS9q9V6Kg1g4EiLAAi96C1RNVEXglykS7PmATo6xz
 RTnj385w==;
Received: from 91-153-34-209.elisa-laajakaista.fi ([91.153.34.209] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n0AsW-0005H1-D6; Thu, 23 Dec 2021 00:18:36 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 18f6f718;
 Wed, 22 Dec 2021 23:18:25 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 01:18:25 +0200
Message-Id: <20211222231825.798177-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.34.3
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

This is a minor release which provides fixes for CVE-2021-30887
and CVE-2021-30890. Full release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.34.3.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2021-0007.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index a71c1afc72..52652b72ae 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.2.tar.xz.sums
-md5  b26f07bc809d9fd3e54e815c22312f15  wpewebkit-2.34.2.tar.xz
-sha1  4200ef87a4e1eb1921f0f40779742381598e1429  wpewebkit-2.34.2.tar.xz
-sha256  b1a3733c2d486c4da27f9636ccc39947da7d84258cd7a24a6fb0b842c9595c0b  wpewebkit-2.34.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.34.3.tar.xz.sums
+md5  f8eb92825bf6477fb04ca017926c2458  wpewebkit-2.34.3.tar.xz
+sha1  a72f507dfd6d4d579b2e6c939d7c171c2cfb1d92  wpewebkit-2.34.3.tar.xz
+sha256  c35de4bfce35c81cbd6c1da27879b4ea33e20bd51d750ce296a4d100d45f40fc  wpewebkit-2.34.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 7d6b7692fd..2cbed60cb3 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.2
+WPEWEBKIT_VERSION = 2.34.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
