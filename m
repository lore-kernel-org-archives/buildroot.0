Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2F606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JyUQPqud;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ugxTioOs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FDF80E1D;
	Mon,  9 Nov 2026 13:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yHKVEX-7OoB; Mon,  9 Nov 2026 13:05:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D3F0C80DEE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794229542;
	b=FEoPqO/twHoeQ5kHdVOMjL/sJLxHtotx+mdk7qnDUSC765zx9Sbulgm9HXxW6xsNe8ZI
	 Zl+oZvj/it2JuAqrSaaeRtRwfvXkvt4YC1HaB9RoPqCQPJWxgfnydOlmOJJoP2zVtkIr8
	 C5awyGb4wnQuVKQ5YZVESwWQcGci1CsLeJWRa5jcl4PA9LvrytS1XpaLWRmi0sl6BLZ21
	 1VcNk+efqdh94HYAMwFwGqJMttzYX/Rx3vyO0MY7tAosRYkIWsaCoo+Wa8b3ZPxtBjyC5
	 E4piC0Zj+/FV5c5Llggyh+BzzZXclGyZRW/rnPTY4q4/uGjB4c+CRWcfKqXRRumzTXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794229542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+tgX2AQO3dIs+49049D5U9goXys+Tf4pLXXbfm1haaQ=;
	b=qVd7nuNRLEsERqBn8qRjHqK0i3gkoc5k5WH8ohVam4a0pvr/5s4QJiEJjNbOhdMVe3Ir
	 L2NVHLE5khEV+RxYifnYlxLG6qOycv8o7NFVK3avmcQ7/fi2eJkAUC1gpDD7d9IeD2tNo
	 hh+6B2j23mpS7JYU2PcSspyaW5knqgHtoMLMaEJJbX0+qTp7mDYUuk2plB3dhkWvFqYHD
	 CSg5osMPcVEM+SwcwIPR2ydmrLmXvj7VaAqiI74BA4uKZLeqjzo8s9mEGgRpO76KXPGiG
	 YUgu8pPBnraBDE667qL9xd+oUshzYB2VdtE6K5Tb0hDRstu8Ou2bYU0CkmoZUDiurOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794229541;
	bh=+tgX2AQO3dIs+49049D5U9goXys+Tf4pLXXbfm1haaQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JyUQPqudyRAkg09XUnQRbh7UY0i8FGTm50YOgkUw9yV3YGQfDMMl/6Lj6FiY4VXcu
	 U7EuivoauD+v+uB/zCzJNgjRp1wYNJ94RoP6IYkRHV9Hwr9rPR7XHw6JEQ9Cd8UgjD
	 B1Yux8FBIL5Hzm4wh0S6C7QXzlof3CvUoJQU3dkoz72jVO4c0P0z5Fzr4U2fSYP5m/
	 aoN7MIndsz7s4zqTICPRLY4XnCeb7L+cyGhq7QDIhS/dINpgX8TjyuJbwv92+683O1
	 unITylVxxCxU8gZ8vnkfERc6jM/vIDE+5/4ccRgFOrMbwZLA/vQYkhMOleJdT02uaG
	 wFgUu9Ggc0L+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F0C80DEE;
	Mon,  9 Nov 2026 13:05:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC9B5361
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B22B5406B0
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urcr2LF_lwcM for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:05:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38E1640661
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ugxTioOs
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38E1640661
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:05:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so924045f8f.0
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 05:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794229537; x=1794834337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MGh7h/uMd+WgECVP8o72hfMeAvszOZ9r3EvoElIP7QU=;
 b=ugxTioOsiu8xa+JAYOSnvrCm7S4QP6zTtw1Q5FpS2f5V8WNqX/ZEpytpTG8CWchBeQ
 yn0z+4fQgn3SeRAeOhE2n8a/WX2uclm6cjyruaHC/QxaTHk5CK2taVf9MgehuNlWEzbt
 Yy7VFvsqbje+n/JwySqwDZlodCI4mtf9ZlXEnBiWcnclnMODWvPm+g/EFUKAHBG4SGuP
 MTxc3zQmQtrY2X6dJeSaCw80T9dhKnBGCDsmXQqUZGPD4vh28DqGTotqxb0mx5GrmotV
 Q3x5spHv+weWfdjE3p6IoPIe8XoORpoKjW1VUN6AUoCZCkTz282P/4nxc7cENK/u+5SL
 8Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794229537; x=1794834337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MGh7h/uMd+WgECVP8o72hfMeAvszOZ9r3EvoElIP7QU=;
 b=q3qFK6kSZqCHU03SQqAz9DtzbA8thG01f1lg5aarnKHFaB+zqoJxsKwpoNt1pL+TN2
 KpRePpiACAeQ3TR3d6KY2P0Q+83A7ebrlI5EeaO4ctsT1Fgg0n70skMYANnSRM/Efd7U
 HJVOS+jpUf7SFChvXEAwQ3hyrp2AqKV9HwyoChcXHfYV5S38Aks93uWMACT5jh0QZCv5
 BqA2LfjDFHuoAfaO2xTmN+/VlyT5TJR7GVEAtGG9pGG8vNcP4YUbIZKa4M3Ui5/+FFXk
 iC4wR3Kvz8jPIFGAesQ7lxhycaDwRnaG6j2CO2OZyoOq7RZquTagBHbUEro/5luxsh+e
 n5GA==
