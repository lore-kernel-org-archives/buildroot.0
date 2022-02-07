Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40E2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 12:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F59B60DE5;
	Mon,  7 Feb 2022 12:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id So4HtjqSgnEu; Mon,  7 Feb 2022 12:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7238360D77;
	Mon,  7 Feb 2022 12:10:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4251BF321
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 12:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 386B7813BB
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 12:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wflzr-JQXAa2 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 12:09:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 619A1813BA
 for <buildroot@busybox.net>; Mon,  7 Feb 2022 12:09:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso350044wmi.0
 for <buildroot@busybox.net>; Mon, 07 Feb 2022 04:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bsuXsyuamqk9etMCjd8V0jynu8bAQMDlhN4YO0sQc44=;
 b=e8NBgm52xF15UMjvHibeJPXqPqB2+XxL0e8SFnZ+KOy++c1OTPc6eX63o0qfmKPtNY
 Y5ph++WZsrF+s4nAFA/dC9GYr3SkyunuSiuHEXdCDbm9b/yjFwgmxfv+tpL+1qHvtQNW
 8MGJy0ItaYXmOt53fAi1q5SkMLDT7hyMGOmsuSUWCYbJvKl0gQW/m6TyqkmyaHKPMPFZ
 F9lrsnbRFTsiDxRdubSUSo7kiY69o6ud5da1KKB6k0VCTXh2L+GGjg9iwl3oeejb15Bv
 gtB3GZGwV1NM6IzjCnTUMnQEqTXe+J04OdIo/MmdUnI5uXpOgLKnd+PAAt8fCR0IvZ+Q
 XIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bsuXsyuamqk9etMCjd8V0jynu8bAQMDlhN4YO0sQc44=;
 b=xNc7/LBV7RZ2JZDpg6fcqjperS5+nZUFVINWqbrW/ilXb2bgsRRkurhh+VGJ76ZNQb
 r8wt4Slyc9hDXswkiltbPvZQmIJKqBt2oA9OUyhZsGWIoZVNipKNzL9rxwTRz5KnjYYZ
 +bDNWoRC9a0UxXXLtXBs7nChpY9NluQz4K/42lNGxK7Kte7l8GxAkJM6CtPYnePWFQW8
 aDDQviKp+XHRwmEoJ0cL3emJs9wCVGIju8lm6/hgLUhyYiqit+ljYTZy+yxAKDfZZOIa
 IjoPc95b2usM9GI6HNhhdUDZf8I9aChglwK6asbpAChqxMOvKPPo9SWJTuj7JgrYquU0
 CiFw==
X-Gm-Message-State: AOAM5309+8EVbtjjESvoxwwshJE78IgSkRMDHOsbR0F2HFARALG8jvP6
 ImynhyqLBTEl+fFbu+88Iyl6rCB052g=
X-Google-Smtp-Source: ABdhPJwMRX/5Xc4/Cjm1OcpCbied8OUz3thep9yudRhACwlPn2bLVP+gUZYDyc92U2eG7AD+k6uPbw==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr1641771wmj.157.1644235797406; 
 Mon, 07 Feb 2022 04:09:57 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id r2sm17059077wmq.0.2022.02.07.04.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 04:09:56 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  7 Feb 2022 13:09:46 +0100
Message-Id: <20220207120946.1553618-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libbsd: bump to version 0.11.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libbsd/libbsd.hash | 8 +++++---
 package/libbsd/libbsd.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 17bb32e01..435ea5470 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,5 @@
-# From https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html
-sha512  a7015ea1ffa3766b1a4690526a25231898ad8275149b31fb6801082450172249997c36165626d101ffce53b59767a46676eebc0806426922fe4e773a0376c1f5  libbsd-0.11.3.tar.xz
-sha256  ff2fdeeb0fe8bcb9045fe91d69e8312a5b477c54db48dffe34dd1c0d730c5864  COPYING
+# From https://lists.freedesktop.org/archives/libbsd/2022-January/000322.html
+sha512  c52c19eddd53630aca14f9f6221f7b84aa9cc798b4bb91e867822b161793313aab872ac1c0350d29312a72fee6e2061f3910ff918b724ec171d8c9de5837c841  libbsd-0.11.5.tar.xz
+
+# License files (locally computed)
+sha256  3761714adb9c45fa588b77b372d6e75dcc9e6822cc2d6baa712007241aec714e  COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 86df8a97a..0654bef82 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.11.3
+LIBBSD_VERSION = 0.11.5
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
