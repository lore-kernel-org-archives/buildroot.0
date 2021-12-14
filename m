Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A03C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A3E409B2;
	Tue, 14 Dec 2021 22:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1g8GhLvHuXv; Tue, 14 Dec 2021 22:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C26408AD;
	Tue, 14 Dec 2021 22:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90ADC1BF681
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8068B408AD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYWmvgjOe888 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 22:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4A0D408AB
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 22:20:19 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so718222wrg.1
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 14:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1AgP8qvJNQp23EtGmkUDxuwLkzTzdmkZeDTzX63R4Sw=;
 b=kdrA8dn4Gm7rAsIy2KsTgDRAq8O1ukleCXRVj+gaYm0gRq5i3ruIWCTbmR26a+/YCj
 rHtO1A0t+QiKYWeobUPxkXJgLPwc0OtVxSV/Y2zMesZDXo4J8eV5Qn0yCJx7XXWfrRgA
 XfZHxyAyUqkgxASB8a07duXNDLw5K2YlHCMX7kKd1pwx7x/1AuaC0QQnz8hWoIfMJOil
 KaKj4VvdABsnhrehgcsy8B/U+af7QEVUbSok7R05YNq39Z2368ybGtLFv53YRMhoyNFF
 ooo2zRJO9JreTyw2VMFKeD6hmfPC1yx44KmK2XHcnaMjgpU5NIsZ0XTHDhx/emkWH5Mj
 zNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1AgP8qvJNQp23EtGmkUDxuwLkzTzdmkZeDTzX63R4Sw=;
 b=0d3+B/Y5c5NFcyg0Q6qOxvnlRbr3JDAO9nO1rxwFzk7VzDmfA2X71wtVTOpqBkODkZ
 92b81njNPX7bLVIHvPjPZMSo1u/6RjWS7rydGoe/V1/IIndAlsMOAgqTmSGWrgbnJhJV
 S7kUYxTTVBCpRNtdSutEWbXkieTksQr574/1JdWCjoorJO+rxQ1LeFN8KRUaVMmVlgRS
 AVTQvt3XJwnSvpTmG9Nb+UE+NxBrX5WbqNZtMhlVvkdUXDCWIBoDAmC7JGtcmHFl5cHU
 KG935/30k2T5QO9VY/0pguQCO3/fLOb6tOOIxucE43bQwR/PZL+h6LYp0NKWICd0tQLQ
 KQxA==
X-Gm-Message-State: AOAM530nI/BGQax3DihbeDMj6gJ8kEtgv3+buT/fHsF7uw3aRq8X3u8V
 OZuvIc98T6xzugYlBugypjfhCxZfTve4zA==
X-Google-Smtp-Source: ABdhPJxKuuKzu6ZzIL58Qh4anBNA4q3LJYSsr0u6yyGSV8XR6CMmIyVgP+wI0nkRNaGGef0om1YEHA==
X-Received: by 2002:adf:d091:: with SMTP id y17mr1807012wrh.418.1639520417762; 
 Tue, 14 Dec 2021 14:20:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a204sm467449wmd.39.2021.12.14.14.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 14:20:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:20:00 +0100
Message-Id: <20211214222000.2939765-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-rgb-led-matrix: fix build with
 gcc 4.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit e821078031e14df69e5142f23e9cb7b5a1ea0e77:

In file included from framebuffer.cc:20:0:
framebuffer-internal.h:83:10: error: 'constexpr' does not name a type
   static constexpr int kBitPlanes = 11;
          ^
framebuffer-internal.h:83:10: note: C++11 'constexpr' only available with -std=c++11 or -std=gnu++11

Fixes:
 - http://autobuild.buildroot.org/results/c035da0d183f21343f19f7dee982e8e73ee781e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
index 85c1d1a320..e436755121 100644
--- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
@@ -12,7 +12,7 @@ RPI_RGB_LED_MATRIX_INSTALL_STAGING = YES
 
 RPI_RGB_LED_MATRIX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC"
+	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC -std=c++11"
 
 define RPI_RGB_LED_MATRIX_BUILD_CMDS
 	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) -C $(@D)/lib all
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