X-Gm-Message-State: APuU4Z/jk8QZScl0Erq2CBJDYu0Q3KAmlfBgM2F8QZDPuAljRW3OO6u9
 rjyr9jSvl+6cxTBvDS9r53HyJC8xXls3hqR1/47lRa0nJr3dc5mr+cjoikHnLg==
X-Gm-Gg: AYBFou1BIFKjbjqW28TCeJul2EsCweuHrs5zgooaOwkBzc4dQ+oesyroAVEkqQmBmqB
 t2GXjGYO4FHmJ33MSxOmulYIWqWrcwuvH8aLnJDbQe8jH2qTCsmJI5smNA3t8TEhtOznSv0FBHV
 SrdB7lH2WeZ1y6f74y62yLlgEePcaaqdDCH/iBDJRUUhoeVgGCJgtrA7Ae/aI9O3WOU5zyBORwZ
 NtlGzkbEbSVrvMlHQ+EQkY4g2K3OT+MiPBjJJ8AbZyfS7Jx7RjKkm3jD2luD33/AY98cIRhn12/
 Fwlj094p7tQKqvQ/XwOrdCh9uvJNMsDTYNU1LGuaGeJkCw5cfuhsg2m1glz/hW+5NJhdocsqb0D
 EBdBDrLqbkU9MK11vZKLGdTM1Osa24Z5kL7hdbaNwLc+PvexQs+a+QC7YKLQKSSkmUz3d2Ds4a/
 p0Lj5lMdgDf+AH4ZF2JCWWUL16SsrvJhVZNledLIx0LNVTEL5cSJ7yHhn2UPh5NvMMFviuIjoOX
 VcNq4LPXNc382YjC8rZu12IosCZVDTefHa+DSx9i1/83JHV9SoJZqe5dcUCuy6J61rryqiY/iU2
 Sy1UXYzZo7EzOSKaWINvnlbFL8NToZr9z+MKJ3zkdQKPrw3AUJcU
X-Received: by 2002:a05:6000:2310:b0:491:8286:5f0e with SMTP id
 ffacd0b85a97d-49585d9a986mr7055745f8f.55.1794229536365; 
 Mon, 09 Nov 2026 05:05:36 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-495974660bdsm9434372f8f.37.2026.11.09.05.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 05:05:35 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 14:05:31 +0100
Message-ID: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/qt5: security bump to version
 5.15.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This bumps the qt5 packages to Qt 5.15.19, from the kde/5.15 branch of
KDE's Qt5 Patch Collection, which is now rebased on it. qt5webengine
is bumped in its own patch, as it drops and refreshes some patches of
qt5webengine-chromium.

This should be the last Qt5 bump: Qt 5.15.19 is the very last Qt 5.15
release, and the Qt Company ended its support of Qt 5.15 after 26 May
2025 [1]. KDE keeps its Qt5 Patch Collection only for the open source
projects still on Qt 5.15 until they move to Qt 6, and only for very
critical fixes [2]. Qt5 users should plan their move to Qt6.

FYI: I am working on a series moving the Qt5 users to Qt6 and removing
Qt5 from Buildroot. Before sending it, I would like to get feedback on
this: would the removal be welcome, and when (for example after the
next LTS)?

[1] https://www.qt.io/blog/commercial-lts-qt-5.15.19-released
[2] https://community.kde.org/Qt5PatchCollection

