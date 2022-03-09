Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF08C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B469440534;
	Wed,  9 Mar 2022 21:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X40qUzUOHNBm; Wed,  9 Mar 2022 21:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5823640525;
	Wed,  9 Mar 2022 21:42:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8831BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9001B41899
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibtWSJoAl4Sh for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:42:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 753F941890
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:42:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id i66so2120597wma.5
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 13:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lGuifMGleOm96YcY5/HeDzSQHIMakvaHw/h3Y2TRVUY=;
 b=NdCcmvQ+pJq9RpefStkXss+vozrTkkiynNon3pFtwnonki6QbHE5YxoqU+r3UHP7Kw
 3KU6GNL6A80sEro0D1i+xeDG2EgPaCuPjkjgBfLHdsf8wEARtxHKHIqHuGO4DEDfiE5Z
 KhwhOR9EgkHwHR0/Qu0Su6ft8u5tqei8sefj6cYixfgV+vos+BD8ZHRg+43S5E8zI17f
 8JRuXJj6OzZ35BE3tkyaVoubpcBhmD2N4rlm9MEiUt/i3PB3DHoqGQrkWSmvcDwju17f
 LXJhEVQjNq6bkftrWNhvRkUl/zThrNHsgfRj3nF7KNUyfAKQZhBk9NuH2sCmvb7LdzHr
 HLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lGuifMGleOm96YcY5/HeDzSQHIMakvaHw/h3Y2TRVUY=;
 b=l98OWZg1dlEztzRan9+umYUYRwwvl9MGAsffU6xJLrPTCEsIswWmuaJJ6Ma11u+N/E
 4aGMINat+aUiq+wt4uhtH/aCpUN4SeCNh9+bV+okm+hc//Lyfpth/RiXETXj7sB0FD/U
 /PuSQUfCWxIQJp/fuDrNIqKvhnleF0v74t21siFLxS5GCxPE0IlWuW60UiZlpwmk6ite
 Ohc9KQiROmJEe7GJcB8+vfFyF9M/+v+DA3tEgogCs8TDyyQKuZc8huSgnCu5XvmSf5XZ
 nPaTU1ypV/TFYfvadLgNGpuyEdjR84/gqdRF5+Sj1rmBUPJYJseqeuUGqAl2PXODTBQP
 CVtQ==
X-Gm-Message-State: AOAM532O5IZMEwID621p8RSyzYCW+/9b3B8bACh37pqgX0tsCZntaSwu
 rVz9jJ8tTCTIbJWiWpOQP/8P/MaJnEY=
X-Google-Smtp-Source: ABdhPJyht7y6+9iJcux5AbPwZhLo2SmT9Ogy5UVgyIv1MkO6zLoR/mHqCuQQUeMFMMy57+dBANrUOQ==
X-Received: by 2002:a05:600c:190c:b0:389:8f94:fcac with SMTP id
 j12-20020a05600c190c00b003898f94fcacmr1082110wmq.27.1646862159324; 
 Wed, 09 Mar 2022 13:42:39 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b00389d7b820a3sm695135wmq.28.2022.03.09.13.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 13:42:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 22:41:56 +0100
Message-Id: <20220309214156.776849-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.10.0
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

Drop patch (already in version)

https://github.com/gerbera/gerbera/releases/tag/v1.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
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
