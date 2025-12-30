Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB05EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977AB608DC;
	Tue, 30 Dec 2025 22:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4whPim0-XoL; Tue, 30 Dec 2025 22:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ACE460BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133601;
	bh=/13mcEGvXvdQUWT8TqyoH50CtQJqXrrf3fAVE0iah+A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qg/t/gjwWd0/koG0rq9zaHk06BABU8X6eHwSDf9MyelKyMQB51wEY1jX+a/I/q6va
	 2JlNHsWMFI4fWj+KalG4psdeRLrPRdjE6vEYjFZoxQevDapiXqu7F33JVR/nfbK+o+
	 qfWJb/lOl76gmEKJX6kmt80Vexo7Zd9guW4tS5pk9m7kKH2wHvnm4ClgTQtaTIENgQ
	 MCejf+yK0cgK2d8ldW/MNP9Kjck9UVn0Cm3W2vx9BoFesaQuZJ9IVpnn7d80zbWdAP
	 IczcFY8hTWfUvt64B610eZwtNqHwQ9uUSc46pOhVAyHaNp4Gqs/LCL39DuXcVFcsAj
	 XJzRR5W2m7Bbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ACE460BD3;
	Tue, 30 Dec 2025 22:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CED8177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EE2940388
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2ICNDGffiR2 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E8EA4038F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E8EA4038F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BB7087D4A; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 024814af94f8d8e09a58e5a7e560dee5da830ef9
X-Git-Newrev: 53d83008325541bb04db0d1876cf1053629fa66c
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.6BB7087D4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwpe: drop rpi-userland specific
 tweak
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

commit: https://git.buildroot.net/buildroot/commit/?id=53d83008325541bb04db0d1876cf1053629fa66c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop the special
tweak for it from package/libwpe.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libwpe/libwpe.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index d8d2caa08a..5d1ad27add 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -16,10 +16,4 @@ LIBWPE_DEPENDENCIES = libegl libxkbcommon
 LIBWPE_CFLAGS = $(TARGET_CFLAGS)
 LIBWPE_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# Workaround for https://github.com/raspberrypi/userland/issues/316
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBWPE_CFLAGS += -D_GNU_SOURCE
-LIBWPE_CXXFLAGS += -D_GNU_SOURCE
-endif
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
