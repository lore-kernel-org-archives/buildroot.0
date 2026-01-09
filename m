Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1940D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A6483004;
	Tue, 13 Jan 2026 19:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWR67zqw4iv7; Tue, 13 Jan 2026 19:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1979482BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332992;
	bh=omNjAee/vKi9+qcxhJoO4Y2n5SsEtVPsk9BNHKnIHKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EbvO5kV4Qg2w3KCHgNEyghTBNNvxtErIgLw7Ob4MmfmBxeohGQ6y5heevH21MgLV6
	 zGniELWEYU21FnW40sRJadj1jdb2DVurxN4+KJGRqb/N7OvLNoZtXtcAbsHDsqICPf
	 WKk99JD2SG6QUKNzx41Chlcs3kArAZaOhMGWEUYNq9WWi+G1rfsHVMHa0/Awyg8PP8
	 EC+AJqtJ67Mv9LmxTUZGU0hh5TJansfX1Mou3SODwe+IvRTfql8OXEPFOt9HlD0xBE
	 tTfCKbkumPIQ3lmoNLKn6sqXcnNh3LjtP6P7+zy8ytBrlrLkxPRAEcp40W8uv3DAQ4
	 9yIV//CxKg3zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1979482BF5;
	Tue, 13 Jan 2026 19:36:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8702CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C156E82C3B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtiyiTVwF47m for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0465382B94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0465382B94
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6B39884BB; Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:00:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4374b541aa4937dee4d57f8fad5a4a8f84c56593
X-Git-Newrev: df3818dff955db2dc83c98b42dad55f2873e03c2
X-Patchwork-Hint: ignore
Message-Id: <20260113193616.E6B39884BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/imagemagick:
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

commit: https://git.buildroot.net/buildroot/commit/?id=df3818dff955db2dc83c98b42dad55f2873e03c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
