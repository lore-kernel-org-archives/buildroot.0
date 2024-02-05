Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35744C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 19:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 862DC4039D;
	Mon,  5 Feb 2024 19:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 862DC4039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMxoxsBIkNzr; Mon,  5 Feb 2024 19:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3353740593;
	Mon,  5 Feb 2024 19:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3353740593
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 167711BF3BE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 19:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1F8081F82
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 19:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F8081F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROUurVIHXfnS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 19:33:27 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07E5581F81
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 19:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E5581F81
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7bee8858a8aso206542839f.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 11:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707161605; x=1707766405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jR2aix2aK9W3rRr4cpOUaBEhhS2u1AMa7K8ioNQXEGM=;
 b=PuRt/18EuJ4kYejBWzrajFZCl7I15dClpny6YRT1oBr9ZwRrKVogxD4VEAe8XOOU8+
 MLNSw9Cf1dwEHcEIjMO1Q2IG7zLeBJxOcmxCQVQ2XsdqG28/7CYk9ERFI0vDAt5e+NoS
 PWbhrozKqHGm3lDzv5GBH6komUv8s5NSh2Dx0lxRqgIhKDfJgv+0dVSTaBq8WCqOeCjz
 evlVimb4GR2CRseJV9dqfbl8wtpxzvTI3KAiEhSCiXLMGbvtheX5kLEd2X0gy25yaw6f
 LVYfNCCYSXktLzkSRWBYXelga6t7cQ4TKkhEf+Xvo0TmDLO5Q1i2GTh+myDQVl+ebsXZ
 UgkQ==
X-Gm-Message-State: AOJu0YxXdlEI3rkMUf4l6r/SYXqqsqhFWk/SRZdsHWowucevFeGs5s9C
 Wtmx/qDaPpkSmV8K1t4Xax+HyDVmJu484Uth0l4mKoLj3Ia2hFf2q3vfm7feEfM=
X-Google-Smtp-Source: AGHT+IElG69RI/dvI3Kfjc6JN0XYDI0YxRhmouHckCyYj2kG57s1Aq7qREeJmg+56HrOm3DtBlTGrQ==
X-Received: by 2002:a05:6e02:2196:b0:363:ac17:f529 with SMTP id
 j22-20020a056e02219600b00363ac17f529mr978439ila.9.1707161605278; 
 Mon, 05 Feb 2024 11:33:25 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVpXyX3YjgTmzy23GGOIeB6ABa09yHmmDggphsEmJLVwGM4+LhHz4G7b+GHfJRqDgWEgXI7cfOuuQ3ypaa0mxQLnFYqIU9ZCMlH
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 cv8-20020a056e023b8800b003627a7f95a7sm95873ilb.0.2024.02.05.11.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 11:33:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 12:33:23 -0700
Message-Id: <20240205193323.115009-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707161605; x=1707766405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jR2aix2aK9W3rRr4cpOUaBEhhS2u1AMa7K8ioNQXEGM=;
 b=SaMg+lFSpO9eysZrW+Z/Wa9Uq/JZk/pVdGZjnKmN464YMkRdvcQZY29uRdr2rs9M/i
 WxsRaWmBh/p557UkbaZArb+Igc7M/LPqDXIWj1j1/F3klUhVki5YRemH/668ycunRsH7
 B4Zvaw4ysEeGFhAvTwGSdBKgil5hhRzLIku82PMDZg0eNYgEAD47Cz2pFXnMcHKXQqY8
 RjsiFVrmP/hC2B5iFbLOqEjEk4E+kHu93TvBM+rxtRh6WFjulLw6JwEDmUJx3lMVrPMH
 2/iAh2IVc9m0jYK6mJjIG0n5TS+47ncM2FhWIPBnq3vxq0bo2aLWISxn41bDiaEi+aom
 qrYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SaMg+lFS
Subject: [Buildroot] [PATCH v2 1/1] package/{rust,
 rust-bin}: bump to version 1.75.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link to Rust 1.75.0 announcement:
https://blog.rust-lang.org/2023/12/28/Rust-1.75.0.html

Drop all mips platforms from target tier 2 platforms due to upstream
dropping them to tier 3.

See: https://github.com/rust-lang/compiler-team/issues/648

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Changes v1 -> v2:
  - fix typo
---
 package/rust-bin/rust-bin.hash | 204 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 package/rustc/Config.in.host   |   8 --
 5 files changed, 101 insertions(+), 121 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index d44cb2cb67..b6fc7806f2 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,111 +1,99 @@
