Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354DAECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 20:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEECB41740;
	Wed, 14 Sep 2022 20:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEECB41740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LtaqWDDhiylR; Wed, 14 Sep 2022 20:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63EEC41739;
	Wed, 14 Sep 2022 20:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EEC41739
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2E91C1148
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 20:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB81B40C51
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 20:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB81B40C51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWadJtSVFehA for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 20:13:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13EDD403E2
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 20:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13EDD403E2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F316083981; Wed, 14 Sep 2022 20:13:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 22:04:26 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5652dfab3496a465465096035b5de5dd83ab0403
X-Git-Newrev: 52d19b7c4d07619752589e60f37889883ad5879b
X-Patchwork-Hint: ignore
Message-Id: <20220914201355.F316083981@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/containerd:
 security bump to version 1.5.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=52d19b7c4d07619752589e60f37889883ad5879b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-31030: containerd CRI plugin: Host memory exhaustion through
  ExecSync

  A bug was found in containerd's CRI implementation where programs inside a
  container can cause the containerd daemon to consume memory without bound
  during invocation of the ExecSync API.  This can cause containerd to
  consume all available memory on the computer, denying service to other
  legitimate workloads.  Kubernetes and crictl can both be configured to use
  containerd's CRI implementation; ExecSync may be used when running probes
  or when executing processes via an "exec" facility.

https://github.com/containerd/containerd/security/advisories/GHSA-5ffw-gxpp-mxpf

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 3f5c9865e6..39d040016c 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  02b79d5e2b07b5e64cd28f1fe84395ee11eef95fc49fd923a9ab93022b148be6  containerd-1.5.11.tar.gz
+sha256  ac75e2a5552163c203f836f5e9feac349f78f7956e8da228c372a12554b1ee40  containerd-1.5.13.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index c405b75e81..5f91d089b8 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.11
+CONTAINERD_VERSION = 1.5.13
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
