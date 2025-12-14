Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A4D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 16:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1210560D8C;
	Sun, 14 Dec 2025 16:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vy1RTaKsd0Oz; Sun, 14 Dec 2025 16:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6761F60B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765728282;
	bh=8jg3wL45EUD0YuQTlwh/Hn3xHTgeKQMsiSMopBIC9X0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mzwc6NBrq3nUj/fS0OHbYcz//0KfVCj6mC6FO9HkhrzPp9SSSkb1uQpSdbn5OrFAs
	 G+eJnQLY3z1V+Z1Ft033Vwc1Hn9VjE501DTsM+258NccNlWBC1YnDr5sd4WBvHyGME
	 BFmpjVxPNVgOa7Sq5JzsIqW/QEdyFuatRcTWnqWOFqGNly6aHPr8Wn/A10SDAM2c5v
	 2pdW/qlVD35IVzZIUvF6kcXIiOI4C9x7f6Xrfna9lvTyULNK/hFh9HG/pOT8D/x85W
	 AzRTExEn9i+OnsS25yFT37wjTaQtKmdH+8h4/B6cEyVvvSKiprT/yDIOcC/+MP3AYh
	 WoKfsDwKZZxCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6761F60B02;
	Sun, 14 Dec 2025 16:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40EAB2C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32DBE808BB
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kim_IzkGm_Pk for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 16:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 591AA808A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 591AA808A3
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:04:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49BE386E3E; Sun, 14 Dec 2025 16:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 17:03:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bba86304b0ac4ae266cfb52e54a239b0850b10ca
X-Git-Newrev: d75b8c5b7501c4b9a4b85df531d6e19c159a7934
X-Patchwork-Hint: ignore
Message-Id: <20251214160440.49BE386E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821au: bump to version
 2025-12-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=d75b8c5b7501c4b9a4b85df531d6e19c159a7934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Kernel >= 6.18 introduced in [1] rtl8821au fails at build
time with error:

    core/rtw_security.c:2008:13: error: conflicting types for 'sha256_init'; have 'void(struct sha256_state_rtk *)'

Fixes:
https://autobuild.buildroot.org/results/bc0ec5fe3acb37740b54eb1af1fe5d9284c87cf2/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 29b4d46f8e..ca5f9f15df 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe9840003e9481cf9fce3a5ed3f5b985615f862abc1b8d51fe6de7da9e4943c9  rtl8821au-dfe6801adb9b3a5572260ab308d3b69522992814.tar.gz
+sha256  1d9f87c7a30d54f67cb09e98a436565ba9c64a28feca95205f66212d8833836c  rtl8821au-bb26b6b06c47b79c17426ef186f44a608dbed7a0.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 734b427019..4e7aee4204 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = dfe6801adb9b3a5572260ab308d3b69522992814
+RTL8821AU_VERSION = bb26b6b06c47b79c17426ef186f44a608dbed7a0
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
