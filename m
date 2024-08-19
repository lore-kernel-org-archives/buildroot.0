Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A956DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C21680CDF;
	Mon, 19 Aug 2024 20:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fECYzTby2UYq; Mon, 19 Aug 2024 20:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D2D80CED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D2D80CED;
	Mon, 19 Aug 2024 20:11:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D60171BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3AB240257
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KBw-eBz04QV for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE88F40111
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE88F40111
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:11:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7A98860B6; Mon, 19 Aug 2024 20:11:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 22:10:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6877647e8aff18a697d49015dd6273a9886db17e
X-Git-Newrev: 3ba9ac62052c99d7557adf2bbad1bab0c5577a81
X-Patchwork-Hint: ignore
Message-Id: <20240819201115.A7A98860B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: security update to 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ba9ac62052c99d7557adf2bbad1bab0c5577a81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for complete changelogs:
https://botan.randombit.net/news.html#version-3-5-0-2024-07-08
https://botan.randombit.net/news.html#version-3-4-0-2024-04-08

CVE-2024-34702: Fix a DoS caused by excessive name constraints. (GH

CVE-2024-39312: Fix a name constraint processing error, where if
permitted and excluded rules both applied to a certificate, only the
permitted rules would be checked.

The License hash changed because the year was updated from 2023 to 2024.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/botan/botan.hash | 4 ++--
 package/botan/botan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 37e00ea9cc..d948271900 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  368f11f426f1205aedb9e9e32368a16535dc11bd60351066e6f6664ec36b85b9  Botan-3.3.0.tar.xz
+sha256  67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f  Botan-3.5.0.tar.xz
 # Locally computed
-sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
+sha256  db9168bdccaaea26557094436652577cc9bf43164e8be078d88aef1342fe4fb6  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index e0bd258f57..561e7bf702 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 3.3.0
+BOTAN_VERSION = 3.5.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
