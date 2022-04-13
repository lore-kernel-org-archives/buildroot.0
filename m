Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D22C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 19:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12A71837AC;
	Wed, 13 Apr 2022 19:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtBNujvXXkql; Wed, 13 Apr 2022 19:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91AA48348C;
	Wed, 13 Apr 2022 19:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1103B1BF405
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 19:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B9660E31
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 19:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhRLg90X8Nq7 for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 19:22:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A8CA60E2C
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 19:22:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g18so4022727wrb.10
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f2DSMF0skS4znC4LV3tA9qyw7OW5EaobWPpx7i2lzyE=;
 b=HRI2jZHxjAiLIluQOP6Gq4HMcDHfzH2QCGX1tLTLNxYAIfrDV2G8WTvFKW7UgRt2Uw
 zCWb9dvNzd2Ukh/50YBMvMTjBp8zjpuDhMQ3uPZ/k4vb0TuYAl6t+tfQulwTxFUpfGKz
 afPDetNk+Kvi/IcHAoMmbSTBmvN7y+opZA4swX/fSO8sirIJ7fjSglnbuZ+yA+yiG1vw
 x4b7OLBaLrEgHgVOzy2bD4+MbAJPQKtMM5gXveD+8DYRUEsRaUwlvzT35ppcCmTWZVuQ
 dH3Gd/jn6um+Bw1nwm3fiZOLKHhGmGXdjUX2CaH3iSwm0nodUZBG5h3GnqO9pLd+ZtAv
 /4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f2DSMF0skS4znC4LV3tA9qyw7OW5EaobWPpx7i2lzyE=;
 b=707BdydGIGK+L+l7N/3+HNkADNAIft094rQsJV8zPyeEf/qAododqtYDAdZIMw3yG1
 9MooTs6q3o8rNxTlkNNbqVcphGnnO7Dq2yrxyEKcL8j2Obe1wrelnUcaKGoiBaek8KUQ
 L1hL0dCW+ELDNJwT/bbiuxvTshOi91xsBvu9D6nVg3r2P3QsE5bjlotMNi2/LjcPxad+
 +2Tb8+gEw4JcmqCxL/3tKALm6u5U6CvrLieJKiFBWLK1wze0SHk242vegcbD6tNM0k+b
 R0zovSPvx3ziiIfkS7dFcf5UtBebNiAJSCEPni7+6/99ZgweVmQS+Zby9DiTnrT14E+E
 YqsQ==
X-Gm-Message-State: AOAM532EgQdZ+aDFJTQpkFNgMtaGup/xNMyKCmQBMNpUK91IQOv7Aigr
 2WF7Ok3EuuHz/GXYmMlmiwX2VejaYWc=
X-Google-Smtp-Source: ABdhPJyusZl04T3avovFU4G3NniXI8D109r0WIO99kf5bWOQKUfJExST+YN7Vdi6dD3WT1kOQF71Fg==
X-Received: by 2002:a5d:6d0a:0:b0:204:109f:7833 with SMTP id
 e10-20020a5d6d0a000000b00204109f7833mr306908wrq.76.1649877776032; 
 Wed, 13 Apr 2022 12:22:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f127-20020a1c3885000000b0038eeaf3e8a0sm2221300wma.43.2022.04.13.12.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 12:22:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 21:21:04 +0200
Message-Id: <20220413192104.889800-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uftrace: needs NPTL
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uftrace needs NPTL since its addition in commit
09c97972d9f90b69cfc36f9ffe9e22c13daf9307 and
https://github.com/namhyung/uftrace/commit/543fe53c256ceaef2d4d7cc44925bf1ad5a068a8:

buildroot/build/uftrace-0.10/buildroot/build/uftrace-0.10/cmds/record.c:670: undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/8f884efb9d45f9145a4799981157c9226390b423

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftrace/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
index 98ddb7cbfb..8f8c5d25fd 100644
--- a/package/uftrace/Config.in
+++ b/package/uftrace/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
 config BR2_PACKAGE_UFTRACE
 	bool "uftrace"
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ARGP_STANDALONE if \
 	       BR2_TOOLCHAIN_USES_UCLIBC || \
@@ -23,6 +23,6 @@ config BR2_PACKAGE_UFTRACE
 
 	  https://github.com/namhyung/uftrace
 
-comment "uftrace needs a toolchain w/ threads, dynamic library"
+comment "uftrace needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
