Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6914C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8730960C28;
	Thu, 30 Dec 2021 22:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Pdl4tLKVIpS; Thu, 30 Dec 2021 22:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06ECC60C25;
	Thu, 30 Dec 2021 22:49:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 069721BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2E8560C25
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H289K_nQ1rBQ for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:49:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46D4260C24
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:49:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so52962455wra.6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4n2lN8b9r/JhQ5Oj4SkOYRDcpjWHQJoC2KP5pLE08o=;
 b=En09iOOYsD6EJTmQN4VghroPFnbB8CYkQIyympNbcwn5SkVTahoDfrN7uwrOsUJf8N
 STr1DX9FYa1yaXgOpgdV5Gge1mp1n2dMgCUyYeKYxy0FY04zm1np+IfeJ0DAqaYWvugn
 hzFx/3pvtGxrFBGGLSq7Xm9WjfyEeBYqoI8nJT4/+Rp998QGB+sFpbzfkv8uvLbl0+Bb
 ZwOHnwM/wqji9p9Kpx0c5Umx9izAPk83bcZZfEsStPVghUCb5HKySA94L1liGpRkgMOQ
 e1pbwSTmAfAhbz1pj4r4sU/G4T/iHibkMb8Zz+rS+ByN9tNBcREjCAuMKGHEaRTPS7Lo
 apBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4n2lN8b9r/JhQ5Oj4SkOYRDcpjWHQJoC2KP5pLE08o=;
 b=xUwnTtqy+XnE6vyhh85ibHlGuuOTlC8R8wxgazViJbfyPKdmR9vGXatkFIyFwTTGIo
 +43jdvh3rtIC8+7CeDagqU+MOszLizQBkbDzLlOrh5kyesG6Bc/sMZQ4HNTuRHGKaESA
 rGRtmD9vc0FMEFrE0baJEvrmtAGbW71cZm3S+aGhxOTprygzbnDX+QVKSf3RcM7myLcf
 rs4mVFNh93KfWDEyJPNkIrpXtaziiuP2U+xmz54dR8mj4VzvsFWKv9pBpCf6tO+ooje0
 jENmpHA1FQuN8fYm+WL2av29cKaCN02fBiYd/pNJi/hDlCcMU/B1uTnIIRFO6j6WQRI2
 E1qQ==
X-Gm-Message-State: AOAM532xSGPH/tUcvlXcpjK7mJ3AUVUJL6o9f0mo9Do6Mixyo67w4/jS
 s2mw/rNMXes2BDvXACil7OfaAmVHN4U=
X-Google-Smtp-Source: ABdhPJyB5P8T6MBLrmhR06U+sz1np/gbZEaRhXYUyBbiFhyUYWQHDwlmNx+BjzcXoN3DjtGZUntx7w==
X-Received: by 2002:a5d:5746:: with SMTP id q6mr27022777wrw.163.1640904559520; 
 Thu, 30 Dec 2021 14:49:19 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id g187sm23679760wmg.40.2021.12.30.14.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 14:49:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:48:20 +0100
Message-Id: <20211230224820.3080102-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: fix typo
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

Fix typo added by commit 30ac432b419599a8744238fdea65cf08c0765b63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtasn1/libtasn1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index ecca00e79e..65b0868b79 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -20,7 +20,7 @@ LIBTASN1_CONF_ENV = MAKEINFO="true"
 
 LIBTASN1_CONF_OPTS = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
-LIBTANS1_PROGS = asn1Coding asn1Decoding asn1Parser
+LIBTASN1_PROGS = asn1Coding asn1Decoding asn1Parser
 
 # We only need the library
 define LIBTASN1_REMOVE_PROGS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
