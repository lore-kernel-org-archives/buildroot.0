Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ED2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 16:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AF8833AE;
	Sat, 26 Feb 2022 16:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MITqucjPfe04; Sat, 26 Feb 2022 16:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B190182B08;
	Sat, 26 Feb 2022 16:05:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9401A1BF422
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 16:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81DC982D0F
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 16:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NxqhUrf8oGQ for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 16:05:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 274F682923
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 16:05:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r10so8898797wrp.3
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=illfe8Cvcy4p57wRi5beWnIhjZAfllMU3894F7Onjbk=;
 b=XJ2r7V+b2cqwTZYW05hPSmFqxMObNDA2khsomc9M32OZxav3Ye2n2bSNJNjZR/qjkf
 ZMIMbV0cY+3yaY62sogbKQZfPtKklOt3fuFo9DFTyMtB1fxxTOCWSnt7m6xnx691kGL/
 081ntNh0QUHdtkNgSCMMKuNx9mIDi/oYtefgEDkANJY9ytBO55qV23gn9vcbQbuIqakP
 PYeC7/BL7HU+D73h2Mwn+Op7ppGWN7bjB0Rj8bUN9Axv9+xvDJRqXOONZBqJduIeLInb
 egVVMKXHo1dj4YwxtiLUiL7Gs2lmedEoE+JR7PNmE2E32x/FhDxN752eLhYVd3U/fNyh
 ie4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=illfe8Cvcy4p57wRi5beWnIhjZAfllMU3894F7Onjbk=;
 b=MsGx+7XNLKEFFxQZmjAkkXjgp5pmc5z4m1uvMfmEH6XVEeB0VACcYUq0902Oa/pnp3
 jB46Khn6hnr+2sIvWS9+OqzYY+YhOfsizaT/ew5M9+Htj3DxCjBIuFsRLKP4JAMAT6ON
 5gI8cY9evGmmYx1rRTj/V1UllxBV07ifM8NN0U0DDa3rAMR8odyFq1oVBZuFYRmrCTrz
 KXOfOgcZ5ADD3CxNpmcC36TnK4WOh7iPLOtjOSpq/73tY7N3AtlUf9cBAW4JNJTAVTd2
 08DiD467ZHftAWfJmfUcZHvFjXbQrzsgbfpYENh0s5g6m1Jr5KWyAtJdYLpCGWPnz3c7
 8oAw==
X-Gm-Message-State: AOAM532RF0UCY9GEDCsIIBJjcVooHfmeFJBtmqTRw1Zm/hPLVJvOB3j3
 8jtZet3NsEi0+BJQOQvrcLKwixwhnK4=
X-Google-Smtp-Source: ABdhPJx3dvh5L9OE5ni2E+KXn37QniuzJER8LqcKBDvOxJhfVzqzZUFU/L6rcoS3phDuFTPB5Medog==
X-Received: by 2002:a5d:4f03:0:b0:1ed:9eb4:9e45 with SMTP id
 c3-20020a5d4f03000000b001ed9eb49e45mr9775346wru.464.1645891518128; 
 Sat, 26 Feb 2022 08:05:18 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d4ec3000000b001ea95eba44dsm5152493wrv.109.2022.02.26.08.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 08:05:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 17:05:03 +0100
Message-Id: <20220226160503.2703879-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to version
 2.12
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following security issues (i.e. CVE-2021-37706, CVE-2021-41141,
CVE-2021-43804, CVE-2021-43845, CVE-2022-21722 and CVE-2022-21723):
- Potential integer underflow upon receiving STUN message
  (GHSA-2qpg-f6wf-w984)
- Use after free of dialog set (GHSA-ffff-m5fm-qm62)
- Missing unreleased of locks in failure cases (GHSA-8fmx-hqw7-6gmc)
- Potential out-of-bounds read when parsing RTCP BYE message
  (GHSA-3qx3-cg72-wrh9)
- Prevent OOB read for RTCP XR block (GHSA-r374-qrwv-86hh)
- Potential buffer overflow in pjsua_player_create(),
  pjsua_recorder_create(), pjmedia_wav_player_create(), and
  pjsua_call_dump() (GHSA-qcvw-h34v-c7r9)
- Potential out-of-bound read during RTP/RTCP parsing
  (GHSA-m66q-q64c-hv36)
- Prevent OOB read in multipart parsing (GHSA-7fw8-54cv-r7pm)
- Use after free of dialog set (GHSA-ffff-m5fm-qm62)

https://github.com/pjsip/pjproject/releases/tag/2.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index f39ebf4060..74331ab6fb 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  45f6604372df3f49293749cd7c0b42cb21c4fb666c66f8ed9765de004d1eae38  pjproject-2.11.1.tar.gz
+sha256  b3b94d9be4aba8f6d2d1cb164603e81b0a6ee17352f9e2ba5b58e325e610ca5a  pjproject-2.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index b05cc31a83..32cfa8c53c 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.11.1
+LIBPJSIP_VERSION = 2.12
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
-# https://github.com/pjsip/pjproject/archive/2.11.1.tar.gz
+# https://github.com/pjsip/pjproject/archive/2.12.tar.gz
 
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
