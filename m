Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9025CC64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 22:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397BF80FA4;
	Tue, 28 Feb 2023 22:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 397BF80FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psFs-v0q2lJP; Tue, 28 Feb 2023 22:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6286580F76;
	Tue, 28 Feb 2023 22:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6286580F76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9AAF1BF580
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83DDC60AE2
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DDC60AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e6PxJAFWkGcQ for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 22:07:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D3C60AD4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78D3C60AD4
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 22:07:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so10610555wmb.3
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 14:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7DIoQtFnMuqzBu5MIfFzIfaqevvFn+Vt0g4wmibnaE=;
 b=kWNGoAY4GI85swAsVIFXGmdOrjBtmnY1dEvyE8mP2uSt8v+OSN46Xc+fLgWgH3jNdb
 brQPREEhRfCD0ALDulICNAAlpJOAohWdzlqwoim+kCmNnR9A0Tt01lAKHfgRIapSAQNz
 ciOU7TFj3MgMOIy1i6Ldbi+O9ZXKiwfPxSHkLfB2/TfnIDQL0/qf5YlQp56b6nMIhL3R
 f5lq/gPjgl24bQ4PCdNOLnt5T2FQnKKR1Z/X/fvuoXpCPArFZAuQGOzFSkUArvxZoXCD
 5cogBSQ299CGYKZ+HUk4MRwWxbUqxKc+1av99Gd3ViLrPfmP/Zv6hvU2dijSOMh9vO65
 yjtw==
X-Gm-Message-State: AO0yUKX+2aM5BZaoL0Vf3G/SC9srRE0mj/YdlvmhiJL4U1CCk+fQns1/
 O/yrj9rAWt11da54+uQnJX7XHvvjIfQ=
X-Google-Smtp-Source: AK7set//IZcmKRWK0zBibahiZchqgL9SncUCl71Nq8YbVoArZeHvgp3f2CZE/JbL/GQKMhKggQpnXA==
X-Received: by 2002:a05:600c:a696:b0:3da:1f6a:7b36 with SMTP id
 ip22-20020a05600ca69600b003da1f6a7b36mr3402351wmb.0.1677622071247; 
 Tue, 28 Feb 2023 14:07:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003dd1bd66e0dsm13588380wml.3.2023.02.28.14.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:07:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 23:07:41 +0100
Message-Id: <20230228220741.54827-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228220741.54827-1-fontaine.fabrice@gmail.com>
References: <20230228220741.54827-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677622071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7DIoQtFnMuqzBu5MIfFzIfaqevvFn+Vt0g4wmibnaE=;
 b=gROLYKKXncpc4kyblx6APL7vYeNy4UaJ3yXkT8pMnrgi+UFV5npzB981h/hMNhezjJ
 USMZ/IoxBnrWPOdN2/3Dh+Ms3Lw4jLNLEYwblDYeocIrTn8uL/H2OCMhImcz5vFLsDVm
 E8ySCi9FhotPtXb3tgofbbkjdC9pAFeXCnNW2/nTBV02kytiTs0C3Zfj52lV7ZQCCWNU
 YUMtIwAHSmZXx195beTY/DQximl24iLcoPsX4ZS3kY8mT9nLz8V8vZ/gj1pTWfBhds3F
 F7dr3g+t4CbeuG5H4qiSR6BiD8/RvqNx7nOgWJV+gD9VNmKX35/HS4ABK99ZgV9NNerM
 8xJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gROLYKKX
Subject: [Buildroot] [PATCH 3/3] package/proftpd: needs dynamic library
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

proftpd doesn't build statically because it does not use pkg-config to
retrieve its dependencies since its addition in commit
5d173ec4122b89857e6d93fc337311b1f87631c9:

/tmp/instance-13/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /tmp/instance-13/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libidn2.a(libunistring_la-striconveh.o): in function `iconv_carefully_1':
buildroot/build/libidn2-2.3.4/unistring/striconveh.c:233: undefined reference to `libiconv'

[...]

/tmp/instance-5/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.2.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: /tmp/instance-5/output-1/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(bio_lib.o): in function `BIO_free':
bio_lib.c:(.text+0x3f2): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/09f3f37b63dc68d31b18816b818df86fa3be095c
 - http://autobuild.buildroot.org/results/2aba5297206e44dc086c3138ace70e85739196f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proftpd/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 33ad2cea54..8ac1da3fed 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROFTPD
 	bool "proftpd"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	help
 	  ProFTPD, a highly configurable FTP server.
 
@@ -105,3 +106,7 @@ config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
 	  0 uses the default size of 1024.
 
 endif
+
+comment "proftpd needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
