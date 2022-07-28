Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69544C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 15:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5F2740B8E;
	Thu, 28 Jul 2022 15:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5F2740B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBixSLtnmfQQ; Thu, 28 Jul 2022 15:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E90F40B91;
	Thu, 28 Jul 2022 15:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E90F40B91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC351BF3ED
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 15:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2775340B8E
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 15:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2775340B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIWOQxLVJPIF for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 15:45:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5EF940B20
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5EF940B20
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 15:45:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso1227982wmm.5
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zuwln3nkVUlrFppcyjq++pqPjH+jB2gV7sKngSqR5vE=;
 b=3wvDcPMBgkOVtF/74K/nwHQ/k5TJ4jrw4blZl2ete76wbFbO79oYKKxkxYXpyx1hOe
 Ge0ofHBgtlhHg/f3d2T5ccrKWABw4T/tX2yO2uKchddtRf9qSn+sERf5ejV67hx1NRuW
 1zeK4B10W84vcQxnYBFNIcEKEsaD+ALxx5UZAotUXlr28mIYLQ+3IXGRCw6E2WCHPqlu
 Tpfq7DizZHECd6mn06X1vOMioJ4hb0/ruJzNU5CBQco01hmuo9AMwojJB6VFyQfBnoE2
 UXGFrxJTuaaCEUjgCrBitALoJk28bVKjIsDPuw14o3ndni5y77pwmoAU4tFNme1KZyCV
 g2tw==
X-Gm-Message-State: AJIora+w/qCQO/GdS9yqByINEE56EdwpmvEMtGVu6G/3HXoZ2Mpc74lm
 95hNVnNbJLbHzA4/14lFbDHXOzczrR8=
X-Google-Smtp-Source: AGRyM1sXjiWupHCg++RRYcRMS5pEZAAvsFy+ndxZ4Lul2Emo0U0M4NATyiqRsODxXE1iU6QK4F+ctQ==
X-Received: by 2002:a05:600c:22c2:b0:3a3:19e3:a55 with SMTP id
 2-20020a05600c22c200b003a319e30a55mr11439wmg.53.1659023150579; 
 Thu, 28 Jul 2022 08:45:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d6e12000000b0021ece43e1besm1227511wrz.114.2022.07.28.08.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 08:45:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 17:45:42 +0200
Message-Id: <20220728154542.3061123-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zuwln3nkVUlrFppcyjq++pqPjH+jB2gV7sKngSqR5vE=;
 b=O1SdZhXjxWNcoAwt1giVRU03MVSUtmv8bphunVj66uLx40pG6pucbxtDeUSuu4NWPE
 UF0ESEx0AsJLsbZWRv+vOO+9zvigzg3FOGz4JmTAozStxqeyg169wTQoASUOIs6csyV+
 tuEUoBYl7XAgWX6a2Rr0elqHz6UVUl/ZjUPRT2o6NsdQMYAs+SemIXHf6AXOfGBlQqiE
 CyNjO1xr1YBJ9MATjOUzc68Rd9vAAPHvPlwJgICslazU1CiOY4Qh09wD++t2u74KjXGK
 YatkAZMyIZo7nTEEpktISGvlmh85ulBP/YOYUA8dFGFFzEPmtadKc0/O5NuHK2plY73T
 50jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O1SdZhXj
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: needs alsa-lib mixer
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aplay needs alsa-lib mixer since bump to version 4.0.0 in commit
e843433e186c6802ae0c31cb501b2212972ed725 and
https://github.com/Arkq/bluez-alsa/commit/7050c9a81895500fe2d59ec6e4859633d4353e36:

In file included from alsa-mixer.c:11:
alsa-mixer.h:16:21: error: unknown type name 'snd_mixer_t'; did you mean
'snd_timer_t'?
   16 | int alsa_mixer_open(snd_mixer_t **mixer, snd_mixer_elem_t
      **elem,
      |                     ^~~~~~~~~~~
      |                     snd_timer_t

So select BR2_PACKAGE_ALSA_LIB_MIXER instead of building aplay
conditionally to keep backward compatibility

Fixes:
 - http://autobuild.buildroot.org/results/d3faac6e49fe9cc21091a5dfa44780b8c63189be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez-alsa/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 42bb9133bf..73ae3d5333 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_BLUEZ_ALSA
 	depends on BR2_USE_MMU # bluez5 -> dbus
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	select BR2_PACKAGE_LIBGLIB2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
