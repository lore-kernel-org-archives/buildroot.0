Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6A6C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 17:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A95B683ED1;
	Fri,  5 Jan 2024 17:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A95B683ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMbRmXvnZIoX; Fri,  5 Jan 2024 17:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A7B83EC2;
	Fri,  5 Jan 2024 17:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A7B83EC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAF851BF3CE
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C398B83EC2
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C398B83EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1xjkzyfEtxq for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 17:51:16 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0102983EBB
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 17:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0102983EBB
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d87df95ddso15889425e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 09:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704477073; x=1705081873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pk0/p8K2wyI8XPRGdCsuEO0EsCvpYcoJdnit4D9Pu6o=;
 b=fMMSGdxOlmmRWaXodguo1Wg21oYl61e7Ge6sXZpnyNh3jqcaiP0tpglrfh4Oo19C3t
 BgwHpXn16TSjh+LMrojWjvSqApN1g940Blr5smyOsE0z19xUNeEZQMBPNBfwYBkffsM1
 WLLN1GxxzPLtGMlbM08uNKa6suxyi3XpRXGw2QTz43aXzYYAzMLPgnPDWl7POU8duKtw
 9lN0WnZ5OT15LhHOBDl6mTOtFf5KSRUmkBKvIdX8CYJa6oTVmGrkypQXXrQzWrg2XQr/
 xE1BW0sLcfQT0LxFmmCRNU92J2HfE4ZjWGgDWYye1888rLfF47JgnuwltI1AVKl8PKz2
 /CvQ==
X-Gm-Message-State: AOJu0Yz9nRiuDmn/V68FAC3WyOgkAj9CW1/PdaY/mjnjOMMoNt6v2yed
 Meib4erVEJUl/ZxcHJIu+ii8qUNOZk4=
X-Google-Smtp-Source: AGHT+IEBrkh6lLL0SESb7qR0xEUhXVhAo+K/A05HChXkgUb2xSZayIQ0D8UBIQv75t/Ps0oScsfyTA==
X-Received: by 2002:a7b:c342:0:b0:40d:6045:e847 with SMTP id
 l2-20020a7bc342000000b0040d6045e847mr737681wmj.88.1704477073052; 
 Fri, 05 Jan 2024 09:51:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w5-20020a05600c474500b0040e34835a58sm2227199wmo.22.2024.01.05.09.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:51:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 18:51:07 +0100
Message-ID: <20240105175107.736059-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704477073; x=1705081873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pk0/p8K2wyI8XPRGdCsuEO0EsCvpYcoJdnit4D9Pu6o=;
 b=m09N4Cw6eKLH0musruAXatCYxw8MlxWmthuFfmYp+WO6NHvR2fCnKasdQV72FJw4U8
 BjjMVEFGilLmUf2ctRdCMBIY6uvBiTuEZYrMfW7O08R821pvh1cbkNOLqRnf0ELFT1Xr
 L7X+ChF+Kiiyp6cpMNW59IQsxzfM7MiDLZVwSczM8qpLBgYNTDW3Cx9b5K7DNgklpcIS
 5vTR/z165zPf2nF4Nx7yefJeXSmUzvMQ21PNG5GrodDeXjBGqwqzSwfy6EddG7lglmZ6
 tq8YQBUkq5BKbkMEOt7vg/Lp4JawUwafvptiqs83UMqoD+44mZ9CZFGNZF6COGNVOKKR
 z2TQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m09N4Cw6
Subject: [Buildroot] [PATCH 1/1] package/cups: fix avahi handling
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--{dis,en}able-avahi is unrecognized since bump to version 2.3.3op2 in
commit 8cf034ab0f686d0a3891b6fe5bb5a2d1bdf381d5 (which switched upstream
location from apple to openprinting):

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --disable-systemd, --disable-avahi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups/cups.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index c46baa63b6..8db0281dc8 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -62,11 +62,11 @@ else
 CUPS_CONF_OPTS += --disable-libusb
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 CUPS_DEPENDENCIES += avahi
-CUPS_CONF_OPTS += --enable-avahi
+CUPS_CONF_OPTS += --with-dnssd=avahi
 else
-CUPS_CONF_OPTS += --disable-avahi
+CUPS_CONF_OPTS += --with-dnssd=no
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
