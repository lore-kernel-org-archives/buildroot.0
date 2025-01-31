Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBE3C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A3AC7046E;
	Fri, 28 Feb 2025 17:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wH7KzbOF3AR5; Fri, 28 Feb 2025 17:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 511447086A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 511447086A;
	Fri, 28 Feb 2025 17:07:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B4B68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3976C42EE2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvH0rcVLaCBH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C6B42966
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59C6B42966
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55FE4867B4; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 22:19:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8bbea605973cee2ef5c16b4865d9c745a775afe1
X-Git-Newrev: 9c2e146ca9a21f0de3c97981113a57c58c3a5bd5
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.55FE4867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/containerd: bump to
 version v2.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c2e146ca9a21f0de3c97981113a57c58c3a5bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Major release v1 -> v2.

Dropped patch as it is no longer necessary:
https://github.com/containerd/containerd/pull/8924

containerd-shim and containerd-shim-runc-v1 were removed.

https://github.com/containerd/containerd/releases/tag/v2.0.2

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index e3f8434192..4ec78897d9 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  393bfde8ca1766a0bca3441e18eddc3f5a5c8d97ef676bde0d6c9903e1b0ec0c  containerd-1.7.23-go2.tar.gz
+sha256  472747a7a6b360a0864bab0ee00a8a6f51da5795171e6a60ab17aa80cbd850a2  containerd-2.0.2-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 88b53caf51..ee07c22495 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,21 +4,19 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.23
+CONTAINERD_VERSION = 2.0.2
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
 CONTAINERD_CPE_ID_VENDOR = linuxfoundation
 
-CONTAINERD_GOMOD = github.com/containerd/containerd
+CONTAINERD_GOMOD = github.com/containerd/containerd/v2
 
 CONTAINERD_LDFLAGS = \
 	-X $(CONTAINERD_GOMOD)/version.Version=$(CONTAINERD_VERSION)
 
 CONTAINERD_BUILD_TARGETS = \
 	cmd/containerd \
-	cmd/containerd-shim \
-	cmd/containerd-shim-runc-v1 \
 	cmd/containerd-shim-runc-v2 \
 	cmd/ctr
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
