Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA48FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC0860FBF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DC0860FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC3D82EA5;
	Tue, 28 Sep 2021 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYBZ3kezZnp2; Tue, 28 Sep 2021 20:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649A382EAD;
	Tue, 28 Sep 2021 20:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0CCD1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED7F041582
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PgQlaazjt-I for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:58:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F5CB40765
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:58:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CAE918D478; Tue, 28 Sep 2021 20:56:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 22:41:05 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 5792946eb9baf02fdf3d2743a08d6eb8a19100e4
X-Git-Newrev: 5ebb5c36c9ca6efce4b5b765c6cd5274c601272d
X-Patchwork-Hint: ignore
Message-Id: <20210928205618.CAE918D478@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/containerd:
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ebb5c36c9ca6efce4b5b765c6cd5274c601272d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
