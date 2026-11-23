Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34320606A33E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WVQbiXc+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ko6Xm+Gw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B79480E5D;
	Mon, 23 Nov 2026 21:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1jdN0_js5sL; Mon, 23 Nov 2026 21:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1399D80EBE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795468830;
	b=A1hIOmK9sL4AOk9k/tzVwrWUgWaqVPEFyC4mvY3B8ddxWzJzuhbH6lS2DOZ9e9UofVHb
	 9MNQhMbr0X0GhCRSsQ6uRJnfTK2JduqavsydFNMUHbPjCvpWXfTq6pfpFVfHANvN88VlC
	 uou0oAVWYxtlKzDza2ibOE9daa1O+ynxA5D7yCJpNmzllNjPR66jdaGa75DpyLg9ngiDH
	 dukDqT+9qM1fN/i6Rw851L0Hip2YmpqReJ1q81HvekVh3jbxvdNFLxccnRuX1vOmokkIy
	 kCo7leRm6jQZocBpm3DnjljxqzItBzYG272tagUxYv0kBFW13JZq6CtciHl+Mk75Lrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795468830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=0W6ywTOGFRg6TfaiqsDWLI5TnsQiQG9n71YD1zm73+o=;
	b=E3XpG8i6J4T8xZOEy9QUEbadvtOwRFIYxgUTSgtJcsJHONNeNpvJNwy8L7d4vPIWpm3v
	 b7auKpEH9EYttVBw3VdTALngeugqgNgX9xbrw/7goANVv9dFi8SWey1BGA4suhlohQn+9
	 MMxLXqI4WzryRlDK/ODRTrXBUMfns5lJMQOg9vAgryyxFWQz85O80rorH426KVyNmAn4h
	 eXGmspWAih42i0P5N/bEve3esKA0IHhg0Rg148TMeko2JxYfF/7Hth8coY7kZqUgtdLKm
	 6M+0KM4HoBHEChZTzdo1qlOHXRDZ5TgW/Tvbme8Aopwo46a4jwEOgDuCZV/QIuZmNDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795468830;
	bh=0W6ywTOGFRg6TfaiqsDWLI5TnsQiQG9n71YD1zm73+o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WVQbiXc+QgDXWg0fTq7s7WDqAlhCnUbS1t4pqnjjPIGvR+a3V66IPjQLGdWWxb6ni
	 gN6zw1Ca2wRXNQemM/FNrX2BQYAZSfjDI0Zi0P7A9e7NvnVWhVegF1/kbTeSf8Kaz7
	 BnFB1ZHQY1Q8rGMIkAbXLe6w/ugWKguQQim+GkKEE8arbU9OqGnjS8uCaImF5mkBmh
	 y2q7c5oMX6Z5LACpzB47l8liMte+l5xmT7aQSe6g1sk/IJC52uG4yqZ7mZVJ37XpsH
	 W0SV3Ps9vgLBSOPEjwIYq/pl7L3nj5MjC95R6rflrD9+5d1uShp6XXWGd+lO1JCq6j
	 vjgaF///G6O6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1399D80EBE;
	Mon, 23 Nov 2026 21:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE3A8759
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD90605F0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73bSkT_o0bfW for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 91FC66067E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Ko6Xm+Gw
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91FC66067E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:20:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so2424353f8f.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795468825; x=1796073625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XnYzUaJDgvfDAAzP+oK7+IbrUPBPGawyhVj5p6GsF/8=;
 b=Ko6Xm+GwvpUR8fnkQy2JADB/IsXeq40p/R2owcLUmVNcw+j88zjyNKAzVXTDTE8gNA
 BV61x3JoY0whKbl9CcGsRSp+mY9tL8H8KsuxwDQw2VOnWuEq5Ok+1UXb0ag4WPkAFBFq
 JKnBpyV9zpToIvBzSEPMo4zn9Hgm7HLnIOmXZPycRUwIrxYsWviw0UwHz1FecNj3muoJ
 dcVlv8a/UKKnYosLrI+n4MTCouPAIaD/LSiM04wqr8oEECNXRyD7IzxNiHGSh9McTcJA
 G7VERqV1iSesOxrr+RVrZFgo6tMp+IFg70UOPJFLR3vRQyLcWUkRKZWyE6H479CgmhXk
 3TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795468825; x=1796073625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XnYzUaJDgvfDAAzP+oK7+IbrUPBPGawyhVj5p6GsF/8=;
 b=w2Rm9gV3qkcbQDeEmnKDAvPp+jwi10OOT00RuRapoX0gvCaflsXi/FbAeQCwJ87lJ6
 E8CsAKMelpoEf/1enYKqm3UROvZDqhj3LhXuXccQ98EzJVWqVq33DE3CwAsdFMiuYEs3
 M8xdzuGdZ6N3MRSU1jMnqObKfLPwH4EiKDaYwkWm1l+j0/gldbq8yid6bXSYVxXSTgTM
 uyiID7RtOpSI1axTpkbN3zsrTY4En29Q5GxAdVvQmFqwi6XqtiJX/ovaNi58JklxZHlh
 pwIfT0a8ZCMxuoDYycQaM9PGjZm3gvLBhos5dWAqNTy1dg23PviJKv3BEFB0MMwTKOSw
 epmA==
