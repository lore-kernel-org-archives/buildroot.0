Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE84D39011
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC0F401A1;
	Wed, 14 Jan 2026 20:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejE1jUYAIH1X; Wed, 14 Jan 2026 20:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E749240B27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768421462;
	bh=/tT/y8Fluag//IO7LYq7wxizagWH/8uoF8pddZfjnCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BR3A8kW8i0Ygft/ZBmd6pXgIpJNVfOSI3yrS1T+/fRUEsANWoLmZBeVfExYqyyo3P
	 e04y/60fp6do7PpY01bFtrvRq+PNfTFGDla+0jf6EF0oKQY4JGemH+0rTeOgZSERmJ
	 yyNmMVKYV8lngcwTILYTrGX5sGZMAOS3nN5fMDy08AGglEWTiknQ9mIbaew7n2s0td
	 Q1IaIjJ9x9uBvBln8i52Smk9fWpl1j0yERizUxOsOC36GfhCWdYMklXJ/XVyknkSoe
	 9++6MXLNtPyxXOclDOIqpPXYPFXlc2Z/URZ2XENJK0+rLSZ5xlWCC5AELptz8jIWwL
	 CmmRUIXm3qwjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E749240B27;
	Wed, 14 Jan 2026 20:11:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C1B01C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFDCB60BD2
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B158crx7ox2L for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3AF60BD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE3AF60BD1
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:10:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCB8A884AF; Wed, 14 Jan 2026 20:10:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:58:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63a49b514d9077aab7416bbc7e9d62604f462e3b
X-Git-Newrev: 2f4d619a4ca82f8c179f083f44895888b5880b97
X-Patchwork-Hint: ignore
Message-Id: <20260114201058.CCB8A884AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: bump to version 30.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f4d619a4ca82f8c179f083f44895888b5880b97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://bitcoincore.org/en/releases/30.2/

Note: this version fixes an important wallet migration bug present in
version 30.0 and 30.1. See:
https://bitcoincore.org/en/2026/01/05/wallet-migration-bug/

Updated license hash due to copyright year bump:
https://github.com/bitcoin/bitcoin/commit/ed0774bd08b83813f162be33672b7d6c7fff9933

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add note about wallet migration bug]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bitcoin/bitcoin.hash | 8 ++++----
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 4f4061ed77..89fe6ce280 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS.asc
-sha256  9b472a4d51dfed9aa9d0ded2cb8c7bcb9267f8439a23a98f36eb509c1a5e6974  bitcoin-30.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS.asc
+sha256  6fd00b8c42883d5c963901ad4109a35be1e5ec5c2dc763018c166c21a06c84cb  bitcoin-30.2.tar.gz
 
 # Hash for license file
-sha256  7c4a87f43afaf667b4c2187af92ebdd27310a24cec113f973e058e3300a76002  COPYING
+sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index e23ef45050..89dacaf9c7 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 30.0
+BITCOIN_VERSION = 30.2
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
