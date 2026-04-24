Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84247FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D1BA84D88;
	Fri, 24 Apr 2026 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsYznbvlMo2F; Fri, 24 Apr 2026 16:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D4A84D82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047946;
	bh=C5m/uRYtTaoX/vNe5T9ptzl7J3iDNSZG9/nmEYSZ1xM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DqnbQ67Fp05inTPvOJixG+eNwTaVOPJWwFWMD6uq07BY9injO04LxaGU6sNAdM31v
	 YgS/GF81wnvv/YlItttKtwG8+9QncPymm1yoxrqycNTdvKRoU99EfeazHdDz9635Hz
	 VNEW81Vk1hZDbBtrNy2kLYegotxS+xt4XMb1zxQV2WWH3QRJG/GH5Q5/megepP4Z2D
	 yewS1GtmCV/Q8aKv1WxNjLgh+90v9msWbI1CfrjvakjnijPX15GV0XL7PL6vldQUQO
	 ghTV6KLMR25H2MyiYjH7lTYRi6OeWPHFgVBmLKMKQwcRt/2unR85f1mfvUznxVcViu
	 vgyG4yJs8AsjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D4A84D82;
	Fri, 24 Apr 2026 16:25:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F69024D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 857C984C51
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39V5aaKOYV2B for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B001584C77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B001584C77
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67FEF82AFB; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 158e871ce8c036de2d1a01efb0ece2b1d320d1ce
X-Git-Newrev: 346c22c8b672e8314c147d28f9aaac5d07b73f8c
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.67FEF82AFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libexif: bump to
 version 0.6.25
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/346c22c8b672e8314c147d28f9aaac5d07b73f8c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/libexif/libexif/releases/tag/v0.6.25

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 01e71aa9f6a7f6a3d7e54a666809bb7e44c49098)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libexif/libexif.hash | 2 +-
 package/libexif/libexif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index 0d082aedb0..9e95e27f3e 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae  libexif-0.6.24.tar.bz2
+sha256  7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307  libexif-0.6.25.tar.bz2
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 858901f40e..0e50d78fbe 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEXIF_VERSION = 0.6.24
+LIBEXIF_VERSION = 0.6.25
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = \
 	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
