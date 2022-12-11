Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D18BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344AF605D8;
	Sun, 11 Dec 2022 10:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344AF605D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HD4pLVEd64Td; Sun, 11 Dec 2022 10:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 749E0605A9;
	Sun, 11 Dec 2022 10:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749E0605A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C83E1BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 541DB40197
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 541DB40197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5gieB0GTjU8 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:39:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4177E400C1
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4177E400C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 300FA86028; Sun, 11 Dec 2022 10:39:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e744cc249030d0ded5c5bb445b9b4ac46e400957
X-Git-Newrev: b69acab54b6b258d83833c8f51b09ee0913e9a4d
X-Patchwork-Hint: ignore
Message-Id: <20221211103937.300FA86028@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/moby-buildkit: security bump to
 version 0.10.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b69acab54b6b258d83833c8f51b09ee0913e9a4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2022-39253: git vulnerability mitigation.

... and other bugfixes.

https://github.com/moby/buildkit/releases/tag/v0.10.6

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/moby-buildkit/moby-buildkit.hash | 2 +-
 package/moby-buildkit/moby-buildkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index cfd1c0c946..43ee1b12c9 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5877faf02cbddfb6c988f44b5b373739fed87f4aeb8802c6777fe7be2f772506  moby-buildkit-0.10.0.tar.gz
+sha256  5ffe5a2d11736719649dae962461f66df394ae4cc1e58294e5f2bd4d4632d9d0  moby-buildkit-0.10.6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 667383bf50..59d68a7dca 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBY_BUILDKIT_VERSION = 0.10.0
+MOBY_BUILDKIT_VERSION = 0.10.6
 MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
 MOBY_BUILDKIT_LICENSE = Apache-2.0
 MOBY_BUILDKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
