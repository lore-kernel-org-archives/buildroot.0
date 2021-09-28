Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1A1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:58:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB4560FC0
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAB4560FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33B382E1A;
	Tue, 28 Sep 2021 20:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZJZFwqBJPKx; Tue, 28 Sep 2021 20:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 394B082DD9;
	Tue, 28 Sep 2021 20:58:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3971BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F8C0401B8
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LMpqtxWHjLT for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:58:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 990334017C
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:58:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B6A08D475; Tue, 28 Sep 2021 20:56:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 22:42:27 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 18f6da3eeac9257e6391afcb3c66c51baa3616ff
X-Git-Newrev: cc01ef612c95711910092e64389ac55dabdd9b23
X-Patchwork-Hint: ignore
Message-Id: <20210928205612.6B6A08D475@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/containerd:
 security bump to version 1.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc01ef612c95711910092e64389ac55dabdd9b23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- Fix CVE-2021-32760:
  https://github.com/containerd/containerd/security/advisories/GHSA-c72p-9xmj-rx3w
- Update indentation in hash file (two spaces)

https://github.com/containerd/containerd/releases/tag/v1.4.9
https://github.com/containerd/containerd/releases/tag/v1.4.8
https://github.com/containerd/containerd/releases/tag/v1.4.7
https://github.com/containerd/containerd/releases/tag/v1.4.6
https://github.com/containerd/containerd/releases/tag/v1.4.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 90f175045a00a0960753be85ad7964ad639212aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 4 ++--
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index b3cb3e47ad..eb0bafff1b 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ac62c64664bf62fd44df0891c896eecdb6d93def3438271d7892dca75bc069d1  containerd-1.4.4.tar.gz
-sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256  3bb9f54be022067847f5930d21ebbfe4e7a67f589d78930aa0ac713492c28bcc  containerd-1.4.9.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 761e08003c..eb5da65433 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.4.4
+CONTAINERD_VERSION = 1.4.9
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
