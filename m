Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F960C43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 08:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E39741829;
	Sun, 12 Jun 2022 08:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMn7sV1n1K42; Sun, 12 Jun 2022 08:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F4364161E;
	Sun, 12 Jun 2022 08:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 782081BF4DA
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71A7141521
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nv6SBKDEhqX for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 08:51:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 355F34161E
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 08:51:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m24so3650781wrb.10
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uP2je7ALUvvZo5s1WyT5cIhBWWaoXfNPsvPmX7ZGwLs=;
 b=AONNvAqs+SjtLyCkQstFrmJ7mJPBLQbfV82RN5zYNylQXkfJrkb8Ws/S50ZiQ0blqa
 64f+kAnBtexKeyiiMGoC+UeKYAzwVfyMQ2m6FTgfN0csS59/LZEilnVvVuZLdta2C3hi
 Jy7jGzFqGl2OR0HLOohgI24a00TiXtaHRHc6XdqUl2V6lI462pZAr/y/lW1DGPG8l1ks
 p6UNGTCjCUYh1VnQezlQJNpAte6SPzpPPGVY2EZLdbdr271snlPsxEQk4MaVMayTd4QX
 atbSP2tUjPhPkyUL1KwViNjcTGsKLoAUKdEIPMIAF8PQgZEmmwNVqcahMFgZwJ7m0yx3
 gl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uP2je7ALUvvZo5s1WyT5cIhBWWaoXfNPsvPmX7ZGwLs=;
 b=b6Ar3XQPUXGvoWa7sBzFmelcyRDw9dApEvllH782ZmZmBsSUNZybC9lL5B8LvyOjmx
 xuxd4Cwr20zW133e7LzqvuPFw86DpjdpGilGKF4DP+yN09GB/+0ocTRlNQclJMXp17R1
 c1G9hXP0Ef3D03R+7UNffTQLH7920LIs2XlOuF9d5t+DavBXoK3jEm2mcQj+YQvE3oLv
 KTL7yYc73mfDSUH7zLOjaaVtcdfIGUJ/PgR46dQhUhYLawAx8ZoqhogfYytJsP3IGiGF
 geVp0GlLlzfp5wkcIcDJFDeb+OXs+2oxu/M+nm3vcSfKUniLPzHaTkf6VdWzuJBoj7Sq
 vCJA==
X-Gm-Message-State: AOAM5307FTMnHepsrTGzPc5uEPLliXP45Od6tBv4sLi+SLPPJRBi17jw
 ps6IcNLHFB4FHlphCiZuqsDDSrzfHOk=
X-Google-Smtp-Source: ABdhPJwPi1SCcFGptEGg4uSmKKAW3WGIH107cEsNh2W5LZ1B4N3+V/jriZC1HDZrUQya5LA5+5UZHQ==
X-Received: by 2002:a05:6000:1541:b0:219:c96a:3d3b with SMTP id
 1-20020a056000154100b00219c96a3d3bmr14092473wry.393.1655023908095; 
 Sun, 12 Jun 2022 01:51:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 az3-20020adfe183000000b0020fcaba73bcsm4896142wrb.104.2022.06.12.01.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 01:51:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 10:49:12 +0200
Message-Id: <20220612084912.1874307-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/libabseil-cpp: update
 BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
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

m68k is supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/f3697b4fedc2d8f2311eaaebed051f6a44182bb2

s390x is supported since at least version 20180600 and
https://github.com/abseil/abseil-cpp/commit/a7e522daf1ec9cda69b356472f662142dd0c1215

sh is supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/a2d7f453c635e90b356017dd47049b89407c2d88

sparc and sparc64 are supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/3fcd00d7dddafe65ced638acca560105a414cba5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop spurious space

 package/libabseil-cpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 222e3a092a..45f339ff26 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -5,9 +5,13 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
+	default y if BR2_m68k
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_sh
+	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
