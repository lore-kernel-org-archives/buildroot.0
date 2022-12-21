Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997FBC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 14:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C845417BB;
	Wed, 21 Dec 2022 14:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C845417BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXP_m7vYdbsD; Wed, 21 Dec 2022 14:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F7C417C9;
	Wed, 21 Dec 2022 14:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F7C417C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3E901BF5D7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7ED181ED7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7ED181ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsg89-0dwJOV for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 14:17:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBA2781E6E
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 14:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA2781E6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB92186BC2; Wed, 21 Dec 2022 14:17:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 14:31:43 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: ca73cd87c885af2e0ded07a0736f5745ba326435
X-Git-Newrev: b912c01a7d804291fca3c4e2cb7b09b45631a253
X-Patchwork-Hint: ignore
Message-Id: <20221221141727.BB92186BC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/containerd:
 security bump to version 1.6.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=b912c01a7d804291fca3c4e2cb7b09b45631a253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

CVE-2022-23471: https://github.com/advisories/GHSA-2qjp-425j-52j9

and other bugfixes, see:

https://github.com/containerd/containerd/releases/tag/v1.6.12

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4634a22cf70ec957ceabbb0dcd9611c824bc7a60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 285519441a..04a29949d7 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  f5f938513c28377f64f85e84f2750d39f26b01262f3a062b7e8ce35b560ca407  containerd-1.6.8.tar.gz
+sha256  b86e5c42f58b8348422c972513ff49783c0d505ed84e498d0d0245c5992e4320  containerd-1.6.12.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 89bbbf5c03..192175800c 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.8
+CONTAINERD_VERSION = 1.6.12
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
