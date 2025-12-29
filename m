Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B26E92FE2
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E314060B;
	Mon, 29 Dec 2025 21:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRCqrfh7ET3E; Mon, 29 Dec 2025 21:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D384405BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043969;
	bh=1tZwqndVEh9K4BM8DG0jKKXuHFfFNBv8gut4VsZxdns=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BnOVpgWBS1eGPCBiOJ+eg7RZnsWDl5s2AB1E/Gbcl7huObUYVv/6wJaCFBeukyh9s
	 9DbwVxqiOlcRXmraG2SqAr1OfpM5uTgKXZFirXtY2DTozT76z73U8LbtMqVoOxrf0U
	 Rozi7qRU4WVOFKPKOeilybrsKI2Jxan7kmc9Rf3hNl2hzzg+1TPzkhdkwiiWv1pW9f
	 YFT7x53GHKWJek2fLbHRZFPAZIVz+i27zpu+R0PETeayN+K4m8p80pKCeyayX1Zy+4
	 3Ki0HKNsiz43CsdHYetUkESqbIxyO5FAnn+GT8OABZ1sWiqgGZenop1dl2uVxzzqi0
	 +iKfEbLbSFLhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D384405BB;
	Mon, 29 Dec 2025 21:32:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A12D177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B1F9608A2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EToFCmBhW0V for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 896FA60807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 896FA60807
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:32:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 780E987A6D; Mon, 29 Dec 2025 21:32:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:25:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10419e76c6b70d79884b9da6361bdd5281068120
X-Git-Newrev: 4a315e153f120ff236f1dd63d9e097e169918c23
X-Patchwork-Hint: ignore
Message-Id: <20251229213247.780E987A6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: security bump to
 7.1.2-12
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a315e153f120ff236f1dd63d9e097e169918c23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
