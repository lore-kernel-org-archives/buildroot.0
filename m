Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AF4CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 08:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9EE54051F;
	Sat, 21 Sep 2024 08:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3K7x6ME_nbk; Sat, 21 Sep 2024 08:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5128405F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5128405F3;
	Sat, 21 Sep 2024 08:09:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE0641BF3D8
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 08:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7C9441947
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 08:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suC1cyOU5px1 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 08:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=hannah.kiekens@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A935412FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A935412FB
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A935412FB
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 08:08:51 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so25214205e9.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 01:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726906129; x=1727510929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJ3pZmol+6vVom+Hz/AF0ucdiw1nkY9aXB1aqhM2Jqg=;
 b=pXB608AOnpAH39pcBTI3fbsZxVtt39EoXS3yRp5joXGyQ12Qf8pbUI1wbEV1dv8x0m
 1Yg48V+33mCriLw0efR8nxelx3kvaYK1lRjrrCFrglfMLZfHMBNWkL/H473wQegzpV1E
 MSxz4BK7bBSGPdtmGT+spumCxnBRVej7mp/2pqD63VvI5cHRo5V725UooH+7D1IICpta
 ayKJxAD4mVVgI1cdJIcM4Jv8Yg5Eyck8PdVJmXWLLIldsWe7Km5MSPrAa/0D2ue4Jnum
 ShxMJtxYt79cKjwH4bAchhNzSsv/jN12QoLiJRn3vyrV5MR5yQ5VTJgGNhZyqAyX7t0a
 B9tg==
X-Gm-Message-State: AOJu0YxGXsZaqiWX7OWAwiTUQFb4i2bR1Mrfda0VMa3uAk9GxtseIVr1
 myEKQifJ+S8k4vrtTn9stm0OdAxSW6aMST1JoQSU4l4UAZBKgLAkz0LF4HauEdSY2ip5OxFDtuN
 iej4=
X-Google-Smtp-Source: AGHT+IHoGuvVd3hHv1Zm0jIxEFMve4/1p4tIrhZegy6uhzkAnyBYZyvOi0RTNfCgc6ORuyHHSqYSAQ==
X-Received: by 2002:a05:600c:6048:b0:42c:b197:96d8 with SMTP id
 5b1f17b1804b1-42e7abe534fmr35179025e9.5.1726906128689; 
 Sat, 21 Sep 2024 01:08:48 -0700 (PDT)
Received: from hannah-arch.kiekens-verhaege.be (d8D87D23B.access.telenet.be.
 [141.135.210.59]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7afd5b79sm43490025e9.26.2024.09.21.01.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 01:08:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 10:08:45 +0200
Message-ID: <20240921080845.18098-1-hannah.kiekens@mind.be>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726906129; x=1727510929; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OJ3pZmol+6vVom+Hz/AF0ucdiw1nkY9aXB1aqhM2Jqg=;
 b=N6NI3bWrew/qxB3YbbzdGqMRuDueCyLrf9enwBt77aOnaDaFMmENDT9yajkvBHsNNd
 nDRwCo2hqkVvIdMTMDXzJMNcu6Lq5mnlvwLO91nLokxb05zPDlPiX0waF2L4TPF8BHWC
 fAW3ZywNSpbBYGGs/rHK71QY2Lci3iLQTx/2/2p/9HDwYksbJm7dM3fNHpjs68xVCh3T
 GLOnj2kIt1fTJnxJl5tIqt+zP9g9dChGDy2E6upOBG1XuX9mfX5G6TEw9NEeLZHO/29u
 ijNDNoO2UjSFyTSoc3achp/ZSfL8Voge9/CZoPE0VGb/x3OIqfXThZfig5zB+09qc10H
 LGRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N6NI3bWr
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6base: remove
 -DFEATURE_concurrent=OFF from hard coded list
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
From: Hannah Kiekens via buildroot <buildroot@buildroot.org>
Reply-To: Hannah Kiekens <hannah.kiekens@mind.be>
Cc: Hannah Kiekens <hannah.kiekens@mind.be>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is set by BR2_PACKAGE_QT6BASE_CONCURRENT

Signed-off-by: Hannah Kiekens <hannah.kiekens@mind.be>
---
 package/qt6/qt6base/qt6base.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4c0392f92d..e3c8f8920a 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -46,7 +46,6 @@ QT6BASE_INSTALL_STAGING = YES
 QT6BASE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DINSTALL_ARCHDATADIR=lib/qt6 \
-	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
