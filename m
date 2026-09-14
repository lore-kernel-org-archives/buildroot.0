Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D1FC88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 22:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D437040549;
	Mon, 14 Sep 2026 22:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQ4m10QQwfn4; Mon, 14 Sep 2026 22:12:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 814CD4053D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789423920;
	b=Z38lu1OhMTN1X208V14AjxhiyMXwe/Lf2SM5zDfUrGiaATm0A3kEgqbWBbLsUYib05Hu
	 1EE3C99lH5m5tBAAvRNn532wNGCKuKEQ/M1U3AbwVFhjWzOXQ6/f+o7pP8BmuBWOiSsdk
	 y9+eZW6BHLsOXV0JvHQ8Es0geArxhz+Afm+7qXBQtZHwvFgbWbYJj8u0pye5ELrL3P7Wj
	 6O8A0llwjtfvFEeuqrwygxQRBYGnXWoezD6bMc6us66gMw2SSOK1w39KO9DD3Ehu4cn9g
	 tEcK7XheYHGHAZzfQGxMn8JsGTA1U1kBzvTdNAuaExlBh2B4Z2IkLTs6sIriodcOhUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789423920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=G21GvLlCvL7CXs/Bk+m7Kb0osUiMrttZftIo/aUZsWU=;
	b=kj5MoFKisatJFRisZccF1U3agX8+KXo5aX8fvVUC0/NhMxWuYTDxQqfRsoKCu/++RZ3/
	 UCW5SySB6u+MfjugkxZvhM/4DIUEJ43vdKUGKhualoz2WXOSrHen27LGUu0r34lsks2p5
	 otZLfTkEILyEDSZuHFzBZl757yY+FBqzzzvoS6r5CndovUXDNjQoFE4FjhqOqqr5ttXDz
	 rrCLgoNVR5O+OorL6n4VYvOq554v3xBKieFby+Go+1FjmzM1PCt2mdjiP+HjN3nimXB5b
	 s1rividMAW2ghbqSixw0btFgDIbjFlvbh104hmA1SaeeDviyZTsT2lKfSgWfQ8eL4Mw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789423920;
	bh=G21GvLlCvL7CXs/Bk+m7Kb0osUiMrttZftIo/aUZsWU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MiSLyupTu4hXcCrH+Oh037A9gDRrXermXZK8dbQh6PM/sUoLIMZBwLietTTMopDCX
	 M+t2DJpwNBJQkotCwIjoWmZT6iuGgMcx+i3g22MJ/jPASynNVf2aIEjBHs66MOPtVK
	 B/I8wE2sv+rlfShxeUwXSQopEpVsonvh3GL3agX8X6pOxNJsP1BUbcTvpTA59batlB
	 tJfySG8bDijzn/p0TSm79mOZ6jAHMVC4l5AiDYapASq/MmrqGdFUO7HzbS9FyW9v7R
	 t7hlTtdGX+tyE7blHF0mGuknwfJXdDkjQoQw0c1bUbA75Lrwz0AvlrULn5F2c/1LPC
	 4n8nT5jIqoIUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 814CD4053D;
	Mon, 14 Sep 2026 22:12:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58168493
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49A9F80BCF
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjoxLxUXscen for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 22:11:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CE5E180BB2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789423918;
 b=DbCzy+b7LOm4Qec+gZGlvyRY1QBt2r3KVz1LHlHCQykIWu0quyOQjO0C0T0sswMYksL9
 zOVkUZwFgVr6dMjZJ5HO+Lv0ZGktkAabiwZ00maIUlptEB/0Y1HNgBgRSETBgwygMA/aH
 yHYydTbj3/C3YskpFi9InlDi5THZtntqqj+GDcc7WgV+Sj1/+fM1HZgdnYvN+DOoiDVhz
 8SmFfyBevf0hfn16xxvmRYKmL+VxLp4SrlGwKvPmOEOmynPbmZwgJucPvfIwhPfKjw3JZ
 E3fqvJO3+aWekf0kHV2ndiSUOUBT2/4KXE+s3icACvsAIMVHg6oyW89T3xi2zWEVyqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789423918;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=mOwk24v2wdCHIZVTeCRwcYyvvaiIE+vmqSCeaik8m70=;
 b=bt3Ywc6BqwJ10hk2TFAp/z2nvbPs96mbqgR9iPVTu0g6MxOtKtyI8E6FQDATU8O4E1js
 yN7guQ/gvFtVbH2Ydyg+n+Fm/D2bdUGUHW9mi4zEwz6WADJv73jtxMzsuloGYAR+M2dXZ
 gySlVCb5z+Wjw3d/rFU7ogcpEZcQRaCgksBgBTP/c58OFSXsfcA7vP9WIh+oa6RdrUDuv
 /rRjq7kYtJPHRu50d3z1A5QuAWon275TYSwDVhBitkujj6DYTx8abFNllXixilbdkQBam
 pQsz1AYL5g7RwxhGacd4XiGUK6K7gKaOoChlThexHtdWK0Py1pWBFNdOCB5Rn4rFU9A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Y9LLKjDd; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE5E180BB2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:11:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 63664C62214
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:12:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E72A160323;
 Mon, 14 Sep 2026 22:11:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3896011C7AFC3; 
 Tue, 15 Sep 2026 00:11:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Tue, 15 Sep 2026 00:11:44 +0200
Message-ID: <20260914221145.1858079-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/rpi-rgb-led-matrix: propagate
 BR2_PACKAGE_GRAPHICSMAGICK dependency
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

BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER selects
BR2_PACKAGE_GRAPHICSMAGICK, but did not propagate its BR2_USE_MMU
dependency. This issue exists since the package was introduced in
commit e821078031e14df69e5142f23e9cb7b5a1ea0e77.

It fixes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GRAPHICSMAGICK
  Depends on [n]: BR2_USE_MMU [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER [=y] && BR2_PACKAGE_RPI_RGB_LED_MATRIX [=y]

which occurs when you configure an ARM noMMU FDPIC toolchain (because
we have noMMU, but shared libraries, so rpi-rgb-led-matrix can be
enabled).

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-rgb-led-matrix/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
index ca945a92af..5088af3bf1 100644
--- a/package/rpi-rgb-led-matrix/Config.in
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_RPI_RGB_LED_MATRIX
 
 config BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER
 	bool "Build led-image-viewer"
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_GRAPHICSMAGICK
 	help
 	  The image viewer reads all kinds of image formats,
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
