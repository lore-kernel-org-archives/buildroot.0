Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03E9C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 07:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786EF810B9;
	Mon, 12 Aug 2024 07:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0RebTGEoh6q; Mon, 12 Aug 2024 07:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AC7881161
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC7881161;
	Mon, 12 Aug 2024 07:34:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8AAC1BF484
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 07:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F1B810B9
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 07:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2L7McU15usL2 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 07:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34F3810C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C34F3810C1
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 07:34:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3196851A5; Mon, 12 Aug 2024 07:34:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 09:09:46 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5c10737191eeb79f48415025639466a0de93a552
X-Git-Newrev: 0c3e534b332c6d9d4a7c67e47f1546d39fed44c5
X-Patchwork-Hint: ignore
Message-Id: <20240812073401.B3196851A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bitcoin: bump to
 version 26.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c3e534b332c6d9d4a7c67e47f1546d39fed44c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

For change log since 26.0, see:
https://bitcoincore.org/en/releases/26.1/
https://bitcoincore.org/en/releases/26.2/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 88ab90e3092de7ce43a79e01e9a8cad8e7323047)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