X-Gm-Message-State: APuU4Z9XShk1eJWQuV3rLSo7BGIZTBwHo6MCz9opdxw57RLy9shFm8HY
 LC6F94xNd3r6O2J2/RUEBR8cYIIdoh1ufCLD9tkMgl7fR8PP39Lmw+67/BQi7CdW
X-Gm-Gg: AZFdTZcebuVeAeIWYRZR9OTfCkgKxgIYEUnO9a2TclxqerUPovN9h7C0+bPun9hlcLX
 4pN4gQdFw7V4ccnpHMcu+LVKhOZJHxnKNarPjjYCHXUZfq92QrXGXLMnw1WOn4G3Z2dAGkv+Cvl
 IiIH+PX93bxA+pvRkf/DVc9RClxg3pAtqyrYyOxWjUW/rMfMGEvLODvBeLvNm0STuCm44cNwaBA
 3Tf5UceJcZragLLDqIXwu8utUBFN/oErih6UJ/UyoZ7+P0tennCmOueQU7mw5lBGNiSH41MCwmt
 TkSlKItWQ0b7Ef/cvETtVlUxdt0TJ24OZt6fxCLMQaSVVRjo6zKpl2IkPsliEb8li8pwQRYdaPu
 bLLqxQHlE2J5trBROM8yFIDesppG78EmnzUoO9uSOpY0vxbFf+5J2RaSQRuFN47WuceY3GD/lpx
 7GxxOZCkHNaVyBr3lyUNJF8mhlCvL+Y1L1Ip6ILhvP4un329cQ66g9XSJL71OwhC8vf4DoUa3+Y
 edjmgHcF8bJ50DTx5q+D8MBOaqby3t6/sPSp6JEEUIr+hTnDCfrMR7dlx3FWkbWhtRs1s49qZAm
 EUgOc8dbPtNLJ2X4Amroq5kzRguSwNiZ/kk2QlQdd8qPnQOIsWg=
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id
 5b1f17b1804b1-4bb8881eea5mr270429415e9.27.1795468825297; 
 Mon, 23 Nov 2026 13:20:25 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8533579csm338766385e9.2.2026.11.23.13.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 13:20:24 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 22:20:22 +0100
Message-ID: <20261123212022.3748880-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
References: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
 <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/qt6/qt6multimedia: fix license
 information
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qt6multimedia bundles third-party code in src/3rdparty. The license
information listed only GPL-3.0 and LGPL-3.0, with the eigen and pffft
license files, also when they are not built. Complete it, following
src/multimedia/CMakeLists.txt and the qt_attribution.json files:

- tlsf, always built: BSD-3-Clause;
- dr_wav from dr_libs, always built: Unlicense or MIT-0;
- signalsmith-stretch, built with the ffmpeg plugin: MIT;
- resonance-audio with the SADIE HRTF database, pffft and eigen, built
  with the spatial audio module: Apache-2.0, BSD-3-Clause, and MPL-2.0
  and BSD-3-Clause.

src/3rdparty/ffmpeg only has the license files of the system ffmpeg,
which the ffmpeg package already covers.

