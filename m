Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C478AD29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A04982CA5;
	Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gasVWU_ed4t; Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC768305A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333235;
	bh=G/HexBPY8iV7DYhIik2dUVqhf6xlUFwM7Bengug+/NI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WKlU5xal9esK3iSOYQCRRwS/8fDA6TWTkq9nWNi1z5fL4LyVOhjAedfliivj+C6z3
	 LDIFoUUQ84iTJ7bFZl7qqbsbRXSkm+1ZEW17kbbCxZCtXXPnJkzRQtjBDSyCQ0WBxi
	 +3fmG/Q4FlKYXXlxLdz5qZx6QXBXkp4AKNBezVtCXXpdzDykACATr2AK3O54+AHexy
	 beklbgSDatIpErsokKDbjwkSm4wct6tYqLzEu90NmdJnTaWn5aGqOyn2/UdozbW+Wi
	 RSzH4GQrzGc1TTW1b3Vp0bFGqHAm7Cb3GBMVdqhrYPp5EYqxuKhvg2312aUu+BqhEX
	 DvgP+kcaJO+BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC768305A;
	Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A424231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B5EC82AA7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ie7ZQpqxnWWp for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C90A2829DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C90A2829DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA1218125F; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:00:56 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7b360bde0d9a0b12d52b49b8830e7b4b98c640f3
X-Git-Newrev: a57f9dbc1f04c262f0df72b2427e242ccdba57c5
X-Patchwork-Hint: ignore
Message-Id: <20260113194031.BA1218125F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/imagemagick:
 security bump to 7.1.2-12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a57f9dbc1f04c262f0df72b2427e242ccdba57c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Changelog:
https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

CVE-2025-66628:

    In versions 7.1.2-9 and prior, the TIM (PSX TIM) image parser
    contains a critical integer overflow vulnerability in its
    ReadTIMImage function (coders/tim.c).

    For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2025-66628

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
[Julien: mark commit as security related and add cve info]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4a315e153f120ff236f1dd63d9e097e169918c23)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 3dbea6d8bc..eead3a9f97 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  acf76a9dafbd18f4dd7b24c45ca10c77e31289fc28e4da0ce5cc3929fd0aef16  imagemagick-7.1.2-8.tar.gz
+sha256  521fa7a8c0f664a3f5cf7437cbcc219f12bd6d5fe0c1fb014f212fa145076e60  imagemagick-7.1.2-12.tar.gz
 sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 4e6a810631..0d5eb2aa34 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-8
+IMAGEMAGICK_VERSION = 7.1.2-12
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
