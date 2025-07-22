Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B28C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2402A60E0C;
	Tue, 22 Jul 2025 17:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wxs0zBWo2wGf; Tue, 22 Jul 2025 17:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C334460F03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C334460F03;
	Tue, 22 Jul 2025 17:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AE4CD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E8CC40716
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXhwIOIGknbk for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8161D409E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8161D409E4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8161D409E4
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:59:06 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3C672B0054E;
 Tue, 22 Jul 2025 19:59:03 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Jul 2025 19:58:58 +0200
Message-ID: <20250722175858.2860511-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753207144;
 bh=G3ReDC3M8eTw/BMwiU8hHAvmuxTUZqkBA9vJlirmUzA=;
 h=From:To:Cc:Subject:Date:From;
 b=RPNtGQOUi7o49jL6kBNirWRnkvS0Fjm3qcNxrVYHpU5Uwfz68IuOkKLiDeC15051b
 wFG69yqDDSqWScNBvoIPszhyMfYrzBHH3hcNSEuuQWCcf5W45dYYB1CEoUFymB3v9I
 dDhyeIyRJ45GEdQjq1w16dAKdBtzBYtlryfpDWoPbFUJZJVFIbnnf6nWSiKVsifr3d
 x+qEv+tYuNd5GOPkkI74bVncfH+7Xts2pEWE9kyFpEBf2F1fEcvasqKakiG+b2HdPL
 fVGnVGTUL69dyQKLSImbKdSHrCunxD/CMIBNztvQSvmg3oM8F0NWOiauOX078pbWEQ
 9pJjKGf6pXtAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RPNtGQOU
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.15.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 4.15.1, see:
https://github.com/Z3Prover/z3/blob/z3-4.15.2/RELEASE_NOTES.md#version-4152

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index a6a421b4e7..a9d1da901a 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ebf6eed5f2cb217d62abddaa94526189ae40bf3c415fb9c2e2128e099f16fda0  z3-4.15.1.tar.gz
+sha256  3486bf5b35b185981cab0b0a81f870547648a1ca433085aa79afd17c44959751  z3-4.15.2.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 22947e93cc..fe52167e1e 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.15.1
+Z3_VERSION = 4.15.2
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
