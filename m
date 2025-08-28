Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD33DC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96FC683BDA;
	Thu, 28 Aug 2025 17:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIdYkHpLsXY6; Thu, 28 Aug 2025 17:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC6F83BCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC6F83BCF;
	Thu, 28 Aug 2025 17:42:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C6B76C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 17:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DFE040867
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 17:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-6fTbuEN5R5 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 17:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63578407CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63578407CB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63578407CB
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 17:42:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8D24F1A0DBC;
 Thu, 28 Aug 2025 17:42:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF8A60303;
 Thu, 28 Aug 2025 17:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7624D1C22DD01; 
 Thu, 28 Aug 2025 19:42:03 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Thu, 28 Aug 2025 19:41:51 +0200
Message-ID: <20250828174155.249940-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828174155.249940-1-thomas.petazzoni@bootlin.com>
References: <20250828174155.249940-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756402924; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=CuQbmnZQbf63mR90Td/jR+fJ0fRMFre/ZXJ/aUat7/0=;
 b=0BKDr+I1nb71OJAvZA8BVgYWo5Riajy0XBsx2rIQWLPQY4ttdyjxUt0Y0lKPo/nGtTkK+X
 IWJqZcgsVlgaZPBh6KCsePds1pixnS5A2slQ8/3+2qR3m6Mm26TwRnySHgYXacerW76So7
 sGia57YcNt3043l0rsktBZkD2cJx44lE2flCST2kvumNWJ+Xzx0z2mdZ8eClxNWbxGg61N
 Hv7Gya4qmkCwt7o4eg0DennZUCletdzLmpjsq5WggLiab06e2oSjLGNmQLGzjhbcuRqAME
 mCaBgtAjthUotgIJy36QXy/GupSilcbXltX/T13keCYY8zBY6K2NEGfLfnopSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0BKDr+I1
Subject: [Buildroot] [PATCH 2/3] Reapply "package/ffmpeg: add support for
 pulseaudio"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit fecc337d21f337a30ef7f9f448683d99c01fc245,
re-adding optional support for pulseuadio in ffmpeg.

This is possible now that the circular dependency:

  pulseaudio -> libsoxr -> ffmpeg -> pulseaudio

has been broken between libsoxr and ffmpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 2d65623926..9ba7ac0f61 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -94,6 +94,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libjack
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+FFMPEG_DEPENDENCIES += pulseaudio
+FFMPEG_CONF_OPTS += --enable-libpulse
+else
+FFMPEG_CONF_OPTS += --disable-libpulse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
