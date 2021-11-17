Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB580C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 23:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188F461B44
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 23:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 188F461B44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1CFD82400;
	Wed, 17 Nov 2021 23:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYKuKP1J7gji; Wed, 17 Nov 2021 23:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B2AB823FB;
	Wed, 17 Nov 2021 23:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF57F1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 23:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFA59823FB
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 23:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydazbhjFM9Pl for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 23:01:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 212A581C19
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 23:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E970A8DAA3; Wed, 17 Nov 2021 22:57:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:48:12 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: dea560369c02cdec0336d2385af3c09c5343b311
X-Git-Newrev: c29f8228e8754250a7a5d263d1c173a2227b8861
X-Patchwork-Hint: ignore
Message-Id: <20211117225721.E970A8DAA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/isl: switch to
 new site
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

commit: https://git.buildroot.net/buildroot/commit/?id=c29f8228e8754250a7a5d263d1c173a2227b8861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

isl.gforge.inria.fr no longer responds and the main site is now at
sourceforge.io.  This change corresponds to the upstream commit that
updates the documentation [1].

[1] https://repo.or.cz/isl.git/commitdiff/002820d725479b456c97ca9b0d59d6b3e18f7ee4

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 748b7878e90ab5813a6f48e156410cf38ef087d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/isl/isl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index a1a597d038..c1d0689b5a 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -6,7 +6,7 @@
 
 ISL_VERSION = 0.22
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
-ISL_SITE = http://isl.gforge.inria.fr
+ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
 HOST_ISL_DEPENDENCIES = host-gmp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
