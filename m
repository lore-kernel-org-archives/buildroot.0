Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03050C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 16:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A093960BCD;
	Sat,  2 Apr 2022 16:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n69osnQrZvCb; Sat,  2 Apr 2022 16:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B827160BB2;
	Sat,  2 Apr 2022 16:09:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7B91BF3F0
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 16:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F7C82786
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 16:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qGhpm4R2U9l for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 16:09:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7014982702
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 16:09:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d29so2194008wra.10
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tLNcjkGKMIuYpgnXrZRozulHgfpFs2tAjHIZhCMHJ4o=;
 b=S8/vB1aO4ZAbF5oO63BgWy0l9Z4ziDboq06Z99YHGxvo0H0jVxIHsJfv+dAq437V01
 Z8MVCO/Zl9LUgDKrvqd4jcsaspfCp4FLIVF3b7bc7Xx+6LZTOhjs+JABQUWqtlIDJV7q
 wiPmNY+hCnP8d9RnXofTYwE4Ctg66hzO9FWnmugwnwSFOjo+UEZg0apRLZBgz6m6aGbP
 rqKNpkfaygRes4/5vSsMwWvuek6bkuZNgwMQFGv1skN+GkdQwjYR285xwaIPSI6niQFB
 CvH9iJwL3ouwy3iqci7U4pwoKPvBXBaNVvWxEyjvRcX800V5q2HPKlXpuaflg7Z9IM/a
 77Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tLNcjkGKMIuYpgnXrZRozulHgfpFs2tAjHIZhCMHJ4o=;
 b=2pzmaPPBddf6xBK/7P98tuO3nEuX5wWccZTBbsbh2PYh8oAb2VNiZ+e0xAXcwNAHg3
 lEqawj4ASZfTgTycrpUNr/WiP0bQE2hiul3HsycuOxZCigcavJ0TPm5P2iS5xsCEVhdt
 M3CFtTtTtZfzEnt7HYb/H4VjCsiKrLUX9mNyH05gWyaThuyZXMI75j7ZZQedisiKwqsq
 2P1UCZdJiSha8V6D6EwF5Bvvz41qHJ6RlLhUx2Hw1EdsWpvllcFq57EtQ43fCyLP/3U/
 PDAnmubo33M/+BFcgm5ceVF9S+MLFnZv/2nW85Z3O8mKQDl3QcqsXAlaHhHmiNw1o7/K
 gvbQ==
X-Gm-Message-State: AOAM531+fFCH8g53xZgRI75NJhhno5xH24hu+Y2uzzIQqhmZ4LGci3CK
 os2s9g7KOALoLbaUtsovJkVHZI3fEpg=
X-Google-Smtp-Source: ABdhPJw08O/z9AJgCGzIzy2CIGMAxfjGFkGciOYbqMwr2ZavWVH6xi8o3QeqkWa5l6upRuUQXdV2YA==
X-Received: by 2002:a5d:6842:0:b0:204:72d:e97e with SMTP id
 o2-20020a5d6842000000b00204072de97emr11331591wrw.254.1648915738209; 
 Sat, 02 Apr 2022 09:08:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d6a8b000000b002060a8c810bsm1158589wru.24.2022.04.02.09.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 09:08:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 18:07:18 +0200
Message-Id: <20220402160718.750069-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: needs C++
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fluidsynth needs C++ since bump to version 2.2.0 in commit
7e02d2e762eb94fde1f222df1b960dbd263fa946 and
https://github.com/FluidSynth/fluidsynth/commit/0d98c47545aa2424741c0cc2b244e4f73249302c:

CMake Error at CMakeLists.txt:32 (project):
  No CMAKE_CXX_COMPILER could be found.

Fixes:
 - http://autobuild.buildroot.org/results/fe677f7b38c8ed7011f1c976bdb45768067936f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluidsynth/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index 5726e235e4..376419ce8f 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FLUIDSYNTH
 	# the .pc file installed by fluidsynth does not mention its
 	# indirect dependencies in Libs.private.
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  FluidSynth is a real-time software synthesizer based on the
@@ -128,7 +129,7 @@ config BR2_PACKAGE_FLUIDSYNTH_READLINE
 
 endif # BR2_PACKAGE_FLUIDSYNTH
 
-comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
+comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library, C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
