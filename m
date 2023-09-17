Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D42CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB20B40488;
	Sun, 17 Sep 2023 19:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB20B40488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ozuun_C-f2P; Sun, 17 Sep 2023 19:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBDA14053E;
	Sun, 17 Sep 2023 19:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBDA14053E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 371BC1BF2C6
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E5A1405CE
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E5A1405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5K7GdBp15UT for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:39:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA1D7405B7
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1D7405B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9295B872B2; Sun, 17 Sep 2023 19:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 21:34:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ce33fed49aea319da556eab388211a705afe7d0
X-Git-Newrev: 47cbcb70d078ffbc0fbd2d0179d35d9e3ee304ff
X-Patchwork-Hint: ignore
Message-Id: <20230917193954.9295B872B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: bump to version 1.7.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=47cbcb70d078ffbc0fbd2d0179d35d9e3ee304ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfixes and updates.

Containerd v1.7.x comes with new features including container sandboxing.

https://github.com/containerd/containerd/releases/tag/v1.7.6

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 8404675e30..d5e0ef4517 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b109aceacc814d7a637ed94ba5ade829cd2642841d03e06971ef124fa3b86899  containerd-1.6.22.tar.gz
+sha256  084a62f78f96cb5fda02221425f14df09d3e0acd093e4d4b3527900e3ff94677  containerd-1.7.6.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index c4a6d854c3..0591400709 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.22
+CONTAINERD_VERSION = 1.7.6
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
