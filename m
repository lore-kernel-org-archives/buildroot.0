Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2F8C433FE
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:04:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 987E761139
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 987E761139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F51E81006;
	Wed,  3 Nov 2021 22:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTBGCeCYRiC0; Wed,  3 Nov 2021 22:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D298E80F87;
	Wed,  3 Nov 2021 22:04:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5D7E1BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A521F40399
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COnLG_N3Tmpp for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:04:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D3CD40395
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:04:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DB4368A4FB; Wed,  3 Nov 2021 22:01:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 23:04:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 377aa3b117e5845322e0619ae20f37f1331ec19e
X-Git-Newrev: 2143a66cb6183b956e0e25908f67b5331991c1ed
X-Patchwork-Hint: ignore
Message-Id: <20211103220105.DB4368A4FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump to version 3.72
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2143a66cb6183b956e0e25908f67b5331991c1ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 3.72. This also fixes sporadic parallel build failures.

Fixes:
http://autobuild.buildroot.net/results/a5f/a5f8a126a42ab784c3b5ab375a8cd7cbf205d745/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f35e8f2e4a..3dc6cb185a 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_71_RTM/src/SHA256SUMS
-sha256  99acd315d9af35419cda4a6960f00a7d446bd231bd407174a7b07cb3dba0c253  nss-3.71.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_72_RTM/src/SHA256SUMS
+sha256  6ea60a9ff113e493ea2ab25f41ea75a9fbd10af7903f26f703dac8680732d02e  nss-3.72.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 83daf18e76..2d880d2336 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.71
+LIBNSS_VERSION = 3.72
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
