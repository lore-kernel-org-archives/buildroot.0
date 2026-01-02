Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD22FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8987460828;
	Fri,  2 Jan 2026 15:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjlhPQD9BIuD; Fri,  2 Jan 2026 15:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B504760808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367542;
	bh=fURnaDTiBy1J0EYlFMs1ncawFObT++gpJajcSuD2Z2I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hiQFmeqhNKsp8dpVhKqybaM3iRd2u/54+1WAUJ2F+xmO0CYie0zbvg7+bEd5yTplS
	 SBNp4wtOt4Ej0uS8xLO91gDCSk9IQ6xDuZBfxtiz2cq0aaDiqTPuzmY306ms31e1vN
	 I6j0lv+yTiPz27IEInIvVX0yIu1kUbiQH2uBNkgJVSyPsZGIHqfVn59PeY02vClqbp
	 W+duTXff9yL3LfLJm38FDe4cZ9kkz8/ZHO/Lb95q6I48TSut7U11Uhy/YVrj9iQNGn
	 n0MNGAlDu9BL2ZFuQOCr3vJkGZ4s9Ls3JFBo0vQgjbaJBNA2Gz4pfRVeqaFPM1QLCC
	 veOkycdzxfMzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B504760808;
	Fri,  2 Jan 2026 15:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8E7AD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAD5A607FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZFZPknVeDke for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA8B60808
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA8B60808
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADC7787F4C; Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:24:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d9508572f357f186b3d6f3f10c3e2e3202583d
X-Git-Newrev: a8aed698c706ec534ddc41cdce651c18016c28ca
X-Patchwork-Hint: ignore
Message-Id: <20260102152538.ADC7787F4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.21.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8aed698c706ec534ddc41cdce651c18016c28ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/strukturag/libheif/releases/tag/v1.21.0
https://github.com/strukturag/libheif/releases/tag/v1.21.1

Fixes CVE-2025-68431.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libheif/libheif.hash | 2 +-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index da2516a583..3da82e3e27 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  68ac9084243004e0ef3633f184eeae85d615fe7e4444373a0a21cebccae9d12a  libheif-1.20.2.tar.gz
+sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index d82ec6a0ec..acd302d847 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.20.2
+LIBHEIF_VERSION = 1.21.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
