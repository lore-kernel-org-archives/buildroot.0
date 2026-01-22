Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10953D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 20:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C0F823C0;
	Thu, 22 Jan 2026 20:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtN2K1Gyr6VE; Thu, 22 Jan 2026 20:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1784981836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769112883;
	bh=ynBptBNdH4RLnFWckRUfAZ3noXDIDCGS7YTsucOQG0c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QxxXHCNVFvk1mjiQRNGuygi34j179DSvdkwTm8ALt+cA91cLTQvqRX5ajZfFVy4PL
	 BcYCfvFhnlCDOIgAatTlXaYjXWByse8tTooWrWLFx06S50DrcLMZYCH99sMlXgh+dJ
	 YodO8OwgTjDzGBkmPkhU30Tq9dOe4HYzrM3Qgfgn2m2c/cErkkJL6EU1jqx+RTrieQ
	 cFzj8z7wDWzTyEMHL/84lDaTw6hvI8bebfsDyx0wCZqSXW+CRFCWgRrPAiZrPrBlyO
	 D1Xs53lVjOxXYro1wicE5iZAT702Yr0M18rx5y6bC0ZlFiuc4p/JMU6rmEjIZ4ia+e
	 sgEjeiDeTylvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1784981836;
	Thu, 22 Jan 2026 20:14:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A96BF158
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9874940254
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuRUSEI_12q6 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 20:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36CC240217
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36CC240217
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2276C86A92; Thu, 22 Jan 2026 20:14:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:58:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98f359473e10aa1df067d19b0de050b8ee1e1160
X-Git-Newrev: 2089d0ff1ec1d19a37a503946bc80131b907f2b7
X-Patchwork-Hint: ignore
Message-Id: <20260122201438.2276C86A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.1.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2089d0ff1ec1d19a37a503946bc80131b907f2b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index ad742a3af1..a3a61f867f 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5cf57c66e22359d1ec07d766b04e5da43677b9330999ce0dbf686aac60cf6bb  intel-media-25.4.6.tar.gz
+sha256  b9bb6177a36c69a44d821062637b4bb69f7751e8a3be354e5402e1abdf93b96a  intel-media-26.1.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index a00525779e..c070a139c6 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.6
+INTEL_MEDIADRIVER_VERSION = 26.1.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
