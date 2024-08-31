Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B870CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 18:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8976940291;
	Sat, 31 Aug 2024 18:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bl8hz08M3YQk; Sat, 31 Aug 2024 18:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378BF40298
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378BF40298;
	Sat, 31 Aug 2024 18:21:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F21A21BF316
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC51A4026B
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 18:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L02cGQ4tqzPX for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 18:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B65AC400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B65AC400E4
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B65AC400E4
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 18:21:24 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so3710052e87.2
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 11:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725128482; x=1725733282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwuRqJJVXRP3P1Zcg5uxKTh67diBAzdRzRNDKpPEIwA=;
 b=uABDwjVVPPiUfF7Wmi+986O36WjbwtymQh5LVWmnmw3GNkqYXFth9NX4we5MbaFiXG
 T59amBPHKmzb7ytvLmYd3/RT7oquFnRF86ULicFxik1Qr7740DRLv7GZ/fWO67n8xf79
 Sark83k9EcQHNbk61b39HnDBDAXKWoxw5zxui+FG0G3jLo1uY2pGQ5kxD0Y8hqKekpqX
 +ehrWJ/2AnHRzHH+xI44WddMMwW4fweFYHXFIGmvnQ1XKMeueWEBkWxe7QwoV7UqRPYF
 mQMeeFCNmZdXviqWZ4HyIR2KOtMWWSN43yli1bIJVzbQufPhcuT1UH/S3vkt+L5cQR0f
 grvg==
X-Gm-Message-State: AOJu0YxU8QkH2tzVR/MBccf/B9mUuvGv5OJeAv+jKHrOfKn45PGUIHJp
 C0vCQ4CFlsUxVctVnc/wcOkzOL9kwl+BDzmvSZ2dT4dSey5yK5R0Z7u8C7Jy
X-Google-Smtp-Source: AGHT+IFw2sDkN0BjKzqvcugUIG2IViMjkyT4GxUqwbOrOwTkomJaqT9Qqo0LQOHtH+sEaL4V9DxSdQ==
X-Received: by 2002:a05:6512:318d:b0:533:4652:9848 with SMTP id
 2adb3069b0e04-53546b4b20emr3607249e87.32.1725128481091; 
 Sat, 31 Aug 2024 11:21:21 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-535407ac43fsm1012766e87.97.2024.08.31.11.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 11:21:20 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 21:21:13 +0300
Message-ID: <20240831182116.2462286-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725128482; x=1725733282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cwuRqJJVXRP3P1Zcg5uxKTh67diBAzdRzRNDKpPEIwA=;
 b=O2SZRxLw5XLx1PxqwMnGDrNs2LdZU7MfvrSqCxhvgNnt1fUl++kdvTUu0gOviaRWQS
 j3PvFHAr/KuKvwULvsnxlqPyUo2PO5IccrUN8adda5nVLNTV4IhquEcVm0M85Ygq2P0/
 Ogl8jEmaMGYlQ73WunDK/gRgUvcgwiLOJZgWA/xBC7nOaT4I+vGUNEsyMk2S3h4xYnfW
 FSM6MM+Wq8u9m1StTLIoZnEB5hRpmiMFkZIKyjjIEcToI+ykoMrK2D9sK5Y65b96hxHn
 YEP8j8I51AIpqvCXEm8N2aqNtVi1FHa+eG0U03WfK4a0E/sQiF+Le/SyigWkC64u79o9
 tRzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O2SZRxLw
Subject: [Buildroot] [PATCH] package/elfutils: enable zstd for host package
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable zstd support in host-elfutils by default. One possible use-case
for this feature is building Linux kernel where BTF support is enabled
together with compression of debugging information using zstd.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/elfutils/elfutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 8738af7751..1a1aca37b3 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -12,7 +12,7 @@ ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_CPE_ID_VALID = YES
 ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
-HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
+HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz host-zstd
 
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES
@@ -26,7 +26,7 @@ ELFUTILS_CONF_OPTS += \
 HOST_ELFUTILS_CONF_OPTS = \
 	--with-bzlib \
 	--with-lzma \
-	--without-zstd \
+	--with-zstd \
 	--disable-demangler \
 	--disable-progs
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
