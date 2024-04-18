Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E04FC4345F
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 17:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C9C813DC;
	Thu, 18 Apr 2024 17:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vt-Fau7sEiRp; Thu, 18 Apr 2024 17:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8959813F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8959813F9;
	Thu, 18 Apr 2024 17:09:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AF931BF2CD
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 17:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9213813F9
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 17:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtJvZNqcY_n7 for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 17:09:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F269813DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F269813DC
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F269813DC
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 17:09:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so733898f8f.3
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713460182; x=1714064982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZW6yXjfFSQ4O1nmeAo/dd2IjxNDjWzaqdSRVrRq5JHQ=;
 b=DNtsWVCJ780cZqlH62j5Nos441xcjiVPw96fw/XqkUmjxAOhj3WLXjvOTPfIHXa++5
 W1B5jQftkTj6Q45z/yf7WUnDaCX1GsxO7oxH/QXXzu2Uk7E16bQ4JnUeLae83dS7M9h/
 1S7myPTbGBmlWRdzPF5ahr8JaxqFgyoM85/CP5x1KQXWv8r3nNEIQ3lmv0lYnSdgxa9U
 9wldKuI5Dj0BOVh3d5B46orlMci1MRMJfSui542XIuvwkjTc2PUla1jQ4QGV11fiTTmE
 WdSVPOd7TULMxMcCJMnbfBnWNkHwzx7/bpLTXyLxag+aPLZfrgXtubNBXycdFYnP8Y+4
 JO6g==
X-Gm-Message-State: AOJu0YxC3cL2R8ceU51im/Ox4oB8Ap87RdMiEW6+6DUPOGWZ6gFPfAgE
 1zibvQCHObocB31g8sjRnOulEaLVCmCZM0c3Kgr1bQFDhOVLMaFpbhnOxFKV
X-Google-Smtp-Source: AGHT+IEAmlMlhYgEomdFD106oe8t1ixhF0kroM6aScIUbZ0MaO7jWcWam7Rl0rQdyBDRUNGjHq3BVg==
X-Received: by 2002:adf:e40e:0:b0:34a:3eec:c379 with SMTP id
 g14-20020adfe40e000000b0034a3eecc379mr422616wrm.67.1713460181600; 
 Thu, 18 Apr 2024 10:09:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c10-20020adfc04a000000b00343f2cca88dsm2302775wrf.76.2024.04.18.10.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 10:09:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Apr 2024 19:09:34 +0200
Message-ID: <20240418170934.7437-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713460182; x=1714064982; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZW6yXjfFSQ4O1nmeAo/dd2IjxNDjWzaqdSRVrRq5JHQ=;
 b=cqdRFb6mFBRGmor5PnpdRV2gow+RWd/kZ82g8U56qEiPRODeE9iDU9goNgU7ErH+6c
 B1Xpu03DwmZTd0tZzqGxj5N8RxvfJsX5NoSy43WQjc5hL6+J/b8BfPW7WjFFEYCf9iI8
 WkFQxaLpm1WV6yeUGwt+mTL64NqI1bR186b4bzrEOAK1J+IdY8HaGZweateLTU4z/rAT
 k6wg7NmYqHbt/IkGbCbTOU/ib0Yx17PgasDYmDTOHZ8rHMyVhTog3nKlsUrmcJg7K/rT
 Uc/JstNJTWspkSrhMsRgPtRoMiLn3fdMZxSwtJS+MmGT9TG+76hyiAFDjs0NoNvkOHM5
 OorA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cqdRFb6m
Subject: [Buildroot] [PATCH 1/1] package/freedrp: security bump to version
 2.11.6
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following CVEs:

- CVE-2024-32041 [Low[ OutOfBound Read in zgfx_decompress_segment
- CVE-2024-32039 [Moderate] Integer overflow & OutOfBound Write in
  clear_decompress_residual_data
- CVE-2024-32040 [Low] integer underflow in nsc_rle_decode
- CVE-2024-32458 [Low] OutOfBound Read in planar_skip_plane_rle
- CVE-2024-32459 [Low] OutOfBound Read in ncrush_decompress
- CVE-2024-32460 [Low] OutOfBound Read in interleaved_decompress

https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index daf933e0af..9ac9b25066 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.11.5.tar.gz.sha256
-sha256  70785ad9934d75aed1734f8918a05aff95788e58e53081e84651106b24303dc2  freerdp-2.11.5.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.11.6.tar.gz.sha256
+sha256  ad5a0c7761b18af914041ed50902d6c9fd553e65eeba8a1bea41c4149980b84c  freerdp-2.11.6.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 29b33f61c3..8e359cbb4f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.11.5
+FREERDP_VERSION = 2.11.6
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
