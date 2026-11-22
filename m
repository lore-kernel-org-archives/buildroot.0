Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784AE606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qhON9SLn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGN5OsKX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7415F405E7;
	Sun, 22 Nov 2026 20:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fR7BuwUPZUnY; Sun, 22 Nov 2026 20:54:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03CD44060F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795380855;
	b=epvOg5jMRaUebzeqxAxa1k09zdidG3p/jhvByDhobyJpajpbHCHbj+08q3jS+mV+P0he
	 GYqbZHOop4+/rMwDDcKxJxc5XXKiYyU5FdRrDr705WKALksV1zFE/TrrgxzZle4Lb3Y4c
	 mBc+5esJKb3qsY0lb+RJtN4KTS4NAt9FlA6rAAZE+uhvrA/Cygsybi7DhqnLx1TKmLnHP
	 jKIAYxlm2VjJbkd0KWhnYMrTHmkUzw54UjohUVUIa2pSrkA5CHFdr51VaxgS8tikvCMYY
	 GSlSsmOu/5Fe336rOT72Cy2JKE5Reo+PFsW/DovtFeoBJqPLv/vap/jF59cVYsuUeMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795380855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DHRxoozS1LuiFLzBLC2R1NCdWm7/XwbetfDV48XSi9U=;
	b=mcsafmjKnhrEYGnKmOtMvV4L9lthjw3hDJPLghhmN8BAQa33YZJsreUX0EB/EbsCaIS5
	 RgXm8AceNxXOjxOxsyyiNX0Zgaeq5ohyOnTxxi0GdUkaJaq7tK3Vw6Gcm216o6qiGF094
	 0+5zfIVwy05PTsXP8xYBN1wMB849qnAf5e2PnX3t3AEWQXnmmyNCSjNGsaFEurmkKH8sA
	 MbQHzAxaeJx2FaIrIthzjqZR/HOXXV963as8tYGIF9PM4VytjTpEvlWUADLfdplRBtGZS
	 reYpp4TRfQ7HXefXBxOY/OM25+EEr1Es6WPmggqh1Iv/X1kkV8eo8tOfaC/OVnoMdrQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795380855;
	bh=DHRxoozS1LuiFLzBLC2R1NCdWm7/XwbetfDV48XSi9U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qhON9SLn+Y73gIobBsir4cz7OiXLdwSfEx0CjVSAydwTLWgXWLP3PaOzUs2FOU3y6
	 fkKI2Z6O0uUdVK2yQg2LL8Z6KrzW9YryFSJrCPvIlnVprfrrfp8VI0KDbaaX5tHg/g
	 cbheVf79fhbAI6ERRYGbuN7sfsWyAhgPylXuTroxpuc3IBa1tVMRlY4HKLyTEf/+g0
	 eq/4Tld71g3++mXRK8fM/lqeARmy8QGPUTFVPu6N094ymj6hrVfj63y+eRfs2rDUd1
	 eMgwA4vu6X8sGYC8Q6UWDosMK//GRXomiQhlk1Z6SffVGgMRm8fRpgIr0gvK+FwVyJ
	 r0HhA3KOrn7RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03CD44060F;
	Sun, 22 Nov 2026 20:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96AEC260
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 888FA80AE3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRjj6Jsan-fU for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A57380AF3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=TGN5OsKX
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A57380AF3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4bb64c99d2fso26209915e9.3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795380848; x=1795985648; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X6nk4PNQ8YCLnL35U4i48cTycsYY27DYQBW4DQ4Hb84=;
 b=TGN5OsKXAbtxxMHYTk5xEVjevVACZOlloLzI+a4NCRzknsSJsFH1IO+SfvG1YOD7Sh
 Sw1eoLGV3GUtXkqOM8g8sdgMBUY7WrOjkGQZA2kgpnFUKbLTyIWpDP67pIuYI3sqNdOD
 ndWn9LItBOkhLHS0/xt5Pz+q04Au60I5T3YZkQYkwntQtwtJf5hFE0V/hyK8Iqwww5V9
 R06BHzJA8h9VxBqjaFf9CE0NgVH3QgLD+wsp1xSO46at0H4FjEDKYRdQT73p4gQNauwI
 ObZyNKHIQS/3lPfjbOeHWmuGKFCcxusxsrwyidE95bDD6Lwg577Xlj2G0O4GdvIPBr4S
 71rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795380848; x=1795985648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X6nk4PNQ8YCLnL35U4i48cTycsYY27DYQBW4DQ4Hb84=;
 b=WvvA2hOowft0tSiUfi0Z3Fc+hE1SrT9BNyRyS2vlkxp4oY0YYd0Rtbdp8RYanajSHW
 dUV0W1nhv2nGgQErbn1eiCa0vpjXTFy8cocRTSlG0JZZZ2mgbQLUnub7tmrObizL8BFP
 L4Nc/WKBYk+OcT8J2fc3mkHTxWZQflzRypCEwd6Dq4FxWPQlRXuhjF4c7zbpT+YvtPk1
 5C5nqM5h2vfwAR847qagfRcFkwW88lfyBObwsk50jV5/IlygHHkcs7JABDA+FQ7ikLgA
 yScrK1OGetJIOLnPrCfn9KK5vpH58ERUsPCj4G+3v31EYuM5ri9EPpxWU5+hTCmsVgdR
 Ewjw==