Angelo Compagnucci (2):
  package/qt5: security bump to version 5.15.19
  package/qt5/qt5webengine: security bump to version 5.15.19

 package/qt5/qt5.mk                            |  2 +-
 package/qt5/qt53d/qt53d.hash                  |  2 +-
 package/qt5/qt53d/qt53d.mk                    |  2 +-
 package/qt5/qt5base/qt5base.hash              |  4 +-
 package/qt5/qt5base/qt5base.mk                |  4 +-
 package/qt5/qt5charts/qt5charts.hash          |  2 +-
 package/qt5/qt5charts/qt5charts.mk            |  2 +-
 .../qt5/qt5connectivity/qt5connectivity.hash  |  2 +-
 .../qt5/qt5connectivity/qt5connectivity.mk    |  2 +-
 .../qt5/qt5declarative/qt5declarative.hash    |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk  |  2 +-
 package/qt5/qt5doc/qt5doc.hash                |  2 +-
 package/qt5/qt5doc/qt5doc.mk                  |  2 +-
 .../qt5graphicaleffects.hash                  |  2 +-
 .../qt5graphicaleffects.mk                    |  2 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |  2 +-
 .../qt5/qt5imageformats/qt5imageformats.mk    |  2 +-
 package/qt5/qt5location/qt5location.hash      |  2 +-
 package/qt5/qt5location/qt5location.mk        |  2 +-
 package/qt5/qt5lottie/qt5lottie.hash          |  2 +-
 package/qt5/qt5lottie/qt5lottie.mk            |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk    |  2 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |  2 +-
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |  2 +-
 .../qt5quickcontrols2/qt5quickcontrols2.hash  |  2 +-
 .../qt5quickcontrols2/qt5quickcontrols2.mk    |  2 +-
 .../qt5quicktimeline/qt5quicktimeline.hash    |  2 +-
 .../qt5/qt5quicktimeline/qt5quicktimeline.mk  |  2 +-
 .../qt5remoteobjects/qt5remoteobjects.hash    |  2 +-
 .../qt5/qt5remoteobjects/qt5remoteobjects.mk  |  2 +-
 package/qt5/qt5scxml/qt5scxml.hash            |  2 +-
 package/qt5/qt5scxml/qt5scxml.mk              |  2 +-
 package/qt5/qt5sensors/qt5sensors.hash        |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk          |  2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash    |  2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk      |  2 +-
 package/qt5/qt5serialport/qt5serialport.hash  |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk    |  2 +-
 package/qt5/qt5speech/qt5speech.hash          |  2 +-
 package/qt5/qt5speech/qt5speech.mk            |  2 +-
 package/qt5/qt5svg/qt5svg.hash                |  2 +-
 package/qt5/qt5svg/qt5svg.mk                  |  2 +-
 package/qt5/qt5tools/qt5tools.hash            |  2 +-
 package/qt5/qt5tools/qt5tools.mk              |  2 +-
 .../qt5virtualkeyboard.hash                   |  4 +-
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |  2 +-
 package/qt5/qt5wayland/qt5wayland.hash        |  2 +-
 package/qt5/qt5wayland/qt5wayland.mk          |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk    |  2 +-
 ...> 0002-Migrate-presubmit-to-python3.patch} |  0
 .../0002-Remove-unused-python-import.patch    | 47 -------------
 ...uild-in-Python-3.11-invalid-mode-rU.patch} |  0
 ...oogle-protobuf-internal-python_mess.patch} | 14 +---
 ...-util.py-fix-Python-3.12-build-issue.patch | 70 -------------------
 ...and_buffer-service-program_manager..patch} |  0
 ...e-cstdint-for-uintptr_t-uint8_t-etc.patch} |  0
 ...Fix-build-with-glibc-2.43-and-above.patch} |  0
 ...-printed-cmd-when-long-commands-fail.patch | 57 ---------------
 .../qt5webengine-chromium.hash                |  4 +-
 .../qt5webengine-chromium.mk                  |  2 +-
 package/qt5/qt5webengine/qt5webengine.hash    |  2 +-
 package/qt5/qt5websockets/qt5websockets.hash  |  2 +-
 package/qt5/qt5websockets/qt5websockets.mk    |  2 +-
 package/qt5/qt5webview/qt5webview.hash        |  2 +-
 package/qt5/qt5webview/qt5webview.mk          |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash    |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk      |  2 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |  2 +-
 71 files changed, 68 insertions(+), 252 deletions(-)
 rename package/qt5/qt5webengine-chromium/{0003-Migrate-presubmit-to-python3.patch => 0002-Migrate-presubmit-to-python3.patch} (100%)
 delete mode 100644 package/qt5/qt5webengine-chromium/0002-Remove-unused-python-import.patch
 rename package/qt5/qt5webengine-chromium/{0005-Fix-build-in-Python-3.11-invalid-mode-rU.patch => 0003-Fix-build-in-Python-3.11-invalid-mode-rU.patch} (100%)
 rename package/qt5/qt5webengine-chromium/{0006-protobuf-python-google-protobuf-internal-python_mess.patch => 0004-protobuf-python-google-protobuf-internal-python_mess.patch} (81%)
 delete mode 100644 package/qt5/qt5webengine-chromium/0004-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch
 rename package/qt5/qt5webengine-chromium/{0007-chromium-gpu-command_buffer-service-program_manager..patch => 0005-chromium-gpu-command_buffer-service-program_manager..patch} (100%)
 rename package/qt5/qt5webengine-chromium/{0009-Include-cstdint-for-uintptr_t-uint8_t-etc.patch => 0006-Include-cstdint-for-uintptr_t-uint8_t-etc.patch} (100%)
 rename package/qt5/qt5webengine-chromium/{0010-Fix-build-with-glibc-2.43-and-above.patch => 0007-Fix-build-with-glibc-2.43-and-above.patch} (100%)
 delete mode 100644 package/qt5/qt5webengine-chromium/0008-Shorted-printed-cmd-when-long-commands-fail.patch

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
