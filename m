Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4631AD6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFF58099D;
	Thu, 22 Jan 2026 19:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9a0C4IaQcfa; Thu, 22 Jan 2026 19:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2900E809E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769108958;
	bh=b47KiudYU7kr1YRfRjHOwC62TXV64u2xXXcdSba16XI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a1PdI+bDbh6NYZPPucQQicctLDJMOUAYkq6HBmC6hiWhOpHPSXtI43Uu9fwvxitNe
	 tWaxpDY11Ge9lKHjObmjqacxtHEnDn+Aebu/TjRQTW2cM0rFA19X/WqPKxjeETj0Gm
	 Me2z+R/Li1eJ0t5Ro7/imwN5LEt6dVTrzhFQCI2vmWNVen2O1X0iTIDx3tpdYSj/8k
	 gh1vmCCoQvy/Gx9zFf4abufoNLuMbSw977qvIzJwHJ4cFoJk6cnDf7BPGPhAQ9XkEK
	 jSqtMZlntQ8Gk411TJAQU+a1R/rf/sljf+rAYBM+i37MOtcGGL1+egZxCbd7WOgtq+
	 ok9OC3358qfRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2900E809E9;
	Thu, 22 Jan 2026 19:09:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4EF04DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68D1840153
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvJPcvtgMyDC for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B3F14012B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B3F14012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 783018751E; Thu, 22 Jan 2026 19:09:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:08:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72e4853bc7b8eca31df91887d8b97e2a311df6f9
X-Git-Newrev: aa1bdd38ff6a868e28105cca75815fdbeb77b21c
X-Patchwork-Hint: ignore
Message-Id: <20260122190914.783018751E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opus: bump version to 1.6.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aa1bdd38ff6a868e28105cca75815fdbeb77b21c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://opus-codec.org/release/stable/2026/01/14/libopus-1_6_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 675117e518..a5093d2cc0 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  b7637334527201fdfd6dd6a02e67aceffb0e5e60155bbd89175647a80301c92c  opus-1.6.tar.gz
+sha256  6ffcb593207be92584df15b32466ed64bbec99109f007c82205f0194572411a1  opus-1.6.1.tar.gz
 
 # Hash for license file
 sha256  01e1167d54a096d123cf6dfbbeb19587278845c6481d2d66d545669846079551  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 98ca12a623..13ab9cd7de 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.6
+OPUS_VERSION = 1.6.1
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
