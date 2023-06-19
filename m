Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765EAEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20852405ED;
	Mon, 19 Jun 2023 19:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20852405ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZMFnGzGhdOV; Mon, 19 Jun 2023 19:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 342C541583;
	Mon, 19 Jun 2023 19:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342C541583
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 602351BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DA4410BE
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45DA4410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwkSIELYtart for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D700410A3
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D700410A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AF9E842C1; Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 21:36:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa1d011a05c526c06b27edd388378e255b2f055c
X-Git-Newrev: 0afcfe5a48bd0cb33b1431bb92a5b43ba1109270
X-Patchwork-Hint: ignore
Message-Id: <20230619193706.1AF9E842C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: security bump to version
 1.19.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0afcfe5a48bd0cb33b1431bb92a5b43ba1109270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2023-32067: High.  0-byte UDP payload causes Denial of Service
- CVE-2023-31147 Moderate.  Insufficient randomness in generation of DNS
  query IDs
- CVE-2023-31130.  Moderate.  Buffer Underwrite in ares_inet_net_pton()
- CVE-2023-31124.  Low.  AutoTools does not set CARES_RANDOM_FILE during
  cross compilation

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index edf891674b..3e1573f2cf 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  bfceba37e23fd531293829002cac0401ef49a6dc55923f7f92236585b7ad1dd3  c-ares-1.19.0.tar.gz
+sha256  321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e  c-ares-1.19.1.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 4332fc6919..46b8acd673 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.19.0
+C_ARES_VERSION = 1.19.1
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
