Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4CEC54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 16:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7B241919;
	Thu,  7 Mar 2024 16:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkhKKAvEE2Gh; Thu,  7 Mar 2024 16:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C977F41944
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C977F41944;
	Thu,  7 Mar 2024 16:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 242BD1BF5AA
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11651829B1
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5m2VrHwdk4Nf for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 16:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B72AF82969
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72AF82969
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B72AF82969
 for <buildroot@busybox.net>; Thu,  7 Mar 2024 16:52:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.100]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MyKHm-1quZ4x2ynU-00yiFQ; Thu, 07 Mar 2024 17:52:19 +0100
To: buildroot@busybox.net
Date: Thu,  7 Mar 2024 17:52:16 +0100
Message-ID: <20240307165218.10027-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307165218.10027-1-ps.report@gmx.net>
References: <20240307165218.10027-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ptjs9nXRVOST/7FDnnpOma4cDFcwoN0rG8MXDZmOS2uKoi8vXgC
 +FibdnWjsgz4+mae6zskt/r0ZmrvLi7u9ipP4xxr3k6HGGyxwfQGbzD/23PRfUQc4Rsmn0J
 VtA0HYoJpUNTKcE4Gc2h3wJO1bxDJ7IrOCAgVw3cTaIzgVLULcKritDjFAyFCZSkKd2+c0X
 ifICFBh5TFGgQq064mWQg==
UI-OutboundReport: notjunk:1;M01:P0:PNd1zahscQE=;G5ZF7cbV3+h6s4lRqtIhM5L/mHz
 ad3GhQJHJbgskvh/AK5AKyi/x47U2I+9jJNMLgEjVxm8JSdPplyN7oXw36lOtNd8mWCk6xq6k
 pdcTijAwV0Z/iV/6+SnnIzyTNBg+nUmuFaUgEb5ieKq1sQoCqwV4SbVKSiiG9tYcFQp6w4odM
 X8/paKIkHtgJm4Rzb3Rk+mXgLs4IMjXVSEOQZ5Rq9hFS7Oe3bi8ZmQalX4hAeCGLjr76AmWrJ
 VuEsxZGQFIvQyslISnKBkYNIq/5Jq94p6sDPSl6h+5zlHelIE3LC8kP5qIP6UlTBF2blIVcoj
 +jR0fUiXc7S8/ocDGVWrklDaoj+QIp4il/mrJJYSOba5D5NhdKjsFuppk/6qbPh67hJ7hz80Z
 6GYqyMfhr5Kre2FNSqHoqpAQ3rwYc0QLloUWiLpy8P9LFXiy0Cq9SPwESrEDUvbySwKB+/28f
 fL5k7xpNvmE+OcJkVLhGfPrTjzgOEldMvOr4rtJ7VrHLqqv/VtorWhUjAZT3ff1S+X26d8yXn
 fMk/y2eW2pLqiCi1XWiMG6LjcoNAO+6fDaens6euaYikyOoKVuxbP0/QKEETJH7ApGUOn3052
 FU/w57nlCL7/vbjDlQ+0osCKSn/MQWX+f5PiLUqcgOdKczDP56m4bADBksvDoqbrp1frejL79
 BrTdlO4esBMTiAQSCjIFNIaOzK1mdmojPSN7GDKrcCzokoXVd2+9dgVZAuhhCnL4LSbb5Hlri
 iRMUsd3j/tWe0nMrk+DAtZwToXIGHlyp4PEO0I6WBoHTRF+TNIjP2IBqECh332ieFaTevD+K4
 PwyFdXkiMTUyMJmHsQwesfQ3XjouRsP/80iICpC/bfIIE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1709830339; x=1710435139; i=ps.report@gmx.net;
 bh=1kdR/IESD9tBcY7e5P3edZ9evTpwe5G8PjFUtLUOOQ0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=GBWyKKG8YtLGl3HJ9giG2qve8G4sJobE+kRuoz4QVRWFH87UHbiShcggWx/MI5tt
 +AlGDhVL36Xosxd65CaS6OjrQMa5uoO/p/FwY8eZEuzbelt3h3VbCAi5fzHn4zEeA
 1A9Jsy1h1wub8w3MWqVrNLyYfluNmOfQEvNxzHBcIIff114d/W7LsaUyjBUSyYzt2
 ariuxGLyBTCT82HQyaXNXqchdgq2xnBYGprJKCt/3LzQOnKNDuHWsbv7wusA4ks7O
 S/B3ykE1ipvAIyLL7GSbDwemtKXFd2aQrI0niq4aHQeXbWRahRnR0tFpahw0Cztbq
 +t2lVSk8F0TzPaqO6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=GBWyKKG8
Subject: [Buildroot] [PATCH v1 2/4] package/xz: determine all autoconf
 options
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Determine all autoconf options (with default values) with the following
special cases:

- sandbox: use 'auto' (which will compile detect landlock in case
  kernel headers >= 5.13)

- unaligned-access: use 'auto' (which will default to yes for x86, x86-64,
  powerpc, powerpc64 and powcerpc64le and use compile detection for arm,
  aarch64 and riscv, see xz-5.6.0/configure line 21323 ff)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/xz/xz.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e35fbc0268..a9e33bd3df 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -13,6 +13,46 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
+XZ_CONF_OPTS = \
+	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
+	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
+	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
+	--enable-checks=crc32,crc64,sha256 \
+	--disable-external-sha256 \
+	--enable-microlzma \
+	--enable-lzip-decoder \
+	--enable-assembler \
+	--enable-clmul-crc \
+	--enable-arm64-crc32 \
+	--disable-small \
+	--enable-assume-ram=128 \
+	--enable-xz \
+	--enable-xzdec \
+	--enable-lzmadec \
+	--enable-lzmainfo \
+	--enable-lzma-links \
+	--enable-scripts \
+	--enable-sandbox=auto \
+	--enable-symbol-versions \
+	--enable-rpath \
+	--enable-largfile \
+	--enable-ifunc \
+	--enable-unaligned-access=auto \
+	--disable-unsafe-type-punning \
+	--disable-werror \
+	--disable-year2038
+
+HOST_XZ_CONF_OPTS = \
+	$(XZ_CONF_OPTS) \
+	--enable-nls \
+	--enable-threads
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+XZ_CONF_OPTS += --enable-nls
+else
+Z_CONF_OPTS += --disable-nls
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XZ_CONF_OPTS += --enable-threads
 else
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
