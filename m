Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58148C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0489B417CB;
	Wed, 15 Feb 2023 21:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0489B417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWu0nCUGYbkt; Wed, 15 Feb 2023 21:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F39F4417BC;
	Wed, 15 Feb 2023 21:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F39F4417BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 969F41BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DDCA81FC8
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DDCA81FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8P0hTI0sGS1i for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:39:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 931D781F8A
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 931D781F8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82A6585ECB; Wed, 15 Feb 2023 21:39:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:38:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d69ea9664f067e5660e13ddf65c52df46f2eca07
X-Git-Newrev: 3b361028e6302ee0b062674f0483845930e94ba7
X-Patchwork-Hint: ignore
Message-Id: <20230215213927.82A6585ECB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flannel: use the github helper
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b361028e6302ee0b062674f0483845930e94ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, flannel uses an ad-hoc github URL and a version-only tarball
name, even though we already had the github helper (introduced in 2013)
when flannel was introduced (in 2016).

Switch to the github helper, which allows us to get a properly named
tarball.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Geoff Levand <geoff@infradead.org>
Acked-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 6a0223a20f..bafc453097 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  v0.14.0.tar.gz
+sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  flannel-0.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 231cf90dfd..b4e2b2f777 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FLANNEL_VERSION = 0.14.0
-FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
-FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
+FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
