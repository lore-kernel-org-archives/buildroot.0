Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D7BECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 20:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E0E38275C;
	Wed, 14 Sep 2022 20:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E0E38275C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFA8a82hufmH; Wed, 14 Sep 2022 20:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2035982741;
	Wed, 14 Sep 2022 20:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2035982741
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3DAF1BF28A
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 20:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA3F40C97
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 20:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA3F40C97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTZN-cwHJ86y for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 20:14:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C10D440C51
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 20:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10D440C51
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AEFB283999; Wed, 14 Sep 2022 20:14:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 21:12:57 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6cd658d0c04d3273ee7c8376c13f6e10219a6c6f
X-Git-Newrev: e39aced8fd35c3abea58723aaca816dc091edafa
X-Patchwork-Hint: ignore
Message-Id: <20220914201444.AEFB283999@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/containerd:
 security bump to 1.6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=e39aced8fd35c3abea58723aaca816dc091edafa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

v1.6.2 -> v1.6.6:

The third patch release for containerd 1.6 includes various fixes and updates.

https://github.com/containerd/containerd/releases/tag/v1.6.3

The fourth patch release for containerd 1.6 includes two fixes for CNI and SELinux.

https://github.com/containerd/containerd/releases/tag/v1.6.4

The fifth patch release for containerd 1.6 includes a few fixes.

https://github.com/containerd/containerd/releases/tag/v1.6.5

The sixth patch release for containerd 1.6 includes a fix for
CVE-2022-31030.

https://github.com/containerd/containerd/releases/tag/v1.6.6

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7e7ae463d177ac6f3a9b0d22d3c34cd81a867d39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index eb9f2894a9..c0c926f2e4 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  4ea21a6b4649512366e7c31ae547ad89c6a69c6586a6d8565cff07898de344b0  containerd-1.6.2.tar.gz
+sha256  27afb673c20d53aa5c31aec07b38eb7e4dc911e7e1f0c76fac9513bbf070bd24  containerd-1.6.6.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 36f2db4125..80952914e6 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.2
+CONTAINERD_VERSION = 1.6.6
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
