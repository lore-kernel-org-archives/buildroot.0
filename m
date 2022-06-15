Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0031C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2625840342;
	Wed, 15 Jun 2022 20:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qx_G5AqRpAiQ; Wed, 15 Jun 2022 20:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F363E40A06;
	Wed, 15 Jun 2022 20:53:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52FCC1BF356
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CBAB40A02
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEhz4P78CfHV for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 20:53:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA27A40A06
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 20:53:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso1798516wms.2
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZpQVBF73fTw4dXcPq8TpvAH0EW8J3DKulUu5h39IOI0=;
 b=TIfIaep2uO/CdxpmDnOKOZFqNjqQQi19iNnl6xB15WbesBLuQPxlbN2csRWvPVR/km
 OK3/MJW8haEBYw0rUZ19+aP/vg2Uv1d6JqCoKPQQGsyd1r94v6VQBBnEs/1EdZOAt9NU
 iuVM6Dem6OnacmGNy6cKNJ40QavNwdmaMF4toC702bLS1mtKi7BSPO8JSB3P36Xoqt1k
 HISCt9//i7r+LI3MSLU3n6fEZFjc2uB/+ID6gA9CrnwCorEdqmBp76sNyBHF7Hs2YwIg
 oO1HiW8hsgRbL5VnblrHs/8UGURbYvI1tshl241SrUlIRav+euF3mpD5PaoIMvX9UrAL
 txNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZpQVBF73fTw4dXcPq8TpvAH0EW8J3DKulUu5h39IOI0=;
 b=bynLjhYOTgYo3t1nKGKunnUdjK795U6sp8c1uqeIuta06kkHw1cHUjZziChkncoSCW
 TspOmZchyWQhId6j2zrWNvFAlO12//hBuP/PQPjseAVQxHLdtezchMcMeruL7Hm2rpTc
 t/qE23clai1xAWZBn2tQbMmulE/kODSGwUQOF2yN8A+2g0z0rTgAUCtvCOfbmRM+hh17
 cVLdV5VCEdsCZw6LK3dfXeDEY7F33yzgcboQZOXgXpPQviDeW6k5d//KMOYxRbG6QztF
 uBYdYil6fNcA1SUBaUlZ6aAxuuDTB82/bJV0g4H3OlxmXDirOsQ9IW5vZDbJDIakFAi3
 PqJA==
X-Gm-Message-State: AOAM530W/fk97OxZzJ99UA/U5qmbeyKs1z0RWGav+wrYGAsOwQa/uD5J
 72bo3Uj3qXJc52LQEMalGVz39bIozYo=
X-Google-Smtp-Source: ABdhPJymNDyROBcBXfa9XdcVcQxtBMF4pqekhN0nkNYgrVkT/eAy3R0jAHmOpSOw3egNb3NMTgnMIQ==
X-Received: by 2002:a05:600c:1f17:b0:39c:6b20:51b1 with SMTP id
 bd23-20020a05600c1f1700b0039c6b2051b1mr11988175wmb.131.1655326392832; 
 Wed, 15 Jun 2022 13:53:12 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f123-20020a1c3881000000b003973ea7e725sm4607034wma.0.2022.06.15.13.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 13:53:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 22:50:26 +0200
Message-Id: <20220615205026.117274-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: selects
 BR2_PACKAGE_ALSA_LIB_{PCM, RAWMIDI}
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

alsactl (which is unconditionally built) needs
BR2_PACKAGE_ALSA_LIB_RAWMIDI since bump to version 1.2.7 in commit
4dc8563363d639255217ffc59482eaccf93a1b51 and
https://github.com/alsa-project/alsa-utils/commit/bbc74a61ac7c35e506c3d7f76ecf943cb55736a6:

info.c:83:44: error: unknown type name 'snd_rawmidi_stream_t'; did you mean 'snd_pcm_stream_t'?
   83 | static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
      |                                            ^~~~~~~~~~~~~~~~~~~~
      |                                            snd_pcm_stream_t

aplay (which is always built as BR2_PACKAGE_ALSA_LIB_PCM is selected by
BR2_PACKAGE_ALSA_LIB) needs BR2_PACKAGE_ALSA_LIB_UCM since bump to
version 1.2.7 in commit 4dc8563363d639255217ffc59482eaccf93a1b51 and
https://github.com/alsa-project/alsa-utils/commit/90f59671784a7e47b40485095cd66892d4840ed7:

aplay.c:44:10: fatal error: alsa/use-case.h: No such file or directory
   44 | #include <alsa/use-case.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/708aecfafccecd99f8a4178412a9dd0cf9123f72
 - http://autobuild.buildroot.org/results/366aa43e82615e2a5a36fcb98b3bdfbc5e99786f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-utils/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 2d7062b0ca..2358b3f83a 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -7,6 +7,8 @@ menuconfig BR2_PACKAGE_ALSA_UTILS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	select BR2_PACKAGE_ALSA_LIB_UCM
 	help
 	  This package contains the command line utilities for the ALSA
 	  project.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
