Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF824C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 16:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 729BF60E1D;
	Sun,  3 Apr 2022 16:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtCVUUoQUt1I; Sun,  3 Apr 2022 16:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84CC60C23;
	Sun,  3 Apr 2022 16:19:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2D11BF284
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DE8383268
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKAGg1XrHZCL for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 16:19:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EA6E83264
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 16:19:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso1757959wme.2
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z7CV2pIbCWcZnNSQe6gUgNW9Zl4hYnrN3NvPZa3fzkI=;
 b=GVhF7kKKD5AoMFc0Eh150Ke6xg8mgJTuYtfN6xD4KxdPjnQFBDAAkREEpODo75i4V1
 z4SlU449I/JHWymRu9LnWdkaNe2CJiKTNULpWXfRpUzqF2bhJAQ7G3V8Z+Zy2DkCywqu
 lBeJBVARKcfOMyyvZe2NzUc2yNhwrf7R4F9/ibOsIX7Jl9434JeDNlgTSPimOfC3yUff
 tEDtHfDNE/gJXrjBUvdRQe7TjJ71z2Dy38iq4QCv1wKVfL21mATsf06Qvp5Es/EPh+vv
 ygbHCG7f0HAaHS30PMxohP26JyaDC0jENSc+gJqg0kkbKWrHuKTzZ4Iql27MPHKiZ8KK
 ZNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z7CV2pIbCWcZnNSQe6gUgNW9Zl4hYnrN3NvPZa3fzkI=;
 b=VHqzaouAImowz4MTzCxngFESOZs3jWcnYQiAMrgzHG0SDy55jprcOGHL5zrTSFx97r
 iufAEYNOEI/srbPzEAm9zfM3w4aP9AiRhCR4WiCfr1+U2gJBr2b56NW2krVf5BJqBUQd
 xpDDOsXdfzzMQXdXOrg8/At9PbYLk3tasvROvnb6xRmCfeOMxOsDSrUwu6ln2WiVy6hx
 VcGR3mQE4nDy8US/grI6Sd2blKHs2gnNuWEJPCNQcuCE+pEcL7udaZDuM3SM7qFC3caR
 mudROfoM+Qlpnq1MypZpEBOXovTwTYZEcayGOei6U4HkLvsfUZAiKTCcOhGP2X+BiTZS
 r1hA==
X-Gm-Message-State: AOAM531Uk1cHCPGe7hh25Pr9gGObVZzw76X1MIukddPcOfBk1Q50EcOh
 P7DAjdaso3fSUa8jGJNnDyEx44VXHHQ=
X-Google-Smtp-Source: ABdhPJyuyFqmGPaCMkHkQ+m5VZ1wVilJ2gTXDnH9Ar/QCgObTqtvSgI7VQ2FmieD11R3K6pSjKTx5w==
X-Received: by 2002:a05:600c:1f11:b0:38c:6ce7:69c5 with SMTP id
 bd17-20020a05600c1f1100b0038c6ce769c5mr16226563wmb.64.1649002773234; 
 Sun, 03 Apr 2022 09:19:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d410b000000b002060e6a02cesm1564927wrp.13.2022.04.03.09.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 09:19:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 18:17:51 +0200
Message-Id: <20220403161751.204523-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xmrig: needs C++
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xmrig needs C++ since its addition in commit
6f70990ccf6cb993fc31519337390e436d15493b:

CMake Error at CMakeLists.txt:2 (project):
  No CMAKE_CXX_COMPILER could be found.

Fixes:
 - http://autobuild.buildroot.org/results/48f4ff6dc8281ffa99a45401b5941b28f2c94bc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xmrig/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index 7024241017..c5c6b3e37b 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -8,15 +8,17 @@ config BR2_PACKAGE_XMRIG
 	# xmrig needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBUV
 	help
 	  RandomX, CryptoNight, AstroBWT and Argon2 CPU/GPU miner.
 
 	  https://xmrig.com
 
-comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library"
+comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++"
 	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS
+		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
