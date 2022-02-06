Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056FFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F78660B12;
	Sun,  6 Feb 2022 14:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWYwbyARTuLo; Sun,  6 Feb 2022 14:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D9860ABE;
	Sun,  6 Feb 2022 14:07:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5621BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E888540201
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dOrP9sL5itWX for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:07:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F3FB400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:07:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e3so6431682wra.0
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4YiAtclIgbgEsIb4iDRL01YqmlOrbbpCQG61Pf2TRc=;
 b=PEetVroU7g9fUM99y4DPrlioZJQVGXWIyvNiFa7Is/vyRns/GFIVpq6c4+3reOGeVr
 n28mEMxbBIzfFXUTnhLw+BWzbsaGZff/2v1CUT1Ip0ETOQfiX36X6MHCpSm2dbE6hcz8
 pJQCIDEvugeNB0tSb92SxLQW9P6CZO+psF8BfRiMLZI06VvmKRSJXm6gbDpnW1VYG2ZU
 RwGIb8VEtMh4ti+d5z7PhpK9dDTlzvPUv0Q7yZ+CTtwMhzcZW4xufSxdJPGuy22b1PTu
 3t0pyZLAy3+DLZYelUjtbNbF0xvG+uryKxT/djgrhiwOCF9c0d8Noj+SUE3GfsILTJYw
 3WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4YiAtclIgbgEsIb4iDRL01YqmlOrbbpCQG61Pf2TRc=;
 b=TttxkrnHYaH2Obt1+eXIdD7qX/L1HTmR2eedYnCFP2DIS4M6sZeAygGVnv9p2OYaA4
 Xm7mJ+ggEo6Oxb2z5DquVpasyQENe2DNn8tPzg9sAqKcOyLVmaiTxqQJSsUuxW3GoMAX
 uimhsN1Rs0DwoQqypAmrHnyX/Xer+MToQBcvsRdVf2xG0+2yBRX/7as5v3cYSV9nl6h+
 yrDm+1qP8C0tFs4+HMRqcXtsOiCR9NZa9hBn91zpsbN6RJvbjBx2c3WvMGco8XzNNM3O
 ifG/3mo+1arOcXAQWKNbpJuhcqxzvj5W2t5QbCP0LyeuULvoy1C1AdDV9Zw6R9EbBd/I
 vvCw==
X-Gm-Message-State: AOAM533KWh55oD+ZabZO9Cy2VI9x0A5+WJ4LqSLRII70zwf1k/+Npr+L
 qzaigopCI5znJ6tITktTczlY8+9xcho=
X-Google-Smtp-Source: ABdhPJzNlvY5OM1YEt0ZWzmMNNHMQ45GJPsto4RfcIAS1PuP28x3S1T6yVfwEa+oTVA4ktmGWO7LeA==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr6403492wri.90.1644156432460;
 Sun, 06 Feb 2022 06:07:12 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id e3sm1475150wrr.94.2022.02.06.06.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:07:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:04:59 +0100
Message-Id: <20220206140459.1622884-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix build with fmt > 8.0
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

Fix the following build failure raised since bump of fmt to version
8.1.1 in commit ec7fd50d08690a383fec40748ac9b78c3f764316:

/home/peko/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/fmt/core.h:1728:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
       formattable,
       ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/009db44f83c3b02025c910ce4f190bd709c5ab49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gerbera/0001-Fix-for-fmt-8-0.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/gerbera/0001-Fix-for-fmt-8-0.patch

diff --git a/package/gerbera/0001-Fix-for-fmt-8-0.patch b/package/gerbera/0001-Fix-for-fmt-8-0.patch
new file mode 100644
index 0000000000..c4419209a5
--- /dev/null
+++ b/package/gerbera/0001-Fix-for-fmt-8-0.patch
@@ -0,0 +1,44 @@
+From 82d84ac5e62c23e717198fc7b2ef190ff95e70d1 Mon Sep 17 00:00:00 2001
+From: kyak <bas@bmail.ru>
+Date: Wed, 12 Jan 2022 19:41:37 +0300
+Subject: [PATCH] Fix for fmt > 8.0
+
+[Retrieved from:
+https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/util/logger.h | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/util/logger.h b/src/util/logger.h
+index 58696e52f..ba64afa79 100644
+--- a/src/util/logger.h
++++ b/src/util/logger.h
+@@ -32,7 +32,9 @@
+ #ifndef __LOGGER_H__
+ #define __LOGGER_H__
+ 
++#include <fmt/format.h>
+ #include <spdlog/spdlog.h>
++#include <type_traits>
+ 
+ #define log_debug SPDLOG_DEBUG
+ #define log_info SPDLOG_INFO
+@@ -40,4 +42,17 @@
+ #define log_error SPDLOG_ERROR
+ #define log_js SPDLOG_INFO
+ 
++#if FMT_VERSION >= 80100
++template <typename T>
++struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
++    : formatter<std::underlying_type_t<T>> {
++    template <typename FormatContext>
++    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
++    {
++        return fmt::formatter<std::underlying_type_t<T>>::format(
++            static_cast<std::underlying_type_t<T>>(value), ctx);
++    }
++};
++#endif
++
+ #endif // __LOGGER_H__
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
