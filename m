Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A07C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:58:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BB160FC0
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4BB160FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF5B400CD;
	Tue, 28 Sep 2021 20:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TI9FhNw-pnqn; Tue, 28 Sep 2021 20:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C02D0415B7;
	Tue, 28 Sep 2021 20:58:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD8A01BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC4D3405FB
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abBtZbCPELgp for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:58:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCA32405F8
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:58:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8AC9A8D472; Tue, 28 Sep 2021 20:56:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 22:50:31 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6726e6b7cfdc4a2540557054d1905741e1a822c0
X-Git-Newrev: 4ae616eaac47b082bae3e00c32c39a532fd366ab
X-Patchwork-Hint: ignore
Message-Id: <20210928205607.8AC9A8D472@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/containerd:
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ae616eaac47b082bae3e00c32c39a532fd366ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
 package/docker-containerd/docker-containerd.hash | 4 ++--
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index bb544e8d60..dc4f1f4913 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ac62c64664bf62fd44df0891c896eecdb6d93def3438271d7892dca75bc069d1  docker-containerd-1.4.4.tar.gz
-sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256  3bb9f54be022067847f5930d21ebbfe4e7a67f589d78930aa0ac713492c28bcc  docker-containerd-1.4.9.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index e229d9cb54..16026eb8e9 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.4.4
+DOCKER_CONTAINERD_VERSION = 1.4.9
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
