Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855F9CF6491
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 13:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2988121A;
	Sat, 28 Sep 2024 13:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE-NprDATGmf; Sat, 28 Sep 2024 13:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B2318121C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B2318121C;
	Sat, 28 Sep 2024 13:37:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5A491BF321
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 13:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA6C34023E
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 13:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOp7AhXLOf6U for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 13:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24A25400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A25400F8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24A25400F8
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 13:37:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B40EFB0054E;
 Sat, 28 Sep 2024 15:37:07 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Sep 2024 15:36:48 +0200
Message-ID: <20240928133648.523674-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727530630;
 bh=TKJkX1sKTK+4CN0yCGtwQbNZNkuS07pgx2hwF+FnMf0=;
 h=From:To:Cc:Subject:Date:From;
 b=cbFSsTp0KXgIS7easSk5ffAy1FDUx9PZAHsSBSQFDov2DVoBxQM36RE8T7nLfz2m9
 lX2xhOGTHiSQcSvyhy49hPBYmjdx+bW5fUmGHgJd6T7a/Qc3e2jzMV5IKGdd6Tg7rj
 X2AeFLCEt7W87k+BL40kB/Cf77+0LNxQBlT6x18jW/WwZZWlEsGiNsBlpRj6nIkbE0
 NhMZxUUCDvBp2fAoX24BTYfKGxJPCbB2+5fleBagAvWd58WDwbHKEqAM/i07nQRxal
 n8Yc2OPZofuDHIEt1dXBGgJBdCw7b+mH49RmQgcsbccjS94StJMtN780QYWnwuTElS
 vNCjavrigil3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cbFSsTp0
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 24.09.00
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2024-September/013906.html

This commit also update the commented hash source URL from http to
https, since it is now redirected.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch runtime tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7944511137
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 61f615835e..6c9f9dc76b 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
-# Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  2bd45ab1b9f8dc1db2716721e89d982ee4b4eda4b1043cca7b13775c95d5023b  fwts-V24.07.00.tar.gz
+# Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
+sha256  4f352dedd630217a3551bb4f6e8d61f8514be457d37b90c936c3b6cfb6a6fa7e  fwts-V24.09.00.tar.gz
 
 # Hash for license file
 sha256  3cd2c5d12f024ff2aa203e37d7e972c4d5ab7bf1a65e3e09aebccf71e64b525b  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index fa1f8ed8c4..91b5e613dc 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 24.07.00
+FWTS_VERSION = 24.09.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
