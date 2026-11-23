Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12929606A330
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M/dL/7xG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w/lBzQyW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1098A607B5;
	Mon, 23 Nov 2026 22:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBOn4ZvoIr2a; Mon, 23 Nov 2026 22:00:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E821B607C9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795471232;
	b=I1MaHGzulewWUbwucbo2piAZKOKIIafbK9T+1Ikzv6wANJkUQZRIv3aBbyLKnIPjqDAG
	 EP+42T7SKvcrypLN8E7zKMiKUHfspw4Ql/D4ZBGoItsjGQRxcZHXLz6E6vSltNqXZHG2k
	 gaZ6GTGy5Jn4LhvPcAQG5ImNByI3XOyHADg0/w0Jg72LV+vTFgzPags9lSOuCZRqBFvgI
	 3dd3UJoW8KR8P04JH2I+3pn8y7rE/Yznw3ISxFL1CkkCixPwZwoamimMeH/+MhcQuMCZt
	 u1nkJcfsb4BtoieeGRTb9w0gSEdinBm8EyZf7ncACloo/KMzoc7teMBvIRu0WBKRa5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Mwde5h0by04X2wDkUS1E0oCxT7DmzDrx6vcgdZVHN/A=;
	b=CskWYrCMIkAj7bSkaTOJfKDn5G8RxNwfMd3o0n1Aw6jUvdheqYZ0bQBSCXs4JUJkcsKQ
	 OyRSpCU4LpJU/7A4OQ90T2Md2oOf7MFAtbwR/ehAp9gObuoT2Zh3WPjytB7DxBm/E6ZXN
	 Z/r0Ov3Siyvq55+gBGI4cyi5uPrXkMaELeoRtZaXtGU3BzjOu5Udk1L96jhl5AqZcRSFE
	 JuUtjclC0sWNxGvCjmTfRVQT70LQJH1B37PEBpNyJYGhJTNjBuFibzQ6dfs/IEJbUiWAz
	 TY/9U5Yt8pjW5oYZvwDBTUlBr4LxgCCCQwEUbLg4p4E59xQoTrZhlZ3q9Sj2SpA3YpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795471232;
	bh=Mwde5h0by04X2wDkUS1E0oCxT7DmzDrx6vcgdZVHN/A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M/dL/7xGly7yA65oY/1FqmMPCKQTKSKBfNCr+T0ECgYdqzG6asCDJOAnhf1FaddU+
	 CXU9yhbinozPDWW/eZw+7rsVZ0l/i66gDcVylauM5IWahVQTV57sHjoUh6URqRuska
	 Kz2wSivinSA2BoHbxGjG9iJipS76CCOiieDRNO3gT9RXOHTHrsld25tQY5iYQz2cC+
	 tcHRJBiOudkYMOvVmkKPkDwm+eRNBcOPcVBEbKMk+jcootq8y3wcV84YYxBLM0m5aj
	 HXBsTE5dVUE2hWU2ErmRpW7X7x4nkr8/t5lJC9FDs/bbI1Nq8QON1CgzTqNE9vZE9v
	 8joHJ+gwoPtCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E821B607C9;
	Mon, 23 Nov 2026 22:00:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98504260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8668F401BC
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8f5563cQk-_v for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 22:00:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5243B40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=w/lBzQyW
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5243B40024
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso27405675e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795471224; x=1796076024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fgdb6UIiyh3r3iPRZqBmm2du6217fJmcimt1YmqlJPM=;
 b=w/lBzQyWT7EmyWIIbInY0vQch+fhI6NwUKf5E5SifTuOFv/i8RM7oN6VuBg9xgetgn
 JeCfg6cV1J+DUhUhGlNZxUdM7nnvu0B/WYXdwIokNhJfKzcf7wqOQMkbSGNqMt8Elhzw
 DjY6JZ1x0mJ5eDdeTdrs6X95hCSsGjeE8xnm1HcebPszLjDTXEN3Kh0SkRoZmcGHcYMC
 FBQ868XUUPMvWOozRDjg3YvhkU7BPZeQa6pPUFwNaG0jfLh9Ij9xjXxPEOBLehXtfIUl
 v16tCuLfqgCEn25jVeEwrIc7jrrISRGoO8NMxbDFhb0bjzgnnCT2KdP5ysDEBOgVW4fS
 ZaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795471224; x=1796076024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fgdb6UIiyh3r3iPRZqBmm2du6217fJmcimt1YmqlJPM=;
 b=QjUmmGq/uFSd8Xz4g2N65n3DKajmlhgcBwAWK+Y62hx3osw2VtK1mOPo96sIYfpK3a
 +QJXOHn2kFnGdtZAkwxYwhX6UhqQ1hVytK7xVcO5Zs+RMxgcVQW2Qobyb5TsHMnEuGTV
 9K8JWSnsK/eb8Zb537V14v1Kibq+N6MeVmOoOOYDVt0vxbZdWjCKdt3iNHGYhBAnH7TJ
 h2erK9NZK2/bHT/1WXqGK+QUOkL7x8JuYIBgTCGWMKrKvuMtQXG5cIjxbyLccuJIw++z
 FWAeVo/WitHUBEJGSj+ZNiTpJJUxCpeUoPUmtG4OdKCLauDzeqY51cTMYMeWlhr59OAu
 Sx+g==
X-Gm-Message-State: APuU4Z8D4p8EvY/EDEb8lvCa63hCrO8a88W2Q23/szghoIcBb6Gk9mMG
 +0hDSTPlMNUQEcqYJTqo5jLsacSPtB8cVyiGguV2YBUCQEohFkGjMlur83ZURok5
