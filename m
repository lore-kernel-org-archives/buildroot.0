Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAFAC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124F4403D4;
	Sat, 20 Jul 2024 21:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpNXwmd8wGsp; Sat, 20 Jul 2024 21:01:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F41403DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F41403DF;
	Sat, 20 Jul 2024 21:01:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7A61BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 138244018B
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoKo59i9T7QV for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:01:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8754F40151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8754F40151
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8754F40151
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:01:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-369cb9f086aso49781f8f.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 14:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721509279; x=1722114079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FgBpGFpWdA310UtNY7WMN5Nuh4nbgsZg9CxoTkwACLA=;
 b=Dk4RcvoUkkSRzJlXWsFcdc1+rof/Ro1y+6bKXkrUk8p2y4mzKnYIzSyoGU1Rga5lTB
 Fu/7fjUt7vkVICp7LBH91pnVlxaBQGGGH7mzuVu81hALecs41tYlRmS8HezZcU0LocJP
 11YQQx52ujl/KX13c+UvBZM32tcz3d/+p5/fVmv9wJi8NQF+9impo2fhLJYZuZM1DjRj
 2BjPCSI85vaXLuQCwLin8kj4T4gECL0F7NEEmNh2iC3rcGXP9TxpV+i50sRQRwkXcO6e
 3pufpex1lhNvSYJK+Md0svtVFBwgzfS7va3zucvn5QZ8pRiqLzZ0gXPdwj/bloCJ0AsD
 ry2g==
X-Gm-Message-State: AOJu0Ywcm/uE2dzZRpvjs5zfvsIKQrxrIOInXdSxFEukYKD+tZxM4NPY
 Su1vh5F+u7ib+qC9UaPAVhyhmkc1bzTBm9s8PJe9CVJ0btkUNZSoG5ElcQ==
X-Google-Smtp-Source: AGHT+IEK4P4m90tAMovzQqUju6BlmFdo3VC51RHXFDOwkvadxXWbkHpErjb83mAkKDk00WUEXM4ZsQ==
X-Received: by 2002:adf:a1d7:0:b0:360:744e:4f23 with SMTP id
 ffacd0b85a97d-369bb3340e8mr1492863f8f.63.1721509278718; 
 Sat, 20 Jul 2024 14:01:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868b5fdsm4551462f8f.38.2024.07.20.14.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 14:01:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:01:14 +0200
Message-ID: <20240720210114.1714249-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721509279; x=1722114079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FgBpGFpWdA310UtNY7WMN5Nuh4nbgsZg9CxoTkwACLA=;
 b=Qo4w2EhF9LVs+edEYoIdG9r7QDVDrIaUBYe4oh4G81Oejx03T+CCXpPWENG6HzF33g
 clrXiv1zrBTcVfw+ZccfSZUTmF61oWQ57hSdr5GTbdwykrBhqmMKGUp7ESP2YqSTmBcr
 woJ9EzkDnGIWx19j7SyI28XCD5WiHFjYE6gF4uFAh93+jxA7H06+Ij2LzsBOjWlhMURn
 xfxClHqxTSHSRRQktkehpGFtZDlDnzAYgxQUVnRlQXPs2vMAhao6VPc48/I6PpwNmXBe
 49CHTW2Wf15LwP1f6aSqE4aTl7JJ1IUioBj28lqWmAvmKe1OOemSH4tpKdHHe4zKgdKj
 d/5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qo4w2EhF
Subject: [Buildroot] [PATCH 1/1] package/gtkiostream: fix build with alsa-lib
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Matt Flax <flatmax@flatmax.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select BR2_PACKAGE_ALSA_LIB_MIXER if needed to fix the following build
failure with alsa-lib raised since the addition of the package in commit
fab48302865e5c0c98d91b696bc90e75e38189bb:

In file included from ../include/ALSA/MixerElement.H:20,
                 from ../include/ALSA/Mixer.H:20,
                 from ../include/ALSA/ALSA.H:56,
                 from ALSAControlMonitor.C:19:
../include/ALSA/MixerElementTypes.H:26:5: error: 'snd_mixer_selem_channel_id_t' does not name a type
   26 |     snd_mixer_selem_channel_id_t channel; ///< The ALSA channel ID
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
 - http://autobuild.buildroot.org/results/6be71c9fbdccbdf4f5e540bafa748dda833aeedb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtkiostream/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
index 17480b8ff8..1d1ec27346 100644
--- a/package/gtkiostream/Config.in
+++ b/package/gtkiostream/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GTKIOSTREAM
 	bool "gtkiostream"
 	depends on BR2_INSTALL_LIBSTDCPP # eigen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_EIGEN
 	select BR2_PACKAGE_FFTW
 	select BR2_PACKAGE_FFTW_DOUBLE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
