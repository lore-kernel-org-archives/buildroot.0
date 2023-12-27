Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B40C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 13:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A264E821ED;
	Wed, 27 Dec 2023 13:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A264E821ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRJFXpohl_DU; Wed, 27 Dec 2023 13:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB92821D9;
	Wed, 27 Dec 2023 13:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB92821D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D5E41BF366
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 13:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 367F84136C
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 13:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 367F84136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h59Yga8jMerS for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 13:47:01 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECE83410D5
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 13:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECE83410D5
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3367a304091so5118592f8f.3
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 05:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703684818; x=1704289618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MibuMXJWsVtd4GSCoRUXTiI7gLR/4hkxUevvCjCX+Io=;
 b=MwbfX6y7lB3n0NnLJnhxcOJWB8jmMR28k5Aq5hTIYNpA6BNCXcy6l8DflaZeEpwmvu
 gnaFYoeZ/4b56hae6O08q3owtrCofy67cT4hZOY3E83piIPHK6UahQ50LeAL2RAW86K1
 T6hqjeuF4EELibuVN4ibAFsA7NO4Ilbu3UJVb/iN94xam+YbFjYfInlTBiYyfcCXvFCc
 6hRrghHvTgjqunq4eErS1OYc4mNPR30W+Hfwjmu/V6MM1TdJbNg1FQCVw3dFH5WgDS/0
 qOeRoTvgE719bek3j3k/+VlveMGMqBPKLUirUYsFn8/qlp/smfjvcVQsz+YXS6xh3m9x
 avwQ==
X-Gm-Message-State: AOJu0YxgHZauHkLCqYnDj9l2itz+0v4V/zW/kWJzHWZwmxfF/5pys4s5
 idTlszM+jBR/peBZtvk3VewCUP4/hQg=
X-Google-Smtp-Source: AGHT+IFrhnmBMXEvWxD7ChTxlGFvCAbc6GFeIh171bgOarRAnGhp2XY5it5XiQ1gn9Zs/nMwoDydDg==
X-Received: by 2002:a5d:4b84:0:b0:336:74e3:63cc with SMTP id
 b4-20020a5d4b84000000b0033674e363ccmr3030186wrt.209.1703684818359; 
 Wed, 27 Dec 2023 05:46:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u16-20020adfed50000000b003367b7a5581sm14812044wro.28.2023.12.27.05.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 05:46:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 14:46:56 +0100
Message-ID: <20231227134656.1288718-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703684818; x=1704289618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MibuMXJWsVtd4GSCoRUXTiI7gLR/4hkxUevvCjCX+Io=;
 b=Ge8Zio2A6PeH4WM8tx+JNnrbaVCADgq/MxfxuJdvW+aD8E5TndhwL0EhFOneMcGxm9
 qzdCyDLZDV49UCxmF/1jVxzzv4fgodtwat8yIDW1uFb8M+IrLjmEPUJu9Gy74cwWDGJL
 6KhMlG7v5mG5CHPyuSFuF7FghIXkV7qVws46EaQZoEkr6dEVsUemE11uoXa7jsMST1r0
 ijuwZgljjHlBVjYfjLO959jKpmBg/U3LW6qpAb3oPcqt23AKNDiSeHUrWx60NG94M+UO
 2WMlKcqqFa2tB8phESSPLYxfX8oKoZjAqCbuy5x+mT7PYE0SuMAW1MGJkSV+P/AzpwOC
 dAtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ge8Zio2A
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: drop readline
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

readline is not a dependency since bump to version 0.15.0 in commit
cbd06adac50e304f413689febf676911ae29d967 and
https://github.com/RidgeRun/gstd-1.x/commit/978b503840e0f9ae99f732113babbc4fbfb2a770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gstd/Config.in | 1 -
 package/gstreamer1/gstd/gstd.mk   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
index df1d2f59c3..bfe1a40bfd 100644
--- a/package/gstreamer1/gstd/Config.in
+++ b/package/gstreamer1/gstd/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_GSTD
 	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_READLINE
 	help
 	  GStreamer Daemon, also called gstd, is a GStreamer framework
 	  for controlling audio and video streaming using an
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index ccb3b3e1bc..965ede7949 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -17,8 +17,7 @@ GSTD_DEPENDENCIES = \
 	libdaemon \
 	libedit \
 	libglib2 \
-	libsoup \
-	readline
+	libsoup
 
 GSTD_CONF_OPTS = \
 	-Denable-tests=disabled \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
