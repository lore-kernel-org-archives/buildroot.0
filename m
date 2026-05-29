Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9733ACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 567CF80C13;
	Fri, 29 May 2026 16:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8cIQoqnBTDn; Fri, 29 May 2026 16:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E28E80C1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071870;
	bh=HsW6bdyApL/J3CW5GR+Hxoy2tUU2yV1aFEXgfNwLq9U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zh2B2SeAYEt1KNN1K/uPtVjXxEjJq3+YV/XIAqgHo5/cwufa0h1LxHpf1gSuTJO4l
	 fC/VeRxoydoh3g3IH+upZAtq/igBoYiJmZRgL43Ru+EtoWtWqO1S01A7ts2qUqRq2m
	 88sOBrC13mXW98ugMEi1LQ0qxKlTNR3MyKgufx/VCaPZo2LPoiVs+jcLShLaV4cJ30
	 6dTmnUVcLlj2x6OKBvs7D5I34KRT6KEebvhp5/j44OG5PaOYtzVu7WoASbtH8p1otE
	 BzgKgU1IktBo3VL9bKZRqo2Hw3w6XLaKErz3VT8sfGiOoul69Ac3vQOgMM0e5MhumA
	 xUqAcqY/OUxUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E28E80C1C;
	Fri, 29 May 2026 16:24:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11991F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E3296151E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBwmdoNodoCH for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 359256150F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 359256150F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:24:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81504873F4; Fri, 29 May 2026 16:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:24:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d5c28aa439b6b4774efaaf02ef53a58481006996
X-Git-Newrev: 87b2b49d0016815d825115b12a9bac70e77dcd8a
X-Patchwork-Hint: ignore
Message-Id: <20260529162416.81504873F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnss: bump version
 to 3.124
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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
