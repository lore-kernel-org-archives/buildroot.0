Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17527C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACEB6103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DACEB6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B36E640312;
	Sun, 26 Sep 2021 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nSLuKiv2VC4; Sun, 26 Sep 2021 21:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 065C3402D3;
	Sun, 26 Sep 2021 21:45:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E97B1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12DA240246
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LWqtWvvWtce for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C8B402D3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 618068D309; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:06:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d206c4279b51b7ecb2bd61d0ceaa88fb8dc9488f
X-Git-Newrev: 1a7be12e1e10cc09e3a28a8d04a352bbbb63ba3a
X-Patchwork-Hint: ignore
Message-Id: <20210926214229.618068D309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: bump version to 1.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a7be12e1e10cc09e3a28a8d04a352bbbb63ba3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Changelog (since 1.17, from [1]):

  ver 1.18:
    Add support for Access Point FILS IP Address Assignment IE.
    Add support for P2P GO-side 4-way handshake IP allocation.
    Add support for forcing SAE group 19 if BSS requires it.
    Fix issue with handling faulty SAE duplicate commits.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 9bd8f9c252..7c010ed891 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7  iwd-1.17.tar.xz
+sha256  0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55  iwd-1.18.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 58535b1aa1..96bdc56e93 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.17
+IWD_VERSION = 1.18
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
