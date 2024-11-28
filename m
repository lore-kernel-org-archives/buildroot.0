Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB41D70DFA
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 00:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54DAA810B4;
	Fri, 29 Nov 2024 00:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvl1fZbFN8OH; Fri, 29 Nov 2024 00:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A936810C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A936810C2;
	Fri, 29 Nov 2024 00:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1739F71F
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 00:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AC05605DB
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 00:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEt7t4CndQeQ for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 00:00:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A14060600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A14060600
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A14060600
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 00:00:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B57CEB00535;
 Fri, 29 Nov 2024 00:59:59 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 29 Nov 2024 00:59:49 +0100
Message-ID: <20241128235949.2204076-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732838400;
 bh=Pmzgu+/vmtXHgNSjB+gsUpPHY04UBqxTmcbFs6rMFpQ=;
 h=From:To:Cc:Subject:Date:From;
 b=PyTi4hNkij+iCtObo9OwkG1JYrlmXTRXhD9acxBAPMzG5OZ1lTOSg8ymGK0ctWWEg
 7X/r/o30XP2z1Hezh13PYUkr36X1BZXgBd6q4xQIaOlgdQMyQu9REfzkxpXSo8iuyQ
 YlFyA8aU2W4knEDIRtJ4jyMU9IbERLR2kOdjcksqSoqYZR+Gh6kvFl0xZqJG+iS1S9
 Y/IwsjcBoKL+8I9mScyj8yhWVSl6z6sOvEjCce0ZjjKMV2gl6OhszTD5/BjULcdtur
 dfHSx4lhHtRZKR0cbslwj6DshgfGAGr+vhdQhh7NSlzslmPPq5ZE/Iz5cVHKvbUV5m
 Z/2EPjuf3w7Og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PyTi4hNk
Subject: [Buildroot] [PATCH next 1/1] package/fwts: bump to version 24.11.00
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2024-November/013934.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8499321413
---
 package/fwts/fwts.hash | 2 +-
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 6c9f9dc76b..0e913b3ae8 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  4f352dedd630217a3551bb4f6e8d61f8514be457d37b90c936c3b6cfb6a6fa7e  fwts-V24.09.00.tar.gz
+sha256  09dde69c6cd8e33177c37e06a9763f7d78271ad40e92f266157b739cfac8d185  fwts-V24.11.00.tar.gz
 
 # Hash for license file
 sha256  3cd2c5d12f024ff2aa203e37d7e972c4d5ab7bf1a65e3e09aebccf71e64b525b  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 91b5e613dc..fded1e696b 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 24.09.00
+FWTS_VERSION = 24.11.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
