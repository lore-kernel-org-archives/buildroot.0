Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD71C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6908D40493;
	Sun, 10 Apr 2022 20:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_XBunrbWaqO; Sun, 10 Apr 2022 20:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76BFD4014A;
	Sun, 10 Apr 2022 20:23:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 172891BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 046CB4014A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pbl9XDVgICUJ for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:23:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4A0F40106
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:23:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso2241770wml.1
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ddOrnWgijvI6uTNChUaW7SJUZpfSm+dXo41pFy/wVs0=;
 b=WXqVQ5lpsqXd7P3eQi2iJbyK+Ze5v3g4AMpWAPTX5C1H0askuKQvOWuWPQeuHcA/ep
 zTzRj4P7mLzkU9o/4r/dUvVCKK/FavKcm1xoyedt37N9NN9nfV91g/98HnC4mY7YxPeM
 lXrOd0pNPvvT+dQQ+ZkG2/ebrSPjFdADYDR483RTDCx3YVG8vvGC0vbQxaQGaAMqfvGT
 V27cKlB2Nh8w1YDpXbskimIpohRAes2cVdDKz+98hc9ZBakNNU6SPlll/x3bAVvfIpZT
 qrF432Bzwj4kIcsl6mUUO9cfCl7gLZrC9SY+gB04EVlypjP/h8siYGRt47Aa7m3tXOUA
 ZLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ddOrnWgijvI6uTNChUaW7SJUZpfSm+dXo41pFy/wVs0=;
 b=civtOjQaAtg0rPIkAnTf72Lhdfh18TFhuM8KH7Dxnw0U8yEAIelHrrrqaXgoE0u55g
 ibBtRL4I6PDpxNDUWg1Ol4sHjAGJwbdLFZLSb562C5RwUKIAJ3ijhih4F7CuvLPWvBxi
 2GYufEQcZCvEBUsuTtYC8MzlpP9KIbLPfkrho5HLkBJY6xdAx3htZoFTSkVqzap5lEHA
 vTbs5jfsDNFNVXYyIh549Uc2y6gI27r1FCxD+Ndu8mj7GzvKQAJK9cOvH8zXGDxGNsqZ
 CYelftSljY5TZhipKVSZyodQTp4QAxrw9Ah3R1v4o6cPtIJNSgJL7jocwAWdK1mTfr9p
 DAdQ==
X-Gm-Message-State: AOAM532MrOXgv4S3c3Fi1xR+TIidObjNfJ/p0Ahc9N/2D5QzT8qFPa/e
 YafXzrODMU7KL2jjiqYvCGAgqyjTbR8=
X-Google-Smtp-Source: ABdhPJxc7mri//t7evfp8twbuplOKydSu1CrZ29k+eUwfeRIDklxPsknCMwYEWbgemfYb1HkHhxETg==
X-Received: by 2002:a1c:1941:0:b0:38b:4af1:49f8 with SMTP id
 62-20020a1c1941000000b0038b4af149f8mr26492466wmz.156.1649622192706; 
 Sun, 10 Apr 2022 13:23:12 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b0038caf684679sm19604382wmq.0.2022.04.10.13.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 13:23:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:21:12 +0200
Message-Id: <20220410202112.866702-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/valgrind: needs threads
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

valgrind needs threads since the addition of vgdb in
https://sourceware.org/git/?p=valgrind.git;a=commit;h=2ee9e9048658773ceef3d30eb79f44764a024f3c:

vgdb.c:37:10: fatal error: pthread.h: No such file or directory
   37 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ffa2dbfd6d5efcc50d447c0e759fb4ffce0b59b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valgrind/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 56e4af21fa..700849130f 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -7,14 +7,15 @@ config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_MIPS_SOFT_FLOAT
 
-comment "valgrind needs a toolchain w/ dynamic library"
+comment "valgrind needs a toolchain w/ dynamic library, threads"
 	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
 	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Tool for debugging and profiling Linux programs.
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
