Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34186CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E6E385770;
	Tue,  9 Jun 2026 13:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjQuEF1Blh2B; Tue,  9 Jun 2026 13:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22FE085A9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010224;
	bh=2wpNkgYlyd3EHolRLlJRBY82Z1/LGem49yhtbNU6n5k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F3SvnLStGnYTEWWunlYTrh3Qix8C0gSs9cQT3sEIbBf7jS3gqS+fsBCzSnlXEe3GD
	 kxP51O3eSK5g89vT91aOGkqUfPmH9MVdaIEY5mFohDaOp1/Kgdg6O3w38TVLsz0iwV
	 jq4VE0Wz8mBiOeQYv7pjAN5HgDxyDP5ErJPIMw1Bd1XFryvj6PD+wop/Os+Del1mYg
	 lyDE3z3NjDvrMueW1GfKNhdl/S5uYXEimi9A2jelTKoX2ccc3g5hC/1r2q+7lvlFhI
	 dwRHD/MPVSEqa2e9etDm2TtlVmbfCbmK9D9DTPT1eZ52sNViVx9MTVeGT0KRf1rnoQ
	 l+wIryPsmcVOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22FE085A9C;
	Tue,  9 Jun 2026 13:03:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F023190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B512245D94
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YK2qGxVoukiJ for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 085B64595C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 085B64595C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4396387E68; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5c28aa439b6b4774efaaf02ef53a58481006996
X-Git-Newrev: 87b2b49d0016815d825115b12a9bac70e77dcd8a
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.4396387E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.124
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87b2b49d0016815d825115b12a9bac70e77dcd8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/4b5e60e1b567c823a2a9c3a218d7122868d3c4fb/doc/rst/releases/nss_3_124.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0f5ec9c8ee..4d08187fcb 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_1_RTM/src/SHA256SUMS
-sha256  42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0  nss-3.123.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_124_RTM/src/SHA256SUMS
+sha256  80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b  nss-3.124.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 29b15d8a16..94bb129ac7 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.123.1
+LIBNSS_VERSION = 3.124
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
