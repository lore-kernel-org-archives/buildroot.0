Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C04C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:24:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 605BB60F3A
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 605BB60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0762B401E8;
	Sun, 10 Oct 2021 20:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPpShTgiXg1U; Sun, 10 Oct 2021 20:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D443401D7;
	Sun, 10 Oct 2021 20:24:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04C791BF41E
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E62B040319
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUfpx8gCU_A0 for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 20:24:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D6ED40312
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 20:24:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 56ED695291; Sun, 10 Oct 2021 20:21:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 22:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ea0ae0349dfb905ba8c4a91d43882a12f73b123
X-Git-Newrev: ab683f97ae824bf7787d3f9b61c501af39e5b402
X-Patchwork-Hint: ignore
Message-Id: <20211010202125.56ED695291@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/triggerhappy: use git tag instead
 of hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab683f97ae824bf7787d3f9b61c501af39e5b402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use release/0.5.0 tag instead of commit hash so
http://autobuild.buildroot.org/stats will report package as up to date

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/triggerhappy/triggerhappy.hash | 2 +-
 package/triggerhappy/triggerhappy.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/triggerhappy/triggerhappy.hash b/package/triggerhappy/triggerhappy.hash
index ab736cada3..0bb53f9455 100644
--- a/package/triggerhappy/triggerhappy.hash
+++ b/package/triggerhappy/triggerhappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1b3221963b9adca26eacc5442d8c2422cf2072f8adde1dbd691a69b37a583fb1  triggerhappy-b822888066129350e51ad79f1cf307fa38dae4f7.tar.gz
+sha256  af0fc196202f2d35153be401769a9ad9107b5b6387146cfa8895ae9cafad631c  triggerhappy-0.5.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index f83a557804..bb30e7ce1d 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-TRIGGERHAPPY_VERSION = b822888066129350e51ad79f1cf307fa38dae4f7
-TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
+TRIGGERHAPPY_VERSION = 0.5.0
+TRIGGERHAPPY_SITE = \
+	$(call github,wertarbyte,triggerhappy,release/$(TRIGGERHAPPY_VERSION))
 TRIGGERHAPPY_LICENSE = GPL-3.0+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
 TRIGGERHAPPY_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
