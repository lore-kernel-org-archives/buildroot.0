Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949E1FA3742
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 12:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4789580FFF;
	Fri,  2 Jan 2026 12:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZFZUwj9t1kS; Fri,  2 Jan 2026 12:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9731380F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767357526;
	bh=99u1A4YRPqB2uVQ1T8bC2UMvyWycxRwLvamgVbklk9c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OYoR5NivrrcinD+p2C/gEqTBXUuzv1bvQ/ybdktuOTTTEqL1TG3vQU5/YL7jcM1ZT
	 8P+4YjXA+z81/37vuSKZGLE8W8XgnPJKZyB2gQzRV0l5Auh5hUaJvsDDnjaBOiswdH
	 3uesQ44mjw5NihwwyYhX9F912y9Ni8k3sa84wv+juYE/HoU95EJt5l+TO8Km8zCZBt
	 4tn9TKjMmsy6hqgPJzXDe0xfsUKZtdfYqs4YoMJBkqDQpPJM0dIA2ENwOfJzvwyHCa
	 sVzQuw1ACu9fy0kCvxfeQp6AeHBljDcsQD6KRRzPgsnole+l3eVfOf8OyrF00/ZF4J
	 ZGtowH1+6852Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9731380F34;
	Fri,  2 Jan 2026 12:38:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2D619D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4898580F34
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50evOi5PyOoa for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 12:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7261B80F2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7261B80F2B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62A2E87F10; Fri,  2 Jan 2026 12:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 13:25:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a058d3561f9edbc404954343cc16fd6c5f872fbf
X-Git-Newrev: 0c4d501e815b6aab7b26c7d61bd63865f9c46a98
X-Patchwork-Hint: ignore
Message-Id: <20260102123844.62A2E87F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 6.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c4d501e815b6aab7b26c7d61bd63865f9c46a98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=0b3937cd1ab60b206a8bca8be5253b053e042161;hb=34277e12e80031c7f89494ba543684bc1dd0be8f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 99c3da5e74..1ffef61309 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487  ffmpeg-6.1.3.tar.xz
+sha256  a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18  ffmpeg-6.1.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 7bdf948c80..1efcbf87aa 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.3
+FFMPEG_VERSION = 6.1.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
