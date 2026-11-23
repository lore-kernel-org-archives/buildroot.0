Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9091606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e+VfVfvj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAwtAlLy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B42E607C1;
	Mon, 23 Nov 2026 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjVRv_M-bjWF; Mon, 23 Nov 2026 22:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD1AB60789
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795471228;
	b=Q7pcDR/copWsc5qhmSOVRVWZyxwJWb3ZO2cQ5juYouCgIHHrJnaqB+VdJRnjqkp0swO0
	 k/KWag05QnrLv+0a9jvDy30PVMf2UQt5J22yz4Zao+pzPgS0/dUzxLD9KU57xqUUxsXPx
	 4HwgMmxctWp99NMj0kRBZsqScM3CXCDYZQKfT91zLP9/OfAOyyS9w4uVgQgVbnNRHXclI
	 XwvxkIkwIP/FyUL1CyodoIr2SrEsLPnvJyOhpm1pZ2pev6/SFi44dMrnNrygNM2dJNtHD
	 b26MeV5lqOGk/nIuSho1bECbkIr3jnQcRkMSqlg1jHuCmAKACZOolLQLv9HIJYXeaew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=W/igY/mt7bIyxtW8jWi6M6CQNqaOZkE/x+omsmoEtzk=;
	b=r2T0jRGAereK5/hNy0BSI2mIIQJUUFz5xI5NzEacvi2XWMLaQKjakLyfiI/q7rpmd9kb
	 laGjK0xI+mnTmAQ2vKCClYN1tfa2OhxwyY/Ax+bBZcQ7VDGrQlMTrj7pBlfmgoAN8CtVG
	 9cyWHy+ebNnRPPs1osIEFL1vlfdupZwupT5lG6ztAQoHB74+76ophh0D/MZp1g+I8/EYg
	 +2SsP2n7p1zxOTucDuzAhd8CZ5Ui3S1pUmvi83898PvkcToKKpmMI+dKN/htSTXcZqX4c
	 6E836Q45O3AP4MzUIB3RmaoMc+Xu9Jh9tv36eGBYaFwzygODTu7/JoiMOLL6RjEjAPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795471228;
	bh=W/igY/mt7bIyxtW8jWi6M6CQNqaOZkE/x+omsmoEtzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e+VfVfvjFrUy3Y2F58PjHmlyoc/sePjFumA9rfatVfl0bfBZsMQiqRSg9D5JYoqVE
	 rrpUtKb1Wivn/qSAe6imb8ZAakI7Q4o2XXIIHe6sh+cThmKh0ypQCk8XsTi2/gOWKl
	 0cTjbI1bEon6iv9mZBTY2eiehFh2NI94PJ1Yp31tP1dLmnJ9O6oo5cqVDekg3h0/ZH
	 Got541+HslMUIKD+OyIZwbjilgrKeve0sSu3H+cHZDME8qf3RalHmtGe5qhVBJXCtF
	 SQTDkzVCR1Q022SyDtBqw2PFVeoG/F47/gF8sJZKdlyBXJs7tpJwrvxSWhaOwYbNyH
	 aCDBuZsHnBGbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1AB60789;
	Mon, 23 Nov 2026 22:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD76C499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF03980F41
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmrbCym23D10 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 22:00:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F89780F3E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=RAwtAlLy
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F89780F3E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4ba013938d7so35046095e9.2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795471222; x=1796076022; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1A5SJTFJTOqMyPj+kraOvtY0nuPB031+b4QPZJEMYqg=;
 b=RAwtAlLyNEhyoJX6e7qa1xyCsOmEvCS+CsBt/82GspV57ZWYJxGFT+X1j9ys3gJOLM
 BcQdAbcmls80Q7lk3SyBuq0d4jZEqxTkVL3f9dLMC5p8ZKfAh3UkCVRcLL09q1RG6sxt
 BbOKu8YwRdAEXxg9nMaDFkWVg8kx6PTxpzVen+QqT45QtCWVPuEuJJbwKDra9AV9PuyY
 qa6VENYO3YRCxUCEA2R7jE6ndQ1z7tyZeC3gHoYsgQR7BSF2OqoEEXIf7cp1aDKQd3Fp
 kWInhlSfDKc8vXwzzX4vxT4gmGiVRTqaWXgFNNZJS1NpRa6QH92Be3bwwdyBre6vYJN/
 A5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795471222; x=1796076022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1A5SJTFJTOqMyPj+kraOvtY0nuPB031+b4QPZJEMYqg=;
 b=oZmQiDEursY8Jcj0eivjXbPL5asOoQ0ZvDs6XzEh6V8rE1tC6/mEIRmYs2hfAWdt1g
 DQigbbmrJ2lIuOV7iniGeC1ophTUh+url5NQ4FfxQ7Ee1ZN4wvYELB6bNOlwpQMnuvsO
 ueVvMphD7FGPXZ3VKE28mSlcYxL5iNGJdyoBiiqxaR22/prlQTBY7NnTL5SS32EnFVSJ
 Ma9WEe09ORd58+29JODIX3Gi+KTgttwcXGjMeG/HpD2s27XVZyMT0ulN3FgXOLYuZRLU
 MgL8P3fq/sOjHV8aq4LtT//S7qTWRBq0vAhdXkM4gVsNvhhW2uUGvlqvGfc8wv7Y3Y2b
 1NEQ==