-# From https://static.rust-lang.org/dist/rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  88d0cd0407ca5bb73b5d72956d85e31e057657c7ec09a58ca634cf36bd5cf626  rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  f58cdf15717e7f6506088e753ffef3ec655a4ccd932eae280d6cb68b0ee3feca  rust-1.74.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  d272cec30f3461647861d120af53946142fa2f969f43040c2685425cb67c7d79  rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  17df1fa64083fa508576062a651577e0741d02f4ae5771518a72fd4ea483b00f  rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  054a98e8e85e94c187ff8bc16bac8011747839c9ad73584fdd87b904f137eb23  rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  4abc1499e91cfadf7610a08271d1f5ff9284a54ba4a0ba60f105bb9b2413169e  rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  3196fd6e4453cd2191e5f8c4f63eaffd045cc1884cf4b64d94990aa81232f85f  rust-1.74.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  5483e32fe962e9123cf49c9cf169e60640d4c9d0aad1a054dd4bf232f0f012be  rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  a776e7b41991ef7a50706d1f9b7752a8d963e67297bfc22471d6e68d544349cc  rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  d712e44d57f3732c294affb26c07d8fb79f25c716b16a4bde910390f34cc9959  rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  38ccd7eeb30e481a27533ec1450c1eb4f3c3fee284f702ee64676b3831bde425  rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  5f1b890faa083afd97ed53c67d859f4de89abe9a059b48c98217d8ee015bedeb  rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  9b57973a9d23e713799169c3b39282655b742c9182e21270f53a3bb46af516f3  rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  26bad270c96de6ca0abbad4a2be63f994fede26b19cfab3362479668f3d1d5c5  rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  c567bf8e062daead8a256ee3097e724e1f70a4be5f69a74c3722719fb338af27  rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  96c81d327c4cd5cd35541dae3db4ed6eef6a943c78b0595396e88264a692b5e2  rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  339b4bf274ba569245a3e7bc1c9e238ce64c1942c5510fb19a4cacae37aa8aa9  rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  915c3648772d1b00b491a204239362aac33b213e95ac7e818b2001a40aae800a  rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  e0a61bd2f33e5929a47654dccc5387c56aa847ab028ff2f1992b4dc82da677f0  rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  7402c633f1a765053ca9bd4c03d65ece67651af9ce3698781a8d2a271e76cbaa  rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz.asc
-sha256  7c01117e7db5b77880d2ed5f3874ae10cdf9a3d2d042fc06011a8f5f8346b66c  rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-musl.tar.xz.asc
-sha256  b2781008ab93083970d5bf18782f6611f80d5b2a0aa1eaf6e6a44e8b0c146d9b  rust-std-1.74.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  de7bfa755339d81d0f375c04a6b5432fba8452fdc72154fbe5cd5e1147902b90  rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-musl.tar.xz.asc
-sha256  1d0a2aa7fc04896bb73d08ec6b7247d9f8e2db46532c31adff3d7944d66dfb4b  rust-std-1.74.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mips-unknown-linux-musl.tar.xz.asc
-sha256  c1721bb1f47941b1e6acc2f91b326d9172bf401dd88e92abacbb8084ecbc568f  rust-std-1.74.1-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  d2680c31aabfa896301689a0a03206aad31a59111a3c041c357ba5508f56dcfc  rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  7a8b6f7cc454efb57f575ba50956f2530e192ab50c622acf38b29a42a5bb31e0  rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  733995dec75a90d4039bc3a6e11c44e256bfc4cb074e46a67e2aebfe1ec69a26  rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  7fb458560bccae13f6558df43d5e17f177a084fdcb605d500eda63bc1ac3eb58  rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  931f975a4a4c8dc17552d965b276c7211e25f8c5deec1f41f5db5c181fa15320  rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  40781d07bb9a23d57c2440d70fee6385d8d40553b739d835c38fd0abe96d7ec5  rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  2c4de6689f5008289b791ad15b8cdc2d69947985b81b77d4dbe5d31632532e1d  rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  781403a12fef605250869aeb843be6b7f98ed6c0a62f0349fda53ee4d9d8e296  rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  e19c0d79b385454a8e8c9f27c3ca9779ffac778d8b7cd8de701ce413f492d9f1  rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  df435e3254c03ccbfc9e733ae33b399f5f99bd488974bc07d8b1db91a12ee95b  rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  98f190039c7e7922838f9716443b7ddfec2aa3dc229f5b1813a26591c557997e  rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  990845fa017f4dc55b866ffbfba3670e88b5b3465f420a212a372169fdf98d30  rust-1.75.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  90e51bf23bf94614ddb685211bd6df7c5a8c77065c715f89793e1465f408e8c2  rust-1.75.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  0b85f973c2a3c54b97edd7195069af4de5b5365c50c251a44e934d447ef5253b  rust-1.75.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  0b69f2c6b8dc010348b65ebb37d14429c858a42af50f45ce21359f65494d8b95  rust-1.75.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  05f8a6b80afd307201c0888a5e4c664412c32596f77bdc03196a93b7bbaf6dc4  rust-1.75.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  fa5a6911cccad0aee8d00a4657ee577122f4d3014672c0cd31583c362029d4c0  rust-1.75.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  da1848e70b781dabb5c397f456be797beedcda075505a96e7bdadc1c6c7a196f  rust-1.75.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.75.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.75.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  6bf166ddcad545aa26aa2d12a186454d7697133b52b7fbbd271ce3ee1ecfedc6  rust-1.75.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  2ea0dc380ac1fced245bafadafd0da50167a4a416b6011e3d73ba3e657a71d15  rust-std-1.75.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  30faa30402c4d3455efc4e3a510668784908223306bd766289766e6b10a5cb26  rust-std-1.75.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  e23074ba9e2882a349b8af79a5c6efe8ffe9e644b702e802f2def12310c8adc9  rust-std-1.75.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  c42114c9fb2ba1426c9dd648b6dc991217f95b8997cc7f5cbcf677068647827e  rust-std-1.75.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  586486d1aae50055ad09cec2a2239c176f66cc9138a5588a200fda5f3de498c3  rust-std-1.75.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  fdec58e71ada2344be89e6a2c5a84f5ccedda4e3c9d04f2dbd945b6716681706  rust-std-1.75.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  5a3286edef55ef48ebc65c60f8727c9ab667db54935ac7a962bacad261a1e577  rust-std-1.75.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  907ce65a7bd3d4c4dbda48a0af8f1d0d68de21fc94148450eb8fafab7449c797  rust-std-1.75.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  6092b31dd6de399f4d323c743d383e1854dc4e4c2150d44dff756ce416aaebdc  rust-std-1.75.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  218fb7b652d1ae654df5d16ab60748a08285d1e5ea5897d20dc12abe6c7ba096  rust-std-1.75.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  1674e8b8a57817e338ee3778852a8e089c5c99e38c0a9a2910b9cd1611b43bcf  rust-std-1.75.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  65c1c23c48a537fed5348be109ded1d2456e6952a99cdb6eaf92de1713185727  rust-std-1.75.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  7bdc6cd915a47e116ca78e07fe8d5d8acb6217e2aa6187806f782d81853a39b3  rust-std-1.75.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  f8b90d0de38695a17c71dd06f5dd08afc58d767754f7d2302b5329890c7ee447  rust-std-1.75.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  42c0aba08ddcad191c84adcb5b6479b4599b9e4656e4e2b6d3ed5b46fa4a04fb  rust-std-1.75.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  235f7787d3fa3b3155c32fc8d638dbecd220f2f2dfb26677c01a10295d78e35f  rust-std-1.75.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  eb56d591650773c7ce00f32fde1adcb878b4010167f348ea167d492fba8628d0  rust-std-1.75.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  776ea8d200f65cacdb619eecae319511ec2ab398321c8d976c846b9dc44b87d5  rust-std-1.75.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  22286818e4f0f13f712082e7a740aceb32e28ab3f568d6ed0e9e06b4972b30f5  rust-std-1.75.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  35db7870fbe27308c2a9bad0371cd05af2fd2975e00b7f5a5bb305798960a9cb  rust-std-1.75.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  810be45b498c4ce1ba9181702a2534c5a35e52fbab547d94b62f70e28388748d  rust-std-1.75.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  6943fda4f3958f28883cc5fb9f455611cc42f4d228841984b8a2a0123e7b65a7  rust-std-1.75.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  136b132199f7bbda2aa0bbff6d1e6ae7d5fca2994a2f2a432a5e99de224b6314  rust-std-1.75.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.75.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.75.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  3728f2d2266b5c87fe2a7ae9c46fc43d06f8c855d7d0f141de6bcd24b43ae919  rust-std-1.75.0-x86_64-unknown-linux-musl.tar.xz
 # Locally  generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index ca35d27d1c..6cee57ece9 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.74.1
+RUST_BIN_VERSION = 1.75.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 175fa71baf..12f91211d0 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.74.1-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.74.1-src.tar.xz.asc
-sha256  b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e  rustc-1.74.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.75.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.75.0-src.tar.xz.asc
+sha256  4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340  rustc-1.75.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index f7a5c0fcd5..793544df1b 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.74.1
+RUST_VERSION = 1.75.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index baa68994e6..3ac1a1797e 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -88,14 +88,6 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
 	# i686-unknown-linux-musl
 	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
-	# mips-unknown-linux-musl
-	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
-	# mips64-unknown-linux-muslabi64
-	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
-	# mips64el-unknown-linux-muslabi64
-	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
-	# mipsel-unknown-linux-musl
-	default y if BR2_mipsel && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
 	# sparc64-unknown-linux-gnu
 	default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
