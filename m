Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EFFC25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 20:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0688427E;
	Thu, 30 May 2024 20:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSQFOcUsFQz6; Thu, 30 May 2024 20:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A56E8428E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A56E8428E;
	Thu, 30 May 2024 20:35:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8245A1D4ACF
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A3098428E
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XRVfdFh9RA2 for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 20:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCB398427E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCB398427E
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCB398427E
 for <buildroot@buildroot.org>; Thu, 30 May 2024 20:34:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CmUAsZTIm7AmWCmUAsHgyM; Thu, 30 May 2024 22:34:54 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 22:34:53 +0200
Message-Id: <20240530203453.1340735-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCeilkGm8DC14ne+1zNHbaw3+pMahOIOYxQu+TMLmKoEDqyEl8B6G4rtmiQ5cwoS2qnay8Yc98EVu6ENUwZykiWINTyhdhUfqB4IqEY1wqDF9QqA4xmS
 naqdRmm6AX5s79QtRuVpPoCNbMmkgVrchNm5QHSDjEFwyg8w+tMkJHhFLf2+ClnXz3nareDBAE0HLvTne7XOAT4BAcaJ/XuE+uWLoIU8Hmq1GVTX7qE1vy8Z
 zNnNDnoEPatRhf12yEPNVlHEZtIUHnocqzxafdkqE0g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1717101294; bh=bOG/VYodT24lu7obRKDQWDHC+Skv/yLolT56nqH6Xvg=;
 h=From:To:Subject:Date:MIME-Version;
 b=icrlXcEPI9dMVJnxAV+1pqp3ISkwKHtoJbF0PY/5XYaWXwiMXjdm+VDE7CL1uTxmj
 eTqYozjtF3Hw7muUu8JhnmpTdRRZId6UgIrRCPtpGi/WOIapsIylhRWG3BBKo++BmF
 ffNdgRFrOMUk5/scDUPJcsJhNM4i1ekMMpENNF5tUwNmNxjgeq0Z3zTibgT50+RVQc
 +LrdRzh67SsY8LDvW9y7W8OSsQ2yx0rt/l6MhwYZMPXGTcaNajBtFM+mZqLxbD0KGm
 FFT6o4bww5BTPEejvgjZE9rcYGFd35GcOG/cciB9jeWUiAaapv/M8m6rjwAO69Xn/H
 vQpNfO5MYdwnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=icrlXcEP
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2024.05
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 19ef3a2724..13964351f6 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  89ec8926d66627255fe689ed96ad8d30f5c539315956dacf9890e308095dee3b  swupdate-2023.12.1.tar.gz
+sha256  c8af1e964d0123a7d4bbba981170eff723db87dcd37e5881c584ffee54194d1a  swupdate-2024.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 467e4f22ea..b36aabb1e7 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2023.12.1
+SWUPDATE_VERSION = 2024.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