The license information was incomplete since the package was added.
The bumps to 6.9.1 and 6.11.1 then added signalsmith-stretch, dr_libs
and tlsf without updating it.

Fixes: 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b ("package/qt6/qt6multimedia: new package") [2025.02.x, 2026.08.x]
Fixes: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417 ("package/qt6: bump version to 6.9.1") [2026.08.x]
Fixes: 05cd38635a1c2a8e6c44170b5eae8488b0c7a104 ("package/qt6: bump version to 6.11.1") [2026.08.x]
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - add Fixes: tags [Thomas Petazzoni]
  - say which commits left the license information incomplete

Supersedes v1: https://patchwork.buildroot.org/project/buildroot/patch/20261122205404.3669909-3-angelo.compagnucci@gmail.com/

 package/qt6/qt6multimedia/qt6multimedia.hash |  5 ++++
 package/qt6/qt6multimedia/qt6multimedia.mk   | 28 +++++++++++++++-----
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 557530a4ef..19aeef8a92 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -9,8 +9,13 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSES/MPL-2.0.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  dd1c647e6f767f8ff4b2dfae0fed314726600a01e0cf1ef556afddd5fa96ff15  src/3rdparty/dr_libs/LICENSE
 sha256  51928dce36213c5333ba3172e847d735d4c6e9b7ff2722a326c49067155b82eb  src/3rdparty/eigen/COPYING.BSD
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  src/3rdparty/eigen/COPYING.MPL2
 sha256  ebf65756959aabc5e321d98c04ddf528b80b6982ffec355f3c743ea24018d263  src/3rdparty/eigen/COPYRIGHTS
 sha256  b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934  src/3rdparty/pffft/COPYRIGHTS
 sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3rdparty/pffft/LICENSE
+sha256  2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac  src/3rdparty/resonance-audio/COPYRIGHTS
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/resonance-audio/LICENSE
+sha256  48b2d5072817ba4cf7c2ee7af788434d001f43d36ef05e0ce5b76d7cf7262b50  src/3rdparty/resonance-audio/third_party/SADIE_hrtf_database/LICENSE
+sha256  ee2ef82481ffb445ecdd4b3a4c1f82c0cddb2da8fe39d8e8dc384fffb3e7f06f  src/3rdparty/signalsmith-stretch/LICENSE.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index d0d08cacc7..2cc61c0d81 100644
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
@@ -18,13 +21,8 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/MPL-2.0.txt \
 	LICENSES/Qt-GPL-exception-1.0.txt \
-	src/3rdparty/eigen/COPYING.BSD \
-	src/3rdparty/eigen/COPYING.MPL2 \
-	src/3rdparty/eigen/COPYRIGHTS \
-	src/3rdparty/pffft/COPYRIGHTS \
-	src/3rdparty/pffft/LICENSE
+	src/3rdparty/dr_libs/LICENSE
 
 QT6MULTIMEDIA_CONF_OPTS = \
 	-DBUILD_WITH_PCH=OFF \
@@ -57,6 +55,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
+QT6MULTIMEDIA_LICENSE += , MIT (signalsmith-stretch)
+QT6MULTIMEDIA_LICENSE_FILES += src/3rdparty/signalsmith-stretch/LICENSE.txt
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
 # libxext/libxrandr are needed for ffmpeg plugin to build with X11
 # support:
@@ -108,6 +108,20 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
+QT6MULTIMEDIA_LICENSE += \
+	, Apache-2.0 (resonance-audio), \
+	BSD-3-Clause (pffft), \
+	MPL-2.0, BSD-3-Clause (eigen)
+QT6MULTIMEDIA_LICENSE_FILES += \
+	LICENSES/MPL-2.0.txt \
+	src/3rdparty/eigen/COPYING.BSD \
+	src/3rdparty/eigen/COPYING.MPL2 \
+	src/3rdparty/eigen/COPYRIGHTS \
+	src/3rdparty/pffft/COPYRIGHTS \
+	src/3rdparty/pffft/LICENSE \
+	src/3rdparty/resonance-audio/COPYRIGHTS \
+	src/3rdparty/resonance-audio/LICENSE \
+	src/3rdparty/resonance-audio/third_party/SADIE_hrtf_database/LICENSE
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
 QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
