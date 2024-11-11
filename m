Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BE6D3ABC2
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CDCF402D2;
	Mon, 11 Nov 2024 15:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1l-bUw_kSELj; Mon, 11 Nov 2024 15:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF93D402DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF93D402DA;
	Mon, 11 Nov 2024 15:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DC896C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EE0A804F6
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQtr3kKceL6r for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53CDE80CC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53CDE80CC2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B5DA860AC; Mon, 11 Nov 2024 15:58:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 16:56:02 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2ea3cbc653712585a83e912158b7acbdcaa9f01e
X-Git-Newrev: fa022fc4dfb695b49d74ba1ae5d9eccc9a2e8680
X-Patchwork-Hint: ignore
Message-Id: <20241111155827.4B5DA860AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: package:
 bitcoin: fix test by increasing timeouts
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa022fc4dfb695b49d74ba1ae5d9eccc9a2e8680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Generating Bitcoins to an address can take longer than the current
timeout, on slow runners. This commit fixes this issue by increasing
the timeout on specific commands. This issue was also observed more
frequently on newer bitcoin-core version 28.0.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7782083081

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 859c4ea5f74f713777ffa980f1627b46a311bdd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_bitcoin.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index 93aa9383ab..1f00345a12 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -130,7 +130,7 @@ class TestBitcoin(infra.basetest.BRTest):
         # #1. We should receive the 50 BTC reward at this address.
         cmd = self.cli_cmd
         cmd += f" generatetoaddress {req_blk_count} {btc_addr1}"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=30)
 
         # We should now see the previously created blocks.
         cur_blk_cnt = self.get_block_count()
@@ -169,7 +169,7 @@ class TestBitcoin(infra.basetest.BRTest):
         # the previous transaction (but this will not give the 50 BTC
         # reward).
         cmd = f"{self.cli_cmd} generatetoaddress 1 {btc_addr2}"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=30)
 
         # We should see one more block.
         cur_blk_cnt = self.get_block_count()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
