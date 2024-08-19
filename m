Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F0AC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A982380EC7;
	Mon, 19 Aug 2024 20:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDZcKYhVmJ8r; Mon, 19 Aug 2024 20:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA4EE80F9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA4EE80F9E;
	Mon, 19 Aug 2024 20:38:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F69D1BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C4E1404F7
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_ZzbxpFQuDk for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ABB0404EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ABB0404EE
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F15C860F6; Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 22:38:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c487171734fc537343571b2cadcd630ac2b09cb
X-Git-Newrev: 9f565397d83e7940b093fe09f749570225d7a283
X-Patchwork-Hint: ignore
Message-Id: <20240819203850.0F15C860F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: bump to final 1.4.0
 release
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f565397d83e7940b093fe09f749570225d7a283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit is suitable for master because:

$ git log --format=oneline v1.4.0-rc2..v1.4.0
eace095b15eb034e42d97202cad70ce979d8ca38 VERSION: Update version to 1.4.0
30c85a62c1abe07d57d5a7b523ef62c2c5b825c9 doc: Release notes for version 1.4.0
e4e0fd0d8232260af052fde52a9fb636181b2e2e meson: Fix project name as flashrom

And it looks nicer to have a final 1.4.0 release than a 1.4.0-rc2
release candidate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flashrom/flashrom.hash | 2 +-
 package/flashrom/flashrom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index cecec5273f..17ebdee3af 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  318c54a4143a1a05b30cecd64fbff41a0f5cd35a020622864c11fb44f8ed04d4  flashrom-1.4.0-rc2.tar.gz
+sha256  b77ce458b3b874387270a71805e899ac63f057d7553dc320da7e4c58e750577c  flashrom-1.4.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 2ef9f4d1b7..4eede48e03 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.4.0-rc2
+FLASHROM_VERSION = 1.4.0
 FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
