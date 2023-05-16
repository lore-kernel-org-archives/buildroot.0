Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2529CC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 08:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D18B83FA3;
	Tue, 16 May 2023 08:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D18B83FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsK5sgsJAGQy; Tue, 16 May 2023 08:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9228283B62;
	Tue, 16 May 2023 08:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9228283B62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2251BF2E4
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23ACE404A5
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23ACE404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdnVEh44Aest for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 08:01:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 618294018F
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 618294018F
 for <buildroot@buildroot.org>; Tue, 16 May 2023 08:01:29 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so25438173a12.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 01:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684224087; x=1686816087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFyqBfLDF5kfQ0aKTo1CZ2ZSNoAeOcyRj1eJjmd3VWk=;
 b=T0tvr6G22jFEDgclg43njs0TALRAPgMaGXZfgrs9SPo0FZjLFpPprFWOwacsbgPO15
 IxQTgMtQjK/MG9WDtZ4MPqF7rc95mkve8QPFjgfRnlA7SDdi5nPwrvps1tYTO79fd58A
 ZI6F/Dmk/YnO3haUeIJ8JQUxaF9gq3zGBd2f1X8WO8EEGGiGxyvhWT+SCJSJXMbYsTwL
 Zxitrf/rig4hzRKOCrfXKY91fXCcqFsICbEH5fHAUIWD6gi3gxVMj882Ehu/eAjGybKm
 cpF7xP50oteTQZQJssJbiDro937Fo9OAY9qKuTjLXIeSc6GKopsaGWjAJRh/IY2VMRh5
 MKFw==
X-Gm-Message-State: AC+VfDwp5VEj0rJQAoDbkCfFlnpmafUuZlGmfHbmT+55pBU1P9u9tlry
 KuRlsdBSNcolmAVCHRfaXxs/GCuaFo5Zkg==
X-Google-Smtp-Source: ACHHUZ7qYu2Lf2ucA3Mn2C5vy3qdIvYiZb4hZGCJbDMKYTKvkzfs4pzhqqm4lkGhciCRFQ7P8gpPig==
X-Received: by 2002:a17:906:5d08:b0:96a:63d4:24c5 with SMTP id
 g8-20020a1709065d0800b0096a63d424c5mr18642850ejt.77.1684224086386; 
 Tue, 16 May 2023 01:01:26 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:5cb4:21ec:50e8:94f8])
 by smtp.gmail.com with ESMTPSA id
 hs32-20020a1709073ea000b009534211cc97sm10637487ejc.159.2023.05.16.01.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:01:26 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 10:01:17 +0200
Message-Id: <20230516080117.18721-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/webkitgtk: fix GCC version in comment
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4c7fcbbe75de5c535e8d5dd7182900b6d09e2b03 should have set it to GCC 8.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/webkitgtk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 976341093e..23c0bf41db 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -21,7 +21,7 @@ comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
