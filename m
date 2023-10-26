Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD75C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2FF42E03;
	Thu, 26 Oct 2023 16:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D2FF42E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZIGAklS_1RI; Thu, 26 Oct 2023 16:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5386242DBE;
	Thu, 26 Oct 2023 16:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5386242DBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E76EC1BF239
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFE0942462
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE0942462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPXvTL3M7KsC for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:40:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E8C04245E
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E8C04245E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0839085F2A; Thu, 26 Oct 2023 16:40:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 18:33:01 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 78ea668c6ff8f1afaecec006c9f4c92a0844a1f1
X-Git-Newrev: 3b5e9e24c4419b8d78281a64d98bec73a5cc990f
X-Patchwork-Hint: ignore
Message-Id: <20231026164040.0839085F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/inadyn: bump to
 v2.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b5e9e24c4419b8d78281a64d98bec73a5cc990f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

New features and DDNS provider support (IPv64.net), but also a lot of
fixes to regressions introduced in v2.11.0, e.g.:

 - dynv6.com not working at all, regression in v2.11.0
 - Regression in DDNS provider names, introduced in v2.11.0:
   - dyndns@3322.org
   - dyndns@he.net
   - default@dynv6.com
   - ipv6tb@he.net

From https://github.com/troglobit/inadyn/releases/tag/v2.12.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit dc84952eb38bf1ef63fc8718dc2ced200a3e52dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 94af9f87b7..eb5249e371 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  9ddac7b6b0a1ed372c6cb5afaec6bea927ab539db02c8536dd10d73bd1d37c95  inadyn-2.11.0.tar.gz
+sha256  38fe00f20b293e64a89efc85f766ff40f0be3bcf9c3ed68b842104540a60806e  inadyn-2.12.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 3e346fd769..fa2eedc1f3 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.11.0
+INADYN_VERSION = 2.12.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