X-Gm-Message-State: APuU4Z+0eFYSP1gsP+lkSrHmrbxsr5gtUEtVTugCAKqiHuBpp7d1CuOB
 htuBqOkz/CRP8Lnirubtqh/mzD6VGf3ItJY/XvajfcIRngKD098b/7omoU/jeRI0
X-Gm-Gg: AZFdTZes/GnyahLlD6FVdFZcnErQkAC7v3slihbAk8iJf2AUayhMzZoJwPezxeclNev
 n0uKpkL9MZpGIDbgVe/Aa5V/LoQg741KKBB1AiipqSZtXnjf4as/ddIpUN7GLrn6fuRtGT6CPux
 Adl2TdPTUG29PPz9e+visYj21UI6lATBoV1Tk/wrHAwgFI8sLSSWutdf1JITtasDArue3uBfteU
 zWoltL62TIe2wYTUSOEM1Z5WLH9MojXZs8j1oPvXUvOkv/LIELrcf273NvMnIWIAZcMbgsz8aGv
 6oBiPYgD+cn5udOh/8KGDS/2bUbPnkE8hBhsuECXK236czAoR/N20O+gdcbj2I00dK0n6nkeWuV
 EEsTYj3wY6rvd8PnnGMJTNhFCayL2diDCk0Y03v3heZ4L8DYxJ3pnboGQvRDvdw5wwrgybLpIDr
 A7eWtqEPex96Aymv6gG7Amn+3kslV6zdx0DCbxH1fpaW+mqicfnMpgk1i1ZTy6X/MNMX02BcuCU
 sfljDRY488qJfPFPtW3jpLL7s3cJr1ARWplM3oUWf4HKhLbl9KwaIdVAk/BXh3UGCmE+cIAdbRJ
 rP8zlPEnn8ctyMj276eJE7vEf4Vr7YwV5iSdsNMmfGA6VwNkLz0uHFJFSYehqj4/6jphaANG
X-Received: by 2002:a05:600c:4e4c:b0:4b6:5dac:b61e with SMTP id
 5b1f17b1804b1-4bb88938d2dmr240798885e9.32.1795471222017; 
 Mon, 23 Nov 2026 14:00:22 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906635c7sm205310275e9.2.2026.11.23.14.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 14:00:21 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 23:00:15 +0100
Message-ID: <20261123220017.3955658-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
References: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
 <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/4] package/qt6/qt6multimedia: fix spatial
 audio licenses
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

The spatial audio module of qt6multimedia builds the bundled
resonance-audio, with the SADIE HRTF database, pffft and eigen. The
package lists the eigen and pffft license files even when this module
is disabled, and misses the resonance-audio ones.

List these licenses only with the spatial audio module:

- resonance-audio and the SADIE HRTF database: Apache-2.0;
- pffft: BSD-3-Clause;
- eigen: MPL-2.0 and BSD-3-Clause.

Backport to: 2025.02.x, 2026.08.x

Fixes: 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b ("package/qt6/qt6multimedia: new package")
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch, split from "package/qt6/qt6multimedia: fix license
    information": the spatial audio part, also needed on 2025.02.x
    [Thomas Petazzoni]
  - add the "Backport to:" line

Changes v1 -> v2:
  - add Fixes: tags [Thomas Petazzoni]
  - say which commits left the license information incomplete

Supersedes v2 (in part): https://patchwork.buildroot.org/project/buildroot/patch/20261123212022.3748880-2-angelo.compagnucci@gmail.com/

 package/qt6/qt6multimedia/qt6multimedia.hash |  3 +++
 package/qt6/qt6multimedia/qt6multimedia.mk   | 22 +++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 557530a4ef..4f8ea03008 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -14,3 +14,6 @@ sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  src/3r
 sha256  ebf65756959aabc5e321d98c04ddf528b80b6982ffec355f3c743ea24018d263  src/3rdparty/eigen/COPYRIGHTS
 sha256  b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934  src/3rdparty/pffft/COPYRIGHTS
 sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3rdparty/pffft/LICENSE
+sha256  2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac  src/3rdparty/resonance-audio/COPYRIGHTS
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/resonance-audio/LICENSE
+sha256  48b2d5072817ba4cf7c2ee7af788434d001f43d36ef05e0ce5b76d7cf7262b50  src/3rdparty/resonance-audio/third_party/SADIE_hrtf_database/LICENSE
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index d0d08cacc7..e6485570c9 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -18,13 +18,7 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/MPL-2.0.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt \
-	src/3rdparty/eigen/COPYING.BSD \
-	src/3rdparty/eigen/COPYING.MPL2 \
-	src/3rdparty/eigen/COPYRIGHTS \
-	src/3rdparty/pffft/COPYRIGHTS \
-	src/3rdparty/pffft/LICENSE
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6MULTIMEDIA_CONF_OPTS = \
 	-DBUILD_WITH_PCH=OFF \
@@ -108,6 +102,20 @@ endif
 
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
