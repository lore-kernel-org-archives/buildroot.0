Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C671C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 20:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3950960EC8;
	Thu, 11 Jul 2024 20:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esVEqxfD3Z_L; Thu, 11 Jul 2024 20:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659156089A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659156089A;
	Thu, 11 Jul 2024 20:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4671BF4E6
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 298E584011
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 20:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qadhg7tITq0k for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 20:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3E1E80C39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3E1E80C39
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3E1E80C39
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 20:19:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 31E94B00596;
 Thu, 11 Jul 2024 22:19:43 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 22:19:38 +0200
Message-ID: <20240711201938.887672-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720729188;
 bh=rLDd/aZgVz0PnF0etVyDuR0LdXbz6TYbCVk16dpZ+5w=;
 h=From:To:Cc:Subject:Date:From;
 b=gHj8qlhXvoymQ360/aPzVt+dzoIQmvI5jUVLygiDojS8tlyMFYBpXVT80Hl20/uwq
 UzHWHi6a/9EX0qwdZmDUQqVVxiKjnJKweg1cUolCrmy2L0i+/ODWxB33FNvVv4pf+X
 wW9icuXzBZBBcMkPs/FP3LkbzXYJduLEv2zh+gkJ/kzlTDWxvUKWhLwCPSSJI6sIIV
 W5DP5RwKJm9gEAPBBX24HUDz2rpgxjMOHYCl/HJb8PKKCPcPXT8IAQOHqZlOy2nj/f
 bJgqF8ggLE2TIpAux3Q6DNXkEX23T4x3u7U9s39T9xPeJG5wpyzcHULzr/YQCYgPbm
 odlikLgEElmoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gHj8qlhX
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: bump to version 26.2
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
Cc: Fabio Urquiza <fabiorush@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 26.0, see:
https://bitcoincore.org/en/releases/26.1/
https://bitcoincore.org/en/releases/26.2/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 60c8807 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p bitcoin
    ...
    6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_bitcoin
    ...
    OK
---
 package/bitcoin/bitcoin.hash | 6 +++---
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 6b3008af86..9bd0843085 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-26.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-26.2/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-26.0/SHA256SUMS.asc
-sha256  ab1d99276e28db62d1d9f3901e85ac358d7f1ebcb942d348a9c4e46f0fcdc0a1  bitcoin-26.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-26.2/SHA256SUMS.asc
+sha256  78d59418741f45cbdaa9bf20ebc49a5e95ff9f7172f72fc78d14307eaf341b3c  bitcoin-26.2.tar.gz
 
 # Hash for license file
 sha256  a6331cd1f889397adfc0c3b0535682a20950c6cf8e5c712e9997a15ce98324e1  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 2f8a1777a2..9ca29092ad 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 26.0
+BITCOIN_VERSION = 26.2
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
