Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517AB606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PfSt2TVj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iaf82hyT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1578984814;
	Wed, 11 Nov 2026 18:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Sunk_UaTUzm; Wed, 11 Nov 2026 18:38:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8AACA85109
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794422285;
	b=f6dyxz91b8BzB7FSIBFmQeiJg+Fq0WOy5cp1Z9uiqa/KMcECnHKuHqN43Yho2qd3Qt/Q
	 008RDXl5M4k2CBfrRtBxsY6PzMAKkhurc/CTlTtjUr8YnGHGGnZl41UeUU7DH9U2UwFE1
	 GEyI7R3WONreF16E8xltCB96hCsex8eOBdj2MI1En8oVx829yRawA7Tll7wOsXPjCpFGM
	 9ZOEQCmm7bWlH73w5/GsHt7TeI6+oRlmWlaIigaLD0QR8l7dqAbnEZwEtR9D7CMyYy7BD
	 NNNczT3PKgFfIddOk92KcbGux6BAPzdo36Kk9cc4Ht76FROZ3cxE+ThQqk3B8xdvAYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794422285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Y0fvs4A1eYEFa6mu53NxtnhpJI+weVSjPKj5/Wxp53s=;
	b=GGT+O/oQTwc51BzkpUw5lwP1wq0TLdfOjPGC3mr5eABZH+KZ3rhKmNf4REi8k03o9b/N
	 YvmMK02gXhpdqkSzpElMc0RjFYCfuyslx1LuKvoybYNLWRdCgwdL5pKb5vdhPkOmDzesd
	 r1t0jA45taDJz16bcfWgqIrvmstYkA5JLpOqyytEZ3cuToG2vJg7qZqJ/66J36o2WK3on
	 uBWZUAhz1OLLNY+lvAqvHgr+FGDkG41VGE170cv9ByhwdZa7S9YusUVABan/mplHCOIh6
	 n2/EFAvfeWbXs+25FTSmLhttaLS2TrBHEhZzKlUAmuPmK2xt8ACZ+lcUhwZ3C8vQPpQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794422285;
	bh=Y0fvs4A1eYEFa6mu53NxtnhpJI+weVSjPKj5/Wxp53s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PfSt2TVj6HNJ7BQSUp1ZVuLFytBdGj2XvAAJLk5xCBZYyR/jSIFSLXp4aMBl1lBVi
	 g/52RFfGFL02hSVItEHDky4Eh2PCbZDZON3jU+aMSTltJnG2Hy4O5HKLcTAyqqmSgH
	 zXrW8FF1B31YwaxTQ7YFIT0NGw6QOKIdKPu38G3nELnQqHkVPOPGc1MA0VGH20rhK7
	 uZX+DLX0HiaXQA2hKHJGBOXS/nSuMJQxa5amJ3mlZR1e/NL56Sz3VMJggQaRJNlsfM
	 EOE/ShS7HUxrE5XchtyNokF+ZUpZUU0mxVKWqLrgurZrQzkXNPmePGhZHfP8VvOJc0
	 D40EASU2ciWpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AACA85109;
	Wed, 11 Nov 2026 18:38:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F61EC3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF09441067
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6FHduiWJPRu for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:38:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE33441557
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=iaf82hyT
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE33441557
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48e47347279so2253544f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794422280; x=1795027080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U7agrpVyY27mfkghQhZcjehkGlCrZM7/1EPDXrCD3uI=;
 b=iaf82hyTZKZWO5q85eqhE2R3Kk+w3H+xfRPvx5WuSti4l4orwelgR3TTRRLa8TiDWz
 mFA3ryjGpxPdwdBZYmpE5nEuW7T/f+kGf6EQUcuvT4uYLYngvuEkaxFqYirSwo7Mn7Ih
 ugD1SCKrqn5qGtuJe1fhYr/iMHS4jgo3QdHCqkr1/By+WIek5glETANWokZVfLb/bCD7
 O4ec4i5O8Ixlhf3fwFJHiRHH34sOxMMEsmrY5CDKDeuTsBtkyIQnIgYkTuRWirYyBu9z
 Ob+usLdvl9hFWaRNC0+9p63klaDsdP39LtWqFaJZgfku16fLleFV7HNpuiV/zuVB0l3m
 WdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794422280; x=1795027080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=U7agrpVyY27mfkghQhZcjehkGlCrZM7/1EPDXrCD3uI=;
 b=aSCXbJV0HEPcGZF/0IF3AbzqqPmzeqTTd6OFjYnrG/C6woTgMHz0oBOzPNzcvAKN30
 jiFLTJXbdM7MoS9clph61Fms+IcX9Izp2TtBZ/w4zRIFjHKkMdkpkazLsSqHrUbtt66w
 EG3tq7FaRzmY6jsyShtgFCuqolSONKkFe7LCyYPPmJkoEMzx/gF+eNEKR5o5mUGakpPO
 4Ros0hA66WFdT9EBI8rx/j4zje7B1nfKpMZt/dpw1bZbHEg+Lvx79J9qsi04U2x6j1Ft
 jh2pt3hpP8RyJaGlkTXGmcy6HlR58Vi8/T7TnP92OhzVkQia0JLzCrliIdK/Nag7pLU7
 nloA==
