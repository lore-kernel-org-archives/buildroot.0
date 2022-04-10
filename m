Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5661BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 160B683EB2;
	Sun, 10 Apr 2022 15:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tF5kWa68mbeq; Sun, 10 Apr 2022 15:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3221783E82;
	Sun, 10 Apr 2022 15:39:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5065A1BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FDEB600B3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0pDxvUTDzf7 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA32F6059E
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D1E8B8388A; Sun, 10 Apr 2022 15:29:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:37:07 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a2876878c4f26ddd5c9f8303ddb91bd5358ab9df
X-Git-Newrev: 389fc65931fb296c2779cf7486e4a3000ba53cb9
X-Patchwork-Hint: ignore
Message-Id: <20220410152900.D1E8B8388A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/containerd:
 security bump to version 1.5.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=389fc65931fb296c2779cf7486e4a3000ba53cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-23648: containerd CRI plugin: Insecure handling of image volumes
  https://github.com/containerd/containerd/security/advisories/GHSA-crp2-qrr5-8pq7

- CVE-2022-24769: Default inheritable capabilities for linux container
  should be empty
  https://github.com/containerd/containerd/security/advisories/GHSA-c9cp-9c75-9v8c

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2642edb0af08f04fb98f4cb5f88895faded4b325)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index d5aafe2e70..23dacded88 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  40c9767af3e87f2c36adf2f563f0a8374e80b30bd2b7aa80058c85912406cef4  containerd-1.5.9.tar.gz
+sha256  6a289406c1c0583763e5a9754e31a1eced55cd5f162a7bc2a3a315d5eb05c7a1  containerd-1.5.11.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 8976e12f1a..c405b75e81 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.9
+CONTAINERD_VERSION = 1.5.11
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
