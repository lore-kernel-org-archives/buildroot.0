Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1570EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73ED860DB5;
	Fri,  2 Jan 2026 15:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEjTh11_3tyk; Fri,  2 Jan 2026 15:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3031660D9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368687;
	bh=zqSb7IFmmaFvYnTNEBunfsH5hhLqwdaJLZ6E2aQ8JW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DPfzKiqMcsF40fwwkS+3kZu04Fo40g9lZEIuSfSA7Lo7KGEPAvOTAd9XqZWGYpf67
	 lzbngoWXk/FJ0j9Hkwy4BlPOVzT/ttEn4TA6o7Bm2x7sSIufsNcifZI9/uY6V8diL2
	 S2yvI/5rKMS9TI9g28FQcl6WMyvwk0MTSMF1OFLGCpntoyaIZOiIFVNtqlDkR0ZvIA
	 XomvL65y2Xke7fbjilY+oLO0pZxnBEpMZ7yVO5sLYqZO50v7FGosfWoDUH6BJd5q6s
	 2WAWoUxusseKcfIT0PF6Va/PmfQIUccGyfeBDfKvVpzshkWdlzMTVZ8B4ZEmAoMRmr
	 K/Ip2zwH8pKzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3031660D9E;
	Fri,  2 Jan 2026 15:44:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0707AD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED904404F1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOY6KdJO2j8R for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B7F40699
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B7F40699
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 287C087E79; Fri,  2 Jan 2026 15:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:44:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cea219e5180e7117a6002c4a784995c9dad48176
X-Git-Newrev: 451e735aa06b2bd986418118923ea7590a5b83a7
X-Patchwork-Hint: ignore
Message-Id: <20260102154445.287C087E79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: use correct
 QT6BASE_CONF_OPTS variable for Vulkan
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

commit: https://git.buildroot.net/buildroot/commit/?id=451e735aa06b2bd986418118923ea7590a5b83a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Vulkan option was appended to QT6BASE_CONFIGURE_OPTS instead of
QT6BASE_CONF_OPTS, which is the variable actually used during CMake
configuration. This prevented the feature from being enabled/disabled
as expected.

Fixes: 1c27f3a12d77b ("package/qt6base: add vulkan option")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 51a4f1b5be..3bf4a1221b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -183,9 +183,9 @@ QT6BASE_DEPENDENCIES += freetype
 
 ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
 QT6BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
-QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=ON
+QT6BASE_CONF_OPTS += -DFEATURE_vulkan=ON
 else
-QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=OFF
+QT6BASE_CONF_OPTS += -DFEATURE_vulkan=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
