Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EB1C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9BC0417FF;
	Mon, 10 Apr 2023 21:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9BC0417FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20YamYKuG1VI; Mon, 10 Apr 2023 21:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB31417C9;
	Mon, 10 Apr 2023 21:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB31417C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCDF21BF5A5
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 972CF81EA9
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 972CF81EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HhNE_ehaK5Bf for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:11:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B22A981F93
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B22A981F93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F23983E3A; Mon, 10 Apr 2023 21:11:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 23:09:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c7e1df73c26436902e1662dd37973afb6cb5b6df
X-Git-Newrev: f002280e73fded677b1d7476f928d1bc0ee56359
X-Patchwork-Hint: ignore
Message-Id: <20230410211119.9F23983E3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/containerd:
 security bump to version 1.5.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=f002280e73fded677b1d7476f928d1bc0ee56359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2023-25153: Fix OCI image importer memory exhaustion
  https://github.com/containerd/containerd/security/advisories/GHSA-259w-8hf6-59c2

- CVE-2023-25173: Fix supplementary groups not being set up properly
  https://github.com/containerd/containerd/security/advisories/GHSA-hmfx-3pcx-653p

https://github.com/containerd/containerd/releases/tag/v1.5.18

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index ced95f2aff..007a42e7b1 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  d14c703ea6d60a45ef2db8f2275ddae6a3538305117c7813fa24dcf12f4b7d85  containerd-1.5.16.tar.gz
+sha256  489ee6b179bf2f0d7f7ac23da4973081cfc95db45231d3fd1e34f7adebe4573b  containerd-1.5.18.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index aa5e89df03..3b5eab9e68 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.16
+CONTAINERD_VERSION = 1.5.18
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
