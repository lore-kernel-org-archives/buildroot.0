Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132CDC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 15:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8135402CD;
	Tue, 23 Jul 2024 15:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TR2nfr-SGcLo; Tue, 23 Jul 2024 15:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E714014D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E714014D;
	Tue, 23 Jul 2024 15:14:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B08C31BF2A7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA41E80E66
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qApBhmD9twG for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 15:14:37 +0000 (UTC)
X-Greylist: delayed 637 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Jul 2024 15:14:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A5F680CE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5F680CE5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.71.1.221;
 helo=relay-b01.edpnet.be; envelope-from=dev.kurt@vandijck-laurijssen.be;
 receiver=<UNKNOWN> 
Received: from relay-b01.edpnet.be (relay-b01.edpnet.be [212.71.1.221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A5F680CE5
 for <buildroot@busybox.net>; Tue, 23 Jul 2024 15:14:37 +0000 (UTC)
X-ASG-Debug-ID: 1721747036-2392345cc339975e0001-A1ldta
Received: from srv21.vandijck-laurijssen.be (77.109.96.193.adsl.dyn.edpnet.net
 [77.109.96.193]) by relay-b01.edpnet.be with ESMTP id df9BZfWfrzjBExDY for
 <buildroot@busybox.net>; Tue, 23 Jul 2024 17:03:56 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Apparent-Source-IP: 77.109.96.193
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be
 [IPv6:fd01::1a1d:eaff:fe02:d339])
 by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 539335DEC9F;
 Tue, 23 Jul 2024 17:03:56 +0200 (CEST)
To: buildroot@busybox.net
Date: Tue, 23 Jul 2024 17:03:47 +0200
X-ASG-Orig-Subj: [PATCH] nilfs-utils: bump to 2.2.11
Message-ID: <20240723150347.9498-1-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Barracuda-Connect: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Start-Time: 1721747036
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1562
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 1.00
X-Barracuda-Spam-Status: No, SCORE=1.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_RULE_7582B
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.128022
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.50 BSF_RULE7568M          Custom Rule 7568M
 0.50 BSF_RULE_7582B         Custom Rule 7582B
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=vandijck-laurijssen.be; s=default; t=1721747036;
 bh=wGUa8u26NraSZdbangjM3Lfn8QX9GgrWlQq5u+jLilU=;
 h=From:To:Cc:Subject:Date:From;
 b=cFoWGTT4v32FHxMTvcAJbgDFFY+3BwTnK8wEaB9wele5MtyCMd+d2304dqng8QdyP
 DHR7JyPKjY9OT6PoTR/STi9SfD6Hhfpl9YwSh34ILh5ulQKXJ4XVRP5v8Gxrh0pQds
 1aPDCH6hh0BQHMNr5nW3LHHrHdfM+m/CrkkvJDKGcEJz7GrHapUAxzq4QloFnAhSwR
 h5a1JdeuNDhqWMPG7CWIjt4vQKwAFE9hX3N/heLozvReuOcMYnPDUS8KU9JBlleSM2
 zQUKmeCIm77b1K11QMbbMG/a9n0/8TUbPXGotIrBZntE2NtSPrqnIIMGWCGdwRQF/w
 TnPkIvpuf9zXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=vandijck-laurijssen.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be
 header.a=rsa-sha256 header.s=default header.b=cFoWGTT4
Subject: [Buildroot] [PATCH] nilfs-utils: bump to 2.2.11
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
From: Kurt Van Dijck via buildroot <buildroot@buildroot.org>
Reply-To: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/nilfs-utils/nilfs-utils.hash | 2 +-
 package/nilfs-utils/nilfs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
index ec71751b00..750243216f 100644
--- a/package/nilfs-utils/nilfs-utils.hash
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha512  dd8ab20ee0d6750a6d81f86fe4d1ad94a8a71aa53ee7cd38550ea32fffcc9527db1c75d34f732f0f8f6379a808249f8eec2619e54c595566a3fc434a87d9e66d  nilfs-utils-2.2.9.tar.bz2
+sha512  8c238f961f429c12674695d2481202c8fac4582d04e838ce7244647b8a9997e38b4dafa280314acb57ae40137711c7678de6aaf65708c110028df97c1c76089e  nilfs-utils-2.2.11.tar.bz2
 sha512  4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index 9f9bd091c3..1c8b7e245c 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NILFS_UTILS_VERSION = 2.2.9
+NILFS_UTILS_VERSION = 2.2.11
 NILFS_UTILS_SOURCE = nilfs-utils-$(NILFS_UTILS_VERSION).tar.bz2
 NILFS_UTILS_SITE = https://nilfs.sourceforge.io/download
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
