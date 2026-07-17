Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE7DC4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA9F440A27;
	Fri, 17 Jul 2026 15:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89fLizqt99QO; Fri, 17 Jul 2026 15:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9EA40A70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303152;
	bh=6NgpSObdPbaGKg5xvGkZlG5yhAtAoynR95jYtp6Im08=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qJn4aQZ9jksJxWGOpXW6+Gkw97fcKSI41POwBq/UXGz2RtIrunpLcZkdWdummggpP
	 udtn036CvtmLbwGLmHaFG/wxm3wN0Qb2oKcfoo2zoMBxjjx1D2ArtWTyAvKpYEA2jQ
	 cGmpD/emcxg/Ex3vMi8jFlR0SsOL3pqaFXzzP72gL2eImmEsOTh5ApVkNSvXt3n0wr
	 woK/W25M2p05v9rS6ZEhFmg8boAchxIkZRO0yFL+y7Q2uj+4Wv+BmaThkbv+9Qx2/G
	 nBRYwAO2BKJ624ezMaDyy7BQQOSqZYkqR/D+zd25dfvAA6BQeAfmhv+L/WmzxG25bE
	 B/DDW+2442mpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9EA40A70;
	Fri, 17 Jul 2026 15:45:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0D6A58
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC367408F1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cbo8AvtQzCvv for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBABA409D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBABA409D5
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7F7588E52; Fri, 17 Jul 2026 15:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:00:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1c6739c282932a7bc5388ad4162c3a252cb00569
X-Git-Newrev: 138f03b86c1fffd1deff412e0bb4e4cd3c8c9053
X-Patchwork-Hint: ignore
Message-Id: <20260717154510.A7F7588E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/socat: security
 bump to version 1.8.1.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/138f03b86c1fffd1deff412e0bb4e4cd3c8c9053
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fixes CVE-2026-56123: SOCKS5 client buffer overflow. Only signed char
platforms are affected.

  http://www.dest-unreach.org/socat/CHANGES

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 760f471db1857bbd33f338d58a2501a69680f6f3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/socat/socat.hash | 4 ++--
 package/socat/socat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 3a4eec60c1..2fc8e40853 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,7 +1,7 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  5456f0f0c5d4505b68edcb10e23ef128  socat-1.8.1.1.tar.bz2
+md5  1a5b8ddff793847d80aa100d54b7cf76  socat-1.8.1.3.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b  socat-1.8.1.1.tar.bz2
+sha256  25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a6639b1fb602418  socat-1.8.1.3.tar.bz2
 # Locally calculated
 sha256  86e46422f9381b386bd2eb6606f9d6c3ff479f905660d0f318c571292ab304b8  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 3d40540599..311bdfda3a 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.1.1
+SOCAT_VERSION = 1.8.1.3
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