X-Gm-Gg: AZFdTZc650cI11zbhCfCHfZMMSfi/JlzZ56NS0TbPy1/NkzBktVLsB1sn4/mePbu6WP
 ukGp+pmT2pHRM7MZmFyrFwv6FNMC0rUxaT3f5NT0GlHc5D+eO6KwjLaYba29vOVvcWaOPyWeIuL
 7zD3iwNdBBl+G6/H/gIIf57ZvdMOEMKtjOnYVt02WP3sU2bBdFVpJ/yl0VIRQU/5MHQePma9WeI
 IeYmqOeo+UqZujQFKVUYCFGD4+rR1kRAngtfQsNIxGjStuzzt9cwxNt18YBSUKuACtbkszA5oZ+
 Lj9SmIUPzS61NIMp1NKNKp2tplaix2ZyMZ2D6K68RIR3sFsrxGasjzuKa79hJl6LxXdMcmaGgK+
 pA/tv2303sY89oEZjXud5QInM+7TW3WKyAqbYWgAuz+WDOFlHO/zXVHJ14oWDVFvcv6q1XBmk+E
 7B3UkarVMG+BRa0j8O0SvFMAmGxOO3Q4A++ZGFO7PAIu77pu444vwsFmwkFBhIPZkHLVgnIDQco
 /slx7sY4x4bSErNgfoTLErAZBeseHo+FigknpdzkjqNFS+LqTLIJVNz1/U+3tN3BbIYI0xm+A3q
 frf3HPLyatiLWjWyqgesvBuUu14NhBLxKn21a9jqn1oqBW89oJJFNBCcejfK0Csqg3Qshdry
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id
 5b1f17b1804b1-4bb88816acemr282873425e9.22.1795471224055; 
 Mon, 23 Nov 2026 14:00:24 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906635c7sm205310275e9.2.2026.11.23.14.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 14:00:23 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 23:00:17 +0100
Message-ID: <20261123220017.3955658-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
References: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
 <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/4] package/qt6/qt6multimedia: add missing
 licenses
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Baxiche Su <baxiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qt 6.9.1 and 6.11.1 added third-party code to qt6multimedia, without
its license information. Add it, following
src/multimedia/CMakeLists.txt and the qt_attribution.json files:

- tlsf, always built, since 6.11.1: BSD-3-Clause;
- dr_wav from dr_libs, always built, since 6.11.1: Unlicense or MIT-0;
- signalsmith-stretch, built with the ffmpeg plugin, since 6.9.1: MIT.

src/3rdparty/ffmpeg only has the license files of the system ffmpeg,
which the ffmpeg package already covers.

2025.02.x has qtmultimedia 6.8.5, without this code.

Backport to: 2026.08.x

Fixes: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417 ("package/qt6: bump version to 6.9.1")
Fixes: 05cd38635a1c2a8e6c44170b5eae8488b0c7a104 ("package/qt6: bump version to 6.11.1")
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch, split from "package/qt6/qt6multimedia: fix license
    information": the code added in 6.9.1 and 6.11.1, only on
    2026.08.x [Thomas Petazzoni]
  - add the "Backport to:" line

Changes v1 -> v2:
  - add Fixes: tags [Thomas Petazzoni]
  - say which commits left the license information incomplete

Supersedes v2 (in part): https://patchwork.buildroot.org/project/buildroot/patch/20261123212022.3748880-2-angelo.compagnucci@gmail.com/

 package/qt6/qt6multimedia/qt6multimedia.hash |  2 ++
 package/qt6/qt6multimedia/qt6multimedia.mk   | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 4f8ea03008..19aeef8a92 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -9,6 +9,7 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSES/MPL-2.0.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  dd1c647e6f767f8ff4b2dfae0fed314726600a01e0cf1ef556afddd5fa96ff15  src/3rdparty/dr_libs/LICENSE
 sha256  51928dce36213c5333ba3172e847d735d4c6e9b7ff2722a326c49067155b82eb  src/3rdparty/eigen/COPYING.BSD
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  src/3rdparty/eigen/COPYING.MPL2
 sha256  ebf65756959aabc5e321d98c04ddf528b80b6982ffec355f3c743ea24018d263  src/3rdparty/eigen/COPYRIGHTS
@@ -17,3 +18,4 @@ sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3r
 sha256  2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac  src/3rdparty/resonance-audio/COPYRIGHTS
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/resonance-audio/LICENSE
 sha256  48b2d5072817ba4cf7c2ee7af788434d001f43d36ef05e0ce5b76d7cf7262b50  src/3rdparty/resonance-audio/third_party/SADIE_hrtf_database/LICENSE
+sha256  ee2ef82481ffb445ecdd4b3a4c1f82c0cddb2da8fe39d8e8dc384fffb3e7f06f  src/3rdparty/signalsmith-stretch/LICENSE.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index e6485570c9..2cc61c0d81 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -10,7 +10,10 @@ QT6MULTIMEDIA_SOURCE = qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MULTIMEDIA
 QT6MULTIMEDIA_INSTALL_STAGING = YES
 QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6MULTIMEDIA_CMAKE_BACKEND = ninja
-QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
+QT6MULTIMEDIA_LICENSE = \
+	GPL-3.0, LGPL-3.0, \
+	BSD-3-Clause (tlsf), \
+	Unlicense or MIT-0 (dr_wav)
 
 QT6MULTIMEDIA_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
@@ -18,7 +21,8 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/dr_libs/LICENSE
 
 QT6MULTIMEDIA_CONF_OPTS = \
 	-DBUILD_WITH_PCH=OFF \
@@ -51,6 +55,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
+QT6MULTIMEDIA_LICENSE += , MIT (signalsmith-stretch)
+QT6MULTIMEDIA_LICENSE_FILES += src/3rdparty/signalsmith-stretch/LICENSE.txt
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
 # libxext/libxrandr are needed for ffmpeg plugin to build with X11
 # support:
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