X-Gm-Message-State: APuU4Z8QawrbJnzpbwhcp/ht50NI9t3Y3fzUPPXxL0rli6MnLSzJRWY8
 xd8UuFQ2xaKH9HT6XYav8Rbs0gYb0t/rsvGF8tchUF2asV9wS7tz4cM4djRgbPeN
X-Gm-Gg: AZFdTZc9EjMR/i74nd5ZDrW3k2r4wrTXYqnUSLiNcUHyDbt1AxeoboISbFlgWXbSnjn
 sFqYXYbOUfi07n29cdYWjd7Ctu0VK6G/kmxtF6SIf42orkm1g/uEa2Y0LwUDmKzP9JxdlBEtP7Z
 1KY6p+nwMyV4Vf172fsHVwXPbHaG8YGfWSO9Pf+fO7pE9hGsp/4U70nN/+t0LqZWF9RsM58Ndst
 DIAsRokap8Ejdx7GnH+J9mPwdpQN1UsxYor5bPQTjIvXV6gy2Sy6uprNI0z/0ycCeeafF2vEu3t
 1PuJCy2WES5MwVMxFaqXbEVX0R5KfTHrG1CkfNNNyT37UaWYOKN+tdFlAs7uENvja6WdnTo9mvz
 NiFVGOUiY+CWrE5NIRpgUkZxuVujPRI84jm0UepufZPZgxlr+lOtIYFDgilkCoPG3LgfzOunBSR
 a2e8c8qLphdEW+5E7O4vwRSKyiwYIn3gU8CHgJJa2OYuJhBdiTv50Gxa1lVmBso7TSWYqdVfdBC
 8spFAFOLSlh3TRwpOUxG8q9HXCrNQBIK4MSG5dneoLfI7li/9xQGWdjyICd5aa4TZlFZNcXSIiu
 9E4gOsFSWo0FVbbaCyYQ+gnME8L3bcBCOxdz5+B8E3qQA2/cYjg=
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id
 5b1f17b1804b1-4bb88804d1cmr224652675e9.5.1795380848193; 
 Sun, 22 Nov 2026 12:54:08 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm249135255e9.1.2026.11.22.12.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:54:07 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:54:04 +0100
Message-ID: <20261122205404.3669909-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
References: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/qt6/qt6multimedia: fix license
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
Cc: Baxiche Su <baxiche@gmail.com>,
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

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
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
