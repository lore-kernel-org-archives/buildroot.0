Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF53BCD8CA8
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 21:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC11841AA;
	Sat, 13 Jun 2026 21:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZqEGc8BvF8x; Sat, 13 Jun 2026 21:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7F5841AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781386387;
	bh=3Q8DFlcFTQFmxjFckh6pWM1PxCxS23WavmOM/5oCeHI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bN6aYBZ1PezhGFyoEviHn1BQNmIH6uYiw9aWST2z2asD88bx9jObaF900/5lXWJE2
	 eqJGRBQMXnazMSsZaFtUBy7UTtsMPdHAnwUHKi7O9Pm2sssTvTq6SvQZpYMTwwIRNB
	 rNr3i9kNr9aFFlOnR9lTGWq5AaZaq2gt3Cw9FF6OWrPEHUO7eOKtHQ5jaixXps+Pg+
	 NRTHLom8kkH8s/uBSqqclYpqE1BQgz5vWr8cPCyc8ejt8lRKLJGfQd3LUGFg0PW1lz
	 NFd9AYwUXn55WYb9NcrgNZFU+U8nDFD8RMki2KbECwRK8gIV2WI2U793x4n6ALUR8g
	 jrqISpxe7pu+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7F5841AB;
	Sat, 13 Jun 2026 21:33:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1DC5F4
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 21:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F60F40358
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 21:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KzdG1MHgxTk for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 21:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D83EB40343
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D83EB40343
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 21:33:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 017EE881EE; Sat, 13 Jun 2026 21:32:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jun 2026 23:32:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d4bd23f5376b62645828f022d2112ccfa3a6ae5
X-Git-Newrev: 94a72b1922950581c00cefb64ede598359c16a94
X-Patchwork-Hint: ignore
Message-Id: <20260613213245.017EE881EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/genimage: bump version to 20
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94a72b1922950581c00cefb64ede598359c16a94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/pengutronix/genimage/releases/tag/v20

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genimage/genimage.hash | 4 ++--
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 5c55467737..1502b5258e 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,4 +1,4 @@
-# From https://github.com/pengutronix/genimage/releases/tag/v19
-sha256  7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108  genimage-19.tar.xz
+# From https://github.com/pengutronix/genimage/releases/tag/v20
+sha256  397545be2fa52d482c5fba9a11897c61324bfc559ea0efb700b9edba7a807b55  genimage-20.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 5fa34d8eb9..cdb1e64f32 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 19
+GENIMAGE_VERSION = 20
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
