Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E36C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A8541D7B;
	Sat,  3 Feb 2024 18:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A8541D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTtMsWXPDNG2; Sat,  3 Feb 2024 18:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F79541B77;
	Sat,  3 Feb 2024 18:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F79541B77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4B6F1BF285
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D9FC60ABD
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D9FC60ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVh4PTtJ-82b for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 18:08:15 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80BC860774
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 18:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BC860774
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fc6343bd2so15228945e9.1
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 10:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706983693; x=1707588493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u97W0gClWdJOLaQwi4Br7y4dxy9RVXwp+oui0GSxs+U=;
 b=J3v/xtAHv6Mszs6kpR4TEDl6ivMsNWvn9Mt0o+1pZJa43/NlYaZnfvHLN8/SWmQJSJ
 FyTdji4Sskrt2xhM41CFzALGmj2fXz4CoJSK3xn1iwY5D3jBi6AoX6/9TC9d3WWRS7sy
 pMhPWIAbFrCRlI6nAcKJuZYRuuMAApPIViSSBxOFvvHePnZELT9fAUVpRZORweAJvhoo
 MduFdlPt0yo3n2YzI1H/nxJ2xtwrs9PkJNLo8UxO418hUVAr2XeVfjmorSAlMJfZLWxI
 GSAi188qTAfu/ZW9argOu7Y7JzIb36/gl3pEYRK56q5NPWni2XkDot3Q8GbU9N5q2V/f
 6eKQ==
X-Gm-Message-State: AOJu0YwxMk5yF3Ds8xszAOtD5N0Hm2io7kEeH8ezv33nK/M8dbr+n07c
 gY5sjC56qNc136MPjzUTdypSYUiFXUanrvqaCmCzuEshWJzKLk3iXwsWJAtVSFw=
X-Google-Smtp-Source: AGHT+IHlLNfEV6CyCdXz192DTxWtTmmrUvqkUmq82xWoprldbAbcg+EBqwjKEtYbdblvy+WW0uvJQg==
X-Received: by 2002:a05:600c:5007:b0:40f:d34d:d4ea with SMTP id
 n7-20020a05600c500700b0040fd34dd4eamr1066505wmr.31.1706983693055; 
 Sat, 03 Feb 2024 10:08:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b0040fd2f3dc0esm1677200wms.45.2024.02.03.10.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:08:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 19:08:10 +0100
Message-ID: <20240203180810.146553-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706983693; x=1707588493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u97W0gClWdJOLaQwi4Br7y4dxy9RVXwp+oui0GSxs+U=;
 b=R1D3g6at07CckAAeAwz25UVDadIL9oJ8o63FA+PesPdJFVSig5MKfWraFQNKPphY/B
 lQMkZZCXhNjiEpNZ2kW1WG8pjEvYmxJfhAVHMOCFBI/6nqDBrxvrJC4sWCkCikdcaaJJ
 w3X50Dfm+I3lBPycR5eypg/VUqvX11duEtmrUqLjS+dXyp9C3i2ngQNh6m6ceb1R/eLQ
 hxS7jhvrqIprlKEMlg8iDXK4V1dKZMsDIX5tJxt0SIMMuLcRVzsuPLuFsT8Jtrftfjvd
 a0WYMrTw7mcaaZWoicDcbsxnJSxA1Rk6KZixZ7vZpkE0a5j+eekHHGBxVx8UhxjSrTXY
 gkOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R1D3g6at
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: update
 XLIB_LIBXPM_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:libxpm_project:libxpm has been deprecated in favor of
cpe:2.3:a:x.org:libxpm in October 2023:

  <cpe-item name="cpe:/a:libxpm_project:libxpm:3.5.15" deprecated="true" deprecation_date="2023-10-17T15:55:35.850Z">
    <title xml:lang="en-US">Libxpm Project Libxpm 3.5.15</title>
      <reference href="https://gitlab.freedesktop.org/xorg/lib/libxpm/-/tags">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libxpm_project:libxpm:3.5.15:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:x.org:libxpm:3.5.15:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 0bba3ea946..1239ba0d4d 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -9,7 +9,7 @@ XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
 XLIB_LIBXPM_LICENSE_FILES = COPYING COPYRIGHT
-XLIB_LIBXPM_CPE_ID_VENDOR = libxpm_project
+XLIB_LIBXPM_CPE_ID_VENDOR = x.org
 XLIB_LIBXPM_CPE_ID_PRODUCT = libxpm
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
