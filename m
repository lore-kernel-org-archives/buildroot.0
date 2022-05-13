Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1682AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD7D60AA0;
	Fri, 13 May 2022 22:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aa9dS4nqVm9l; Fri, 13 May 2022 22:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9C1A60A6C;
	Fri, 13 May 2022 22:01:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8791BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ABE660A6C
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4oymC_pJxl4T for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:01:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A1CF60806
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:01:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so5403838wme.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zeb4Hm95dyguC1WmhSY1GYoapPU5fHMsUYsMOd2szK8=;
 b=mEy5D4qLADjolgKZH4RYaAliVMZziCw1f7LnenmoOb44i/godVnQX2hTdFSrD2riIY
 +0APc2M4PNY6SL0dz5mhnemjHU4rb80+KQL92wW8vuO4XsfwJO5I93EoL/lDE34utmv7
 WXhyMA5GwVMHwa1SbwAiFbgPptvkqYH8eCeOQuPavRnaSMZhykXbcshRoPAQu15czLJz
 HXbuEMBgW3YMJ8X91V6qg8qOhn57NVLkkdzRrnxOEM1DDcJbFHS8Jk2nnyeTQGGZ9Y2h
 JYZdz8pwYI3nGlkQ7MYkyGmqY4PQY2A/g2ALYoRSDC5E53HDksmWOb0CFYE23WNm+qas
 gJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zeb4Hm95dyguC1WmhSY1GYoapPU5fHMsUYsMOd2szK8=;
 b=uf80N7R39VhtsU3cOKP5B5vUhgW/GsUkfNzbefA5wtgWd6FziRNHhTssmc4Kp7RukM
 34bPRFCzoXQt5NV5tSAwqRu0lMKPr5FF6nxRWnGPYm7AODJaCxXheW0mtA7fq6TFpd7w
 jm8xkWeQXiGYGoAcDvvLy/XWVQ3wjfDQ2weIU50xeb1k4XVQi0B+scYtJ+JshwwhTEpP
 9ym6jsIYPuoPRPBz+TgJOvzzpoJSR/YlB8hZY8ugEjmxo7jOjFhOdIZiO1jAdi6c3mqJ
 DDkqWkp+Vjw7sakIQzPP8jUKW71Ku3eBbMmGsXSrQ/+2424pzZwFkyBP8Vy6AB9iMAmF
 vZFg==
X-Gm-Message-State: AOAM533XtXkQAQBarUO80VSDdBljnGnKKB0i0j2AoSgsuFwvM+st0xqG
 Cp1YRyPrUWo5CLkV5xE8PJtUojWndg8=
X-Google-Smtp-Source: ABdhPJxwoOS2ZZMigCBnOXbhUWImD2eITjKBKfzUC0s4c0dqjxRRVdaOLLcdJfgYHOzFwi8TZOYBTQ==
X-Received: by 2002:a05:600c:2844:b0:393:f6fb:5897 with SMTP id
 r4-20020a05600c284400b00393f6fb5897mr6561675wmb.66.1652479315260; 
 Fri, 13 May 2022 15:01:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a7bc7ca000000b003942a244ee7sm3253873wmk.44.2022.05.13.15.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 15:01:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:59:47 +0200
Message-Id: <20220513215947.1454212-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: fix build with
 argp-standalone and NLS
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/buildroot/autobuild/instance-0/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

[...]

configure: error: libargp not found

Fixes:
 - http://autobuild.buildroot.org/results/f7ee27fb4c3253f351deee9867a3b98128f079af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rng-tools/rng-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 8b195ea875..f736193a23 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -20,8 +20,8 @@ RNG_TOOLS_CONF_OPTS = --without-pkcs11
 # Work around for uClibc or musl toolchains which lack argp_*()
 # functions.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-RNG_TOOLS_CONF_ENV += LIBS="-largp"
-RNG_TOOLS_DEPENDENCIES += argp-standalone
+RNG_TOOLS_CONF_ENV += LIBS="-largp $(TARGET_NLS_LIBS)"
+RNG_TOOLS_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
