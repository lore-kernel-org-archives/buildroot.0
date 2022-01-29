Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 15:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6934160B9F;
	Sat, 29 Jan 2022 15:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cn84c-IQ6psA; Sat, 29 Jan 2022 15:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F52360B88;
	Sat, 29 Jan 2022 15:50:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 307F61BF32E
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 15:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18565404CA
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 15:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13f6klG-M4eO for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 15:50:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32136404B6
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 15:50:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l25so16645567wrb.13
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 07:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D/CyXPS1VNG/EEPzQwjvwhgY3OTPr9uQ3wXtr5VSe2w=;
 b=aMEs8EM+4+Qi4ch5aPvP9IluySy2eKkwyaaB2tWJIq/NlxtJlpddiq254WFJY479xy
 BkhG69sLpPUwna5clBT/AitvgEhPK0GJVV8O019BygG4ivlN0g8Wnr6R50MFjwAalREp
 TYVm3jJvWI6ywI7ULpgx1XPymH4KeQLmiZ7UMzCFobfqHKFmlSHgxua0C8Fa3E6OqB7y
 AxUEzE0SymQiS0ZToTI8WmuqQCN/SKnyMWvJrdBrGhEIz0elAINytCtw8dEN4RVNjMic
 1fFQ0/gaU0V+GKgJX2JPydsF1ViXv67/A+6rdR8Nib9MX/N4oASWBuPzpFgGljN9grB4
 xgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D/CyXPS1VNG/EEPzQwjvwhgY3OTPr9uQ3wXtr5VSe2w=;
 b=LN+gP2nYfABAu3LU82/KdQ1cTuyCBoDysog96GNFKbQjS9DOnw2tSN6cbGLrBBQ2Xu
 WDVtAnGFRO9OMLul6ZODBTN6KAtrebsPhjCKUm7/mlhR5b3u6urQOJ0rrtQyPZ+Ku/6W
 UEd+cMIwmM96HiZYiJy/72RM6R+2cKDbh/R+6rw5ZbCogyk/HnkJQ6IhaWS5zL3SsqwN
 MBWIX7cNJGDNGUgFArfUVpqUuwARCDIV9dSfH2e7mp7CoK+vw3Kc+l0vF8+IVTF/NevV
 XfPQe9TzdmK9SWeJOI0tbz/dT93fHQrrPk591CMhQw20QgrtM1tVtuGI0grhZ94AxQ81
 Ma4g==
X-Gm-Message-State: AOAM530OUXTK6AylWbfF6upSczH6l9P4jVO7H4W1JnzGBJMXrX375q29
 1bpCRY2sjHPHGLND5Zf5fsKS26xbqbU=
X-Google-Smtp-Source: ABdhPJzvFI/A6DooKTqA23VKazB8pcTGVE/Ns3/m5B4I/4UbIA8O0XLlRzmGa/KGAJ/6i7oKSVVgUQ==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr11068343wru.665.1643471398084; 
 Sat, 29 Jan 2022 07:49:58 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t16sm4838557wmq.21.2022.01.29.07.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 07:49:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 16:48:00 +0100
Message-Id: <20220129154800.3819350-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/android-tools: fastboot needs gcc
 >= 5
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

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add gcc >= 5
dependency to fastboot:

Makefile:591: *** libsepol is in the dependency chain of libselinux that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/2430ba4afb40569ed54506201494baeebf6c5d42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/android-tools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index a36c4db189..22d17f5fae 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_ZLIB
@@ -46,8 +47,9 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	  the target, which can be used to reflash other target devices
 	  implementing the fastboot protocol.
 
-comment "fastboot needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "fastboot needs a toolchain w/ threads, dynamic library, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || _
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
 	depends on !BR2_arc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
