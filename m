Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D65C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A5560FAA;
	Wed,  9 Mar 2022 22:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhIvAIV4bEvQ; Wed,  9 Mar 2022 22:01:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B9B760F88;
	Wed,  9 Mar 2022 22:01:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42DB51BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EB3960F18
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9w6fsysW5jp for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:01:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CBD260FCC
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:01:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id l10so2184361wmb.0
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 14:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEktT+CFBkqxi7yfe9GpRR3kO3BN9Z8EwArFq5HqnMg=;
 b=lLaVJU8R1CURtsMewgWA+xPET62aDYk+PhkhzgrnH1IUTcayQ+pYze6viHbnJMHPLj
 0pTHBwzyplNYZzp2hD0O0BIhsO4mzmjaQvXo2TIRSUIWAuBTpheIBhSpc5qItoJQN2Df
 N+BRIcshLS2YDfNREBOGyoEQqatbdXli16/VpU00Y4P7HT/jzd5BqOxt/2Qc+iBvCNI7
 /JJ0xw38NfafvZwanOmoOdv2G5txN28yZnOeJ5SfhLaG5byCekZL06RRS7pHp/TpUOkd
 iGnbWqS6MRTR0lSz4MtmWo2OqfcbUXEk+awRPwBCY8Un0TBU+GDmsYf8d0SwvLY0i332
 Jdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEktT+CFBkqxi7yfe9GpRR3kO3BN9Z8EwArFq5HqnMg=;
 b=BFoaPiiEdiouRW9d4NbJ5ArYCaXDuDTL2PFCONAfl6B0qwEYf0515XzEIrrNfq+2qB
 JmJkUu5NS/tUTo32xFHfe/accomgbH4fUxJZAEOkD0j+L2NUplBuRCBS9l6M8UaeSU6/
 fFAU9t83AFdy/H0QCWzoAFBkVNyqgjB8XYEWUtwb3ZYW26JwTn/xoH8+mHIp1uI5H4/u
 UUf1/kWNepYzwkLOFIZPA0Krmw7ZLBeDDHI7VLxWydYce7YxlvZYFrMTAwQOoE23MLpn
 2sYBYvBo4kLhxfJf1Kx9hcspkWhKy6Id33RMvMemYkVxhsjghwdHmq3ra5tX0hIYc3Bj
 IMOQ==
X-Gm-Message-State: AOAM530kquiSx6q7Sd2LBOQx6b8Th4/l2KtFDWhWa0mPunPRgkCg6il/
 UBsHyy+nfFpfPOTk4PSeBhr7Vhbw28o=
X-Google-Smtp-Source: ABdhPJzpfo8Z1TYhtbjYH8TfPvo71k0GWAoSS7gvSodFuDvVnCpnoyxEnaGzUNAZsGDuYJOi0uU2QA==
X-Received: by 2002:a05:600c:3589:b0:389:cf43:eaf7 with SMTP id
 p9-20020a05600c358900b00389cf43eaf7mr1138806wmq.200.1646863267794; 
 Wed, 09 Mar 2022 14:01:07 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm2553128wrw.57.2022.03.09.14.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:01:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 23:00:18 +0100
Message-Id: <20220309220018.786891-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
References: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 3/3] package/gerbera: bump to version 1.10.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/gerbera/gerbera/releases/tag/v1.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add cmake patches to the serie

 package/gerbera/0001-Fix-for-fmt-8-0.patch | 44 ----------------------
 package/gerbera/gerbera.hash               |  2 +-
 package/gerbera/gerbera.mk                 |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 package/gerbera/0001-Fix-for-fmt-8-0.patch

diff --git a/package/gerbera/0001-Fix-for-fmt-8-0.patch b/package/gerbera/0001-Fix-for-fmt-8-0.patch
deleted file mode 100644
index c4419209a5..0000000000
--- a/package/gerbera/0001-Fix-for-fmt-8-0.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 82d84ac5e62c23e717198fc7b2ef190ff95e70d1 Mon Sep 17 00:00:00 2001
-From: kyak <bas@bmail.ru>
-Date: Wed, 12 Jan 2022 19:41:37 +0300
-Subject: [PATCH] Fix for fmt > 8.0
-
-[Retrieved from:
-https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/util/logger.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/src/util/logger.h b/src/util/logger.h
-index 58696e52f..ba64afa79 100644
---- a/src/util/logger.h
-+++ b/src/util/logger.h
-@@ -32,7 +32,9 @@
- #ifndef __LOGGER_H__
- #define __LOGGER_H__
- 
-+#include <fmt/format.h>
- #include <spdlog/spdlog.h>
-+#include <type_traits>
- 
- #define log_debug SPDLOG_DEBUG
- #define log_info SPDLOG_INFO
-@@ -40,4 +42,17 @@
- #define log_error SPDLOG_ERROR
- #define log_js SPDLOG_INFO
- 
-+#if FMT_VERSION >= 80100
-+template <typename T>
-+struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
-+    : formatter<std::underlying_type_t<T>> {
-+    template <typename FormatContext>
-+    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
-+    {
-+        return fmt::formatter<std::underlying_type_t<T>>::format(
-+            static_cast<std::underlying_type_t<T>>(value), ctx);
-+    }
-+};
-+#endif
-+
- #endif // __LOGGER_H__
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 5dcd364c33..89ac9ad55a 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dee562cc5d22e8442e2fe1620b073bda612c80f9c4a8333311c647db06c1c4cd  gerbera-1.9.2.tar.gz
+sha256  bd6c7b2c6380e2e265a998bbc0df9eec14b9c6a65bc91e7f2c0ae0b67fd0c9cf  gerbera-1.10.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index ab49f661ac..6acdfb86ac 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.9.2
+GERBERA_VERSION = 1.10.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
