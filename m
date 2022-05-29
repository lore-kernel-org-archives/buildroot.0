Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8F9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8428940AB4;
	Sun, 29 May 2022 13:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmFz228RvrN1; Sun, 29 May 2022 13:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7087A40B38;
	Sun, 29 May 2022 13:18:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71A751BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E25440477
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJl5oEx8yS7t for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A0DB40140
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e25so850930wra.11
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2KKTExRlwNKxEON497IYr2OG+hJYWqNVcJkwhNSVSI=;
 b=JeCd8H8rozbDzuN/wXQvCoiFW+9Vu5kbl9X2iO3E1mAupobQpA5BXerLnaQW6Z7AXn
 GFhRhkLdZuJON/sVMhoXGfIMBxnnTgDOligJ4hSxhwsGF0gA6spoVe3f71SFTNlZrNJ8
 bFq41bGczFCAuUxnxWvsKuNDo13sqeTWCuSlXibzY8n0L/MCA3u6MNx3in7wuA8oCDHY
 XLlTabzDFIuWIJcyvhjQVXpzHMskJd0+UvyS31cP9rF75AUvVAaMBAqg13VFBvfFS9Vz
 ptp2kcM3ayx/nywLeIQWn/WCI3lYnpDqvGcP4qj7b5XCbGh8+QUB3KXfhcLLfNv+/X+n
 U/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2KKTExRlwNKxEON497IYr2OG+hJYWqNVcJkwhNSVSI=;
 b=7YuoDSjHhobTgO83ee4l8V7IDt/WmqHbV1znqXYm5x0BbHTuzIElPAQNNffp4xsGg7
 QNwgNT2xoUI4zsCiaIHLi/GknqygV3YQNCDVine3b48Vdt6fJTlb3N3G2UD8AIB54KNh
 e2/fZe4qiGRRr2lWGHnwPwiNSgIaU2Z5tWP2X40x9NKYuLcMhO89JfuvWPNmaE7+zkgn
 ecEOc9DODR0QPOvqERd2Pfb0UAJxyg9R4brivm9HqrzVbtARzyRiB9s4VE79b6srgMAJ
 Hg0PyUU6qgwdnG8+kdruUbQe8a5MrGo13BY1g1vgttiZHCA8cMSx6VvUwQkv78ZCcmeF
 jZVA==
X-Gm-Message-State: AOAM532yaxNoUL3L38ttrVqX8+3GntXY3pwpEKPTsqzAC9UO0z64PrSV
 zx1UhM7BWgU6y0pjCeqhJrZcLjNe5Zo=
X-Google-Smtp-Source: ABdhPJwtRfxzRey1RtTtc3sR/MyJY/BGqSSBrW7BJ3DVHCS/1s4hc+5vz7jaeTq3VF904BrV2ffx0Q==
X-Received: by 2002:a05:6000:186c:b0:20f:e176:df0b with SMTP id
 d12-20020a056000186c00b0020fe176df0bmr26082444wri.608.1653830303593; 
 Sun, 29 May 2022 06:18:23 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:22 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:04 +0200
Message-Id: <20220529131811.481017-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 04/11] package/gcc: disable
 libsanitizer for mips{el} and gcc > 12
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since [1], gcc contains a workaround for struct_kernel_stat_sz
definition and apply a local patch when updating libsanitizer with
upstream (llvm-project) [2].

Since gcc 12, the workaround is not enough and trigger the following
error:

In file included from ../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_linux.cpp:21:
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_linux.cpp:75:38: error: static assertion failed
   75 | COMPILER_CHECK(struct_kernel_stat_sz == sizeof(struct stat));
      |                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~

Disable libsanitizer for now.

Note: Only glibc toolchains are affected since libsanitizer is
disabled for musl and uClibc-ng	toolchains [3].

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/2510178606

[1] http://gcc.gnu.org/ml/gcc/2018-03/msg00133.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9f943b2446f2d0a345bbf9b4be3d3a4316372270
[3] https://git.buildroot.net/buildroot/commit/?id=5f4d658d888b539de9a6247ae5b1a0999de5d4ec

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/gcc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index e1f3935e56..73440e9e35 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -145,6 +145,12 @@ ifeq ($(BR2_mips64)$(BR2_mips64el)$(BR2_MIPS_NABI32),yy)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
+# libsanitizer bundled in gcc 12 fail to build for mips32 due to
+# mixing kernel and user struct stat.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12)$(BR2_mips)$(BR2_mipsel),yy)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 # The logic in libbacktrace/configure.ac to detect if __sync builtins
 # are available assumes they are as soon as target_subdir is not
 # empty, i.e when cross-compiling. However, some platforms do not have
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
