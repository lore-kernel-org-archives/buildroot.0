Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABC0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:48:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1334061AA7
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1334061AA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5FCC404BF;
	Wed, 17 Nov 2021 20:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4m3A-TVQgdWW; Wed, 17 Nov 2021 20:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDCF240452;
	Wed, 17 Nov 2021 20:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59DC11BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4982281DA0
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdRdSQEOInQg for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60C3781B6D
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 68FCF8D4D0; Wed, 17 Nov 2021 20:43:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 21:32:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf8900b0638e3d17c78ffa48655d4a972d1c7e8f
X-Git-Newrev: 748b7878e90ab5813a6f48e156410cf38ef087d9
X-Patchwork-Hint: ignore
Message-Id: <20211117204335.68FCF8D4D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/isl: switch to new site
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

commit: https://git.buildroot.net/buildroot/commit/?id=748b7878e90ab5813a6f48e156410cf38ef087d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

isl.gforge.inria.fr no longer responds and the main site is now at
sourceforge.io.  This change corresponds to the upstream commit that
updates the documentation [1].

[1] https://repo.or.cz/isl.git/commitdiff/002820d725479b456c97ca9b0d59d6b3e18f7ee4

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/isl/isl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 3abd6640cb..df57c83f55 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -6,7 +6,7 @@
 
 ISL_VERSION = 0.23
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