X-Gm-Message-State: APuU4Z/fopUaYfrIgVrSNj5uHohATriwdTY2URI4Wrw4r2yG1Y+uROAC
 CuqxJdJKogq2hErDzhM3qLXFC8dCaSpE/ICWsOen0/Cuv50frGcOtyMyYkjKJQB6
X-Gm-Gg: AYBFou3et7/Fc1+sDG4HKmjtTW+fHsd7xUK/CyIlAP55xSm1p8qEyRQt6to84fFvzkW
 U6huUzy/UxSXOhxVHZBxVsdS11P/fltAUkXTGvAuiMES/WTkPXFjOk2LZc/RENn8zmlmFWB0QxA
 K2lZuSgfb57TLV5AaZjfcypz2jJb+bzs78FYOcZwf4IsOX6KaViOhRruYg778vFw+S1hCEkiVF9
 QObSsdMVjxpVFDDHb70lcFUQPQwbqcueaV2dL0/yxlofWHzXMpSSF8pV1RFBYKtKSTFH43d5jA5
 dYaQabIjB6cIhkyH9y4FEMblIvw509F/Mcjp8lxl4SloumkUFjcmxv40HP5CKhdnqyoShK/CyU2
 mxJzsuKil3IlzyrMyp4SQzzITGZ55t/wCmr4w362P+QuCQ9/8m1bmCx1YVXGpAoDV7PysHPArtF
 fltROpJdOONS9nHIFsx7dymq7X2l0gJbZeVz3M3mKtrpPq1zbnxq2xsP1JkJ7M1B10ijCaZxhWT
 xLUuQX1C39+qpu7eoNJ3YvQ6wnRd6tOjfiiLnx4JOaFK062Xuel9NldWkXS86jmKWybjW6JeSDi
 uALmYdfrg3WgZ1hFZ1kR2KffFKr8dm0kajnvhtNDE1l0KSXI4n+c
X-Received: by 2002:a05:6000:491a:b0:491:ef47:72d7 with SMTP id
 ffacd0b85a97d-499c764a742mr5492488f8f.12.1794422280051; 
 Wed, 11 Nov 2026 10:38:00 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm11007672f8f.20.2026.11.11.10.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 10:37:59 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:37:51 +0100
Message-ID: <20261111183756.2235235-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
References: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/7] configs/acmesystems_acqua_a5_*: bump
 AT91Bootstrap to 3.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the 3.x version of the at91bootstrap3 package, now 3.10.4, instead
of fetching v3.10.3 from git, and drop the board hash file of the git
tarball: the package hash file covers the release tarball.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Changes v2 -> v3:
  - none

Changes v1 -> v2:
  - collect Tested-by and Acked-by [Edgar]
---
 .../acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash      | 2 --
 configs/acmesystems_acqua_a5_256mb_defconfig                 | 5 +----
 configs/acmesystems_acqua_a5_512mb_defconfig                 | 5 +----
 3 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash

diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 5b31f4c692..725b82e86f 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index ed74dd30d6..470ac36de8 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
