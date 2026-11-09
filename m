Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9796606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i8soyjST;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8b88jWS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 861C76061B;
	Mon,  9 Nov 2026 13:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naep2z2vkFLW; Mon,  9 Nov 2026 13:05:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6C769606DA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794229546;
	b=irDT/JqCqOzUkPymB/bBvWAFjtATeJY9ex5z7RI99FKdx7lnCq3Ug/Z61VReFUBHqnMW
	 cwCQTeWwbC8w7Ily7cIxFpkDksXol2mv79OoBCB8/qCRzYZAENY2F7+U+oqRHJmWyurzM
	 HVV3S2th7I0Z99qbfjmaucoieiRBKoKf5R8DiEAZZa2H68XHUV62phqL94ToGVnujgA1Q
	 m36sFpCpnQ/cfbsr5Vhm54rrJEiNqle+EvW0LcujjNIM7ODBX7xMMghwCDVtmRPfF3Tgp
	 kGNhvsiC33hmFDLimFrZD+x6pfE6RJ53aXC/EN1ankkT5/nUrQy1Ixuv4be6Bjs/PLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794229546;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LJONZ0sTeZjlEFI+lwwVfijYTQDOJABe360ZSvCKzig=;
	b=P3NvCFg+rJBkoDY+ZH3uTV1Du1FBja9Ync3RyVocWzP5kEeEmGHxl+FDAK86u6KvdasY
	 x/8UeOeTGNN2eTBfXdo0vEeENejAwhcHalVQLcHSf8vFyHgE3lCpD68RSOolfsWqSfvuX
	 LVq00KRVy8N3Cfb6wjY9btx6vvPrgdguoQXfh/WykQnoT12UBajwqF4BMSEcIelwrsdGw
	 1fKTB7/8TmMk5T8TV35RREjfsr3T03cBB5l5+AhxpZJXxxKQAoc9pCTMiDqgBcNEd1uM9
	 JzZ9SJM+AmzkjmdzzpBF2ZJEoNd6jqJ3J3DPJej9cDL5ywJlcsruFGPKsrznPfhK+SQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794229546;
	bh=LJONZ0sTeZjlEFI+lwwVfijYTQDOJABe360ZSvCKzig=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i8soyjSTdScE9Qc9uc7wyqlQ1sH5PLtBAT1dPKB8cTYL+J/c0fFa+yXeRofQ0haMd
	 m5ovpo5GJcfva+yOFvEsRgFBzLvgFEFKNVV8vx+e2q/xtPLm8QTyWUHgMI5T/E3T2V
	 RwvppE8+CLjXfcZ2dULrKr+bGrOag9CylozLkV7uFKJDla/5JMaee1q1/40bvVnNZ2
	 SJxJ/tYVXy1VhH0j5VYsIEr5Oqc4vLVa92XUVERGXMJVBcDg/6FZM7eZB89NoBXoV0
	 4xxpRLsY0illg6uI7oN0LUUnU/RkkDZL0bik9OVxIG3m1/BqAUw51+PIfH880YTBqd
	 3OB+4O7pNM6gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C769606DA;
	Mon,  9 Nov 2026 13:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73950111
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E68400CB
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NxFRRXb7eBw for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:05:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5B2F4400BE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=V8b88jWS
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B2F4400BE
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:05:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4922dbcee23so429349f8f.0
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 05:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794229539; x=1794834339; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f1gZo08HP0C1Fvq/CWmN3++ubLMjHuo374oStRMYL0c=;
 b=V8b88jWSJb/vyoyTahZT3Sn1mgBUtC8PwJxMLJKStg1yeYFkpHfa4PIlpz4jryAvpW
 tMM4Gf+B2dAcw6gdxDKiFCFZNosrpgiDuOvN/ZOtTmTOFJV90KK9opkZg20gAsFtAsrn
 c9piYmOq95y9CfLZqIH2+b+dsWi4lujJxpdPS9AzWOMbSFqu4uCsuWeED/yCCAPzz0Bn
 RnyE7myKQeb/ibIqYJpUR1mfbXz+gVNI6mRxvhHz5Jxw3WqYl6b7FP00DQjdiAg/FYBS
 nBDN8SIkHZ/+1k7PATrFHCkkvWfRyaCljgX1YIfq4mwcy4+ASAtbOfqOaVPWEMrM6iRi
 tXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794229539; x=1794834339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=f1gZo08HP0C1Fvq/CWmN3++ubLMjHuo374oStRMYL0c=;
 b=JINn0j0Uya34+8dAaNmGPjIAQZwFyeE8YFdkn2sY5REI/IWekLPf1cd88MVF1qJja9
 BmqApLhMZWKRq/brbp6BA1sF1yHx98kWGW10nr2fJ5ByC/aYt9NpoGGCT264w7gF7mfZ
 tz4+lw4VSssGjWLRwV3AiwOCwKElY1pFGX39i+nVgkbYFUcSPX8bRU3XCCs5GQnk/XYO
 /9I3YQuj+lpcg4SXyo86gREltiN4XuURusNDEWOLFYhhyHW0nvOjqG+32Qzz7Fp9/PKF
 oJ4GQLEPPZoMg50JApaXsbywE7U9YAxggiOmpY75tZrjmF/4JNic4IKdl7jXCkqlvqy1
 zRgQ==
X-Gm-Message-State: APuU4Z98yvlVeEtmrWdx1fMvOJzTJnjsQlcENj9Jdjd69Snk9z/RgQVY
 CMw0Gga1mKRHHUrOgfrgygqJ93SR/RgMqUdi9i1aKKiYgayMaEen5NtzQplQeA==
X-Gm-Gg: AYBFou0o0LznMpItrKjXfZNhq2CdbUpQriJVrTEwdiBqCYAzCX0RUES3t5xpHQf5ZUI
 3fJ5X4C4JUj9/ZtksfIBd4ZriuFjGe74hBM92cKsbNSiYNosg++yBH/2fGZkxKCt6M+h/OpUOsL
 5cFL1xk5Fe5yXrKNeNveW3SKK+Yd4atzhJ88iKqzT0Ca7uTDiuUpYd4lY9WIJFX7pno4v5V9ALd
 UJWskMb3JKIyI9/bfjryJn5n33ZN8g+94UWhJE3UyrVRqloKF3bGJu8RYRgGB2Rx04tuSyrBXMQ
 kTTHrCmbEtC+ZLmokfO8/fgakmJggnLhmt5eEXCi9wOkvwTCsOyhD8h57S8VT2c1kP1dWqjv+5W
 uQ8ek6VigP+bUlNzymybrSzrpEntq17thviYI4Nhh9pu5eQirSzFPm4srW9v4mFiXyDS+4NAES6
 hNMwxsg3NNnofPJZc6cvDwA1A12Az45W7UAPduHRJawZc2suv4L9zjKcF8/2lRLf/9oz+t4bfGo
 b2fHq4Ui8lSiNnbKxD+aryugd6sIqabFhPUnviz4ZY30R4CsToGXMdbvEQeuwA1n7gF+34wsZXz
 2jJWDx5Y6ISfq6Xhd004aQgZ5SV1IAf6rlelwuf3E4+zB4zbBHYe
X-Received: by 2002:a05:6000:186b:b0:48e:7026:5243 with SMTP id
 ffacd0b85a97d-495829c1110mr7979756f8f.20.1794229537924; 
 Mon, 09 Nov 2026 05:05:37 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-495974660bdsm9434372f8f.37.2026.11.09.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 05:05:37 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 14:05:32 +0100
Message-ID: <20261109130533.4171508-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
References: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/qt5: security bump to version
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

- CVE-2025-5455: remotely triggerable assertion in data: URL handling
  (qtbase)
- CVE-2025-4211: improper link resolution before file access in
  QFileSystemEngine on Windows (qtbase)
- CVE-2025-30348: denial of service in the Qt XML module (qtbase)
- CVE-2025-23050: read past the end of the buffer and division by zero
  in QLowEnergyController on Linux (qtconnectivity)
- CVE-2025-12385: improper validation of <img> tag size in the Text
  component parser (qtdeclarative)

The fixes of CVE-2025-5455, CVE-2025-4211 and CVE-2025-30348 were
already in the previous qtbase version from KDE, but they are fixed by
Qt 5.15.19 and still reported for 5.15.18, the version used for the
CVE tracking.

Bump the qt5 packages to the latest submodule versions of the kde/5.15
branch of KDE's Qt5 Patch Collection, now rebased on Qt 5.15.19:
https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

qtbase carries the v5.15.19-lts-lgpl tag, so QT5_VERSION is now
5.15.19. qt5webengine, which follows QT5_VERSION, stays at 5.15.18 and
is bumped by the next commit, together with qt5webengine-chromium.

License hash changes:
- qt5base: the hash of src/3rdparty/harfbuzz-ng/COPYING was already
  outdated, the file did not change in this bump (it is only checked
  when the bundled harfbuzz is used);
- qt5virtualkeyboard: the Apache-2.0 appendix was added to
  src/plugins/pinyin/3rdparty/pinyin/NOTICE.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/qt5/qt5.mk                                       | 2 +-
 package/qt5/qt53d/qt53d.hash                             | 2 +-
 package/qt5/qt53d/qt53d.mk                               | 2 +-
 package/qt5/qt5base/qt5base.hash                         | 4 ++--
 package/qt5/qt5base/qt5base.mk                           | 4 ++--
 package/qt5/qt5charts/qt5charts.hash                     | 2 +-
 package/qt5/qt5charts/qt5charts.mk                       | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash         | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk           | 2 +-
 package/qt5/qt5declarative/qt5declarative.hash           | 2 +-
 package/qt5/qt5declarative/qt5declarative.mk             | 2 +-
 package/qt5/qt5doc/qt5doc.hash                           | 2 +-
 package/qt5/qt5doc/qt5doc.mk                             | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash         | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk           | 2 +-
 package/qt5/qt5location/qt5location.hash                 | 2 +-
 package/qt5/qt5location/qt5location.mk                   | 2 +-
 package/qt5/qt5lottie/qt5lottie.hash                     | 2 +-
 package/qt5/qt5lottie/qt5lottie.mk                       | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash             | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk               | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash       | 2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk         | 2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.hash       | 2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk         | 2 +-
 package/qt5/qt5scxml/qt5scxml.hash                       | 2 +-
 package/qt5/qt5scxml/qt5scxml.mk                         | 2 +-
 package/qt5/qt5sensors/qt5sensors.hash                   | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                     | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash               | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
 package/qt5/qt5serialport/qt5serialport.hash             | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk               | 2 +-
 package/qt5/qt5speech/qt5speech.hash                     | 2 +-
 package/qt5/qt5speech/qt5speech.mk                       | 2 +-
 package/qt5/qt5svg/qt5svg.hash                           | 2 +-
 package/qt5/qt5svg/qt5svg.mk                             | 2 +-
 package/qt5/qt5tools/qt5tools.hash                       | 2 +-
 package/qt5/qt5tools/qt5tools.mk                         | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 4 ++--
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk     | 2 +-
 package/qt5/qt5wayland/qt5wayland.hash                   | 2 +-
 package/qt5/qt5wayland/qt5wayland.mk                     | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash             | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk               | 2 +-
 package/qt5/qt5webengine/qt5webengine.mk                 | 2 +-
 package/qt5/qt5websockets/qt5websockets.hash             | 2 +-
 package/qt5/qt5websockets/qt5websockets.mk               | 2 +-
 package/qt5/qt5webview/qt5webview.hash                   | 2 +-
 package/qt5/qt5webview/qt5webview.mk                     | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash               | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk                 | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 2 +-
 60 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 9895f337f0..9c2e4f0717 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5_VERSION_MAJOR = 5.15
-QT5_VERSION = $(QT5_VERSION_MAJOR).18
+QT5_VERSION = $(QT5_VERSION_MAJOR).19
 QT5_SITE = https://invent.kde.org/qt/qt
 
 include $(sort $(wildcard package/qt5/*/*.mk))
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 966da7d3e5..75f1d56bec 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a7bab355f0a1d7b17b0e41179f21af8d30d0d1075af5876e9a9fb0a6a12ac982  qt3d-208f5835e6c2415c9dc5cbe92bba83aa28bab7ea.tar.bz2
+sha256  e673a5a2e31964a9a5e94db0287db7a294e3f39a94742755b63792362cc12742  qt3d-c3892c3ee3c0a2b8a050d0a1532f34806636eade.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index f058454463..9730daf6a2 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT53D_VERSION = 208f5835e6c2415c9dc5cbe92bba83aa28bab7ea
+QT53D_VERSION = c3892c3ee3c0a2b8a050d0a1532f34806636eade
 QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
 QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
 QT53D_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index def257b2b4..6a310ad1a0 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3b4bfbd1844aba3b753146ca7d008177010ebb819fcb224c6c0afd8496d8abff  qt5base-bebdfd54917e25d1c100e6bd9f5dd53c2e645fd8-git4.tar.gz
+sha256  a2070894fab5e9c143d420dd5523f26547b4eaa664ea925cffaea7f85aa35297  qt5base-fbed962c3195ab3952fa54d40e012ad1a4fdc42b-git4.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
@@ -7,4 +7,4 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
 sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
-sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
+sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3e54465ed7..ff97da8dc4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-QT5BASE_VERSION = bebdfd54917e25d1c100e6bd9f5dd53c2e645fd8
+QT5BASE_VERSION = fbed962c3195ab3952fa54d40e012ad1a4fdc42b
 QT5BASE_SITE = $(QT5_SITE)/qtbase
 QT5BASE_SITE_METHOD = git
 QT5BASE_CPE_ID_VENDOR = qt
 QT5BASE_CPE_ID_PRODUCT = qt
 # Closest upstream version
-QT5BASE_CPE_ID_VERSION = 5.15.18
+QT5BASE_CPE_ID_VERSION = 5.15.19
 
 QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 468b77b3ab..bb742c57e5 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e7421098d79b6c030392e6679a5a91c594bd2075e545555a67d05665c79ecb44  qtcharts-1093fb53ced126100d14af30a8adffd29b7ef855.tar.bz2
+sha256  c63722904859ba2dbf87bc7cd00f23d5d8e861940607aea6f2faa67851097eba  qtcharts-16e9aff210cd4de7192adfc6cd91cdd44ba45a3d.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 348f3643d4..418ed11298 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CHARTS_VERSION = 1093fb53ced126100d14af30a8adffd29b7ef855
+QT5CHARTS_VERSION = 16e9aff210cd4de7192adfc6cd91cdd44ba45a3d
 QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
 QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
 QT5CHARTS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 6dc9eda4bb..0d7a9ad8ff 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  321b3a484e4c488156dd018ee38a5b869cc0ee1fcd676a59b4e026eebc5021d8  qtconnectivity-f1be05c8efeb65b77a8bfd21763ab55bb5c04906.tar.bz2
+sha256  15f4f7694e1e0feef588b8342c75cf7b49e1c84185daa1500a7e75798f0bb921  qtconnectivity-7e29434e06372efbb2127d0ef41538ff9aec1597.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 8af36ad90c..0888d4dcd6 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CONNECTIVITY_VERSION = f1be05c8efeb65b77a8bfd21763ab55bb5c04906
+QT5CONNECTIVITY_VERSION = 7e29434e06372efbb2127d0ef41538ff9aec1597
 QT5CONNECTIVITY_SITE = $(QT5_SITE)/qtconnectivity/-/archive/$(QT5CONNECTIVITY_VERSION)
 QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5CONNECTIVITY_VERSION).tar.bz2
 QT5CONNECTIVITY_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index e8ed01341b..8c032ec308 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fe9a13d56162c09d37bdf6677074b7f8dd3cf529b19c255327cef0bd37ff710b  qtdeclarative-f78bc0b2c6884fd730bf34a931870d67936cf01d.tar.bz2
+sha256  537cce323d9c73719fdfb77235876af4b9243a81456b4d48e4e8def725f72708  qtdeclarative-5bc1ac07b2d2c7839368084a4bb97e4c67eb8294.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 7f274d6653..fe90c22916 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DECLARATIVE_VERSION = f78bc0b2c6884fd730bf34a931870d67936cf01d
+QT5DECLARATIVE_VERSION = 5bc1ac07b2d2c7839368084a4bb97e4c67eb8294
 QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
 QT5DECLARATIVE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5doc/qt5doc.hash b/package/qt5/qt5doc/qt5doc.hash
index 9d2c8c1cad..bec3665d7e 100644
--- a/package/qt5/qt5doc/qt5doc.hash
+++ b/package/qt5/qt5doc/qt5doc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f70449c1c55f18993733d0aa9af9c84a3ed43215be88316e6f4b87dc248944a4  qtdoc-ddb2afda6f713259fc8d95fb22a1c96bb448c36a.tar.bz2
+sha256  cf90c9c646460a5c865864b1f3cac19e88902dc841b3b4454ee1224287595de6  qtdoc-385efd460ec13a465765fc30dd11217ae46d1846.tar.bz2
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5doc/qt5doc.mk b/package/qt5/qt5doc/qt5doc.mk
index 8de814657b..c530c11d00 100644
--- a/package/qt5/qt5doc/qt5doc.mk
+++ b/package/qt5/qt5doc/qt5doc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DOC_VERSION = ddb2afda6f713259fc8d95fb22a1c96bb448c36a
+QT5DOC_VERSION = 385efd460ec13a465765fc30dd11217ae46d1846
 QT5DOC_SITE = $(QT5_SITE)/qtdoc/-/archive/$(QT5DOC_VERSION)
 QT5DOC_SOURCE = qtdoc-$(QT5DOC_VERSION).tar.bz2
 QT5DOC_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index a6d799f32b..24373789d1 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9e0809574fc3fae648d505528cfdfa681edb6b41e29a69e2e7e633fb48621f28  qtgraphicaleffects-dfb2e7b2c98a9b7185c300d0b92b4048f5d89ba5.tar.bz2
+sha256  1e1567942c6984312d7e134f56fcd5b970c1f9013e02e62b714e7a197fda9e00  qtgraphicaleffects-551732fb1d963e53af437e3982a010f69eb76253.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 8aae5ccae8..74b4f2ad44 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5GRAPHICALEFFECTS_VERSION = dfb2e7b2c98a9b7185c300d0b92b4048f5d89ba5
+QT5GRAPHICALEFFECTS_VERSION = 551732fb1d963e53af437e3982a010f69eb76253
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)/qtgraphicaleffects/-/archive/$(QT5GRAPHICALEFFECTS_VERSION)
 QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5GRAPHICALEFFECTS_VERSION).tar.bz2
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index cb65976822..13892eac27 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6c49db8c44cda8559692427ec5c32429efe406cc66c88afdc70fdd23993ae511  qtimageformats-c91e4c63c1eaf1e23806d9df10e3d5a9ae353c1d.tar.bz2
+sha256  6dc7d4bc2f9c894452fbd0f8ef6e726a931a5c8bd938a4e983098a30716ce4d0  qtimageformats-4076e38d68f05f5e1bcdedb79442d9008f18702c.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 4e83eb9cb3..361c9ea056 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5IMAGEFORMATS_VERSION = c91e4c63c1eaf1e23806d9df10e3d5a9ae353c1d
+QT5IMAGEFORMATS_VERSION = 4076e38d68f05f5e1bcdedb79442d9008f18702c
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)/qtimageformats/-/archive/$(QT5IMAGEFORMATS_VERSION)
 QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5IMAGEFORMATS_VERSION).tar.bz2
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index ee65c7fa84..8fecff6b0e 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  40dbee28e205482d8fb2345cde648d38c64910847463ccb05065e2fe7cc373a2  qt5location-ba48a8b5cedd157d972c08d371ac2581db166bf7-git4.tar.gz
+sha256  07500bea8ef9b91ed0228748df11522703ff772532158a752c060f66bcf15711  qt5location-81f560be2274958011c255efa1d2d573874bed11-git4.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 451dd953ed..1adebe87e4 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOCATION_VERSION = ba48a8b5cedd157d972c08d371ac2581db166bf7
+QT5LOCATION_VERSION = 81f560be2274958011c255efa1d2d573874bed11
 QT5LOCATION_SITE = $(QT5_SITE)/qtlocation
 QT5LOCATION_SITE_METHOD = git
 QT5LOCATION_GIT_SUBMODULES = YES
diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
index a81fe5ea6e..8f0b05f5d8 100644
--- a/package/qt5/qt5lottie/qt5lottie.hash
+++ b/package/qt5/qt5lottie/qt5lottie.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d872dfeb3b1b812165506e7e7cef5039b2fd441187f0ca30e6a93a968e9392a7  qtlottie-27ed5a3c95a0810a96fac2a8661ea94d8ea3c44e.tar.bz2
+sha256  d3a292eecfcf9b5e9b8180f8f92bb3a84eb841062144ca812947b95e595c4719  qtlottie-5f1be885cf4ee0f1eb5400bf0c5d138818fc01d0.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
index 7b3bfe6ffd..42f23897e6 100644
--- a/package/qt5/qt5lottie/qt5lottie.mk
+++ b/package/qt5/qt5lottie/qt5lottie.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOTTIE_VERSION = 27ed5a3c95a0810a96fac2a8661ea94d8ea3c44e
+QT5LOTTIE_VERSION = 5f1be885cf4ee0f1eb5400bf0c5d138818fc01d0
 QT5LOTTIE_SITE = $(QT5_SITE)/qtlottie/-/archive/$(QT5LOTTIE_VERSION)
 QT5LOTTIE_SOURCE = qtlottie-$(QT5LOTTIE_VERSION).tar.bz2
 QT5LOTTIE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 1a4f889de6..d2ac0095a1 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a160196093ee0bcd30383104da9143f0ed09e2074e3025a2b1d987946b2d1a53  qtmultimedia-ff83d119c75cd8406f73ccc08958fe36747e7390.tar.bz2
+sha256  e756e8ae67e0c2dc5aed5c114f43c2e8af076e07fa517efefd050b67740a95e2  qtmultimedia-8ddc44103baf166525d6650c842d7f08f651e7bb.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index c18561d1aa..12d7d1c496 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5MULTIMEDIA_VERSION = ff83d119c75cd8406f73ccc08958fe36747e7390
+QT5MULTIMEDIA_VERSION = 8ddc44103baf166525d6650c842d7f08f651e7bb
 QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
 QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
 QT5MULTIMEDIA_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 44a68b4d56..625eae59b5 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  11dd2a55a9c877f8766cc0dab04908cf3acd6fa933895c0ed64828be79babb9c  qtquickcontrols-0c3c18bf8bdac1ef1afdb8aade903edb5c2bc041.tar.bz2
+sha256  646d9791662e49030a648b48c3d2aabf0dfc286ffb8a906eaa5ea64ea498c2a5  qtquickcontrols-af7fc486c8910b51733e1c7e758d50ca1a158b36.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index f0949ca253..fd593c9c31 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS_VERSION = 0c3c18bf8bdac1ef1afdb8aade903edb5c2bc041
+QT5QUICKCONTROLS_VERSION = af7fc486c8910b51733e1c7e758d50ca1a158b36
 QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
 QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
 QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 2102a7320c..073fdd57ac 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3922c0f1de88aca778a0835e4f9928f13acecebec4abca2cb47fbdebc4b69de9  qtquickcontrols2-e464888c53a641ee44a34ff2350cfb156c8ed59f.tar.bz2
+sha256  eb9dd065dbf0c1a8d7d06584f1f44d7b25fcb31e5297a27796323c03f93d220f  qtquickcontrols2-5b808e0995d018c6de9f075d4a61f58d3641c11b.tar.bz2
 
 # Hashes for license files:
 sha256  d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index 48a56d399f..4e90f2d500 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS2_VERSION = e464888c53a641ee44a34ff2350cfb156c8ed59f
+QT5QUICKCONTROLS2_VERSION = 5b808e0995d018c6de9f075d4a61f58d3641c11b
 QT5QUICKCONTROLS2_SITE = $(QT5_SITE)/qtquickcontrols2/-/archive/$(QT5QUICKCONTROLS2_VERSION)
 QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5QUICKCONTROLS2_VERSION).tar.bz2
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index 31405675d6..312359288c 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  dbd5d9acafc73825c8f6565f2933642c3c786765867badeeced72bacde2ed9cf  qtquicktimeline-43130f2681b76a8d743a04704465b716b6b2faee.tar.bz2
+sha256  b80f9152bb7ebfc8e761a08c439ed861bd0f5c73a81ed93a51e324d616426a3c  qtquicktimeline-ea9d6c4d5a0a172b4778e8f37d694d02aab83f37.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
index 7e4efc318e..1a9d91a82a 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKTIMELINE_VERSION = 43130f2681b76a8d743a04704465b716b6b2faee
+QT5QUICKTIMELINE_VERSION = ea9d6c4d5a0a172b4778e8f37d694d02aab83f37
 QT5QUICKTIMELINE_SITE = $(QT5_SITE)/qtquicktimeline/-/archive/$(QT5QUICKTIMELINE_VERSION)
 QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5QUICKTIMELINE_VERSION).tar.bz2
 QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
index db164e60db..1276e9f5ac 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  222c2754d0921dceff0697e95cc0d117d69957ce2b59605ecaa62b172bd259fa  qtremoteobjects-b2740a7c7f5b6ac810240404a947ca5cff9de5f7.tar.bz2
+sha256  7937be573022e644a655371df914197c82d0b707e8884d4abab9ae9f71cdd1fa  qtremoteobjects-48d10f341279e08c1bc4abb764c2d3ab9a259a51.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
index ba0cf6f4b3..f7cd663fc2 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5REMOTEOBJECTS_VERSION = b2740a7c7f5b6ac810240404a947ca5cff9de5f7
+QT5REMOTEOBJECTS_VERSION = 48d10f341279e08c1bc4abb764c2d3ab9a259a51
 QT5REMOTEOBJECTS_SITE = $(QT5_SITE)/qtremoteobjects/-/archive/$(QT5REMOTEOBJECTS_VERSION)
 QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5REMOTEOBJECTS_VERSION).tar.bz2
 QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 6681328e4b..e0e305536b 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  867db30640540f08506446191a7a963d17055778e6c2f570a9e873386571923b  qtscxml-57491f554bc53bd020978b5744437b7ac7e56a27.tar.bz2
+sha256  cf23a7ba24714539636b05ac92df476f5fd39205f0bb44dc1a7a1862b63403b8  qtscxml-edc6f0dd5e806cced1937b2b853717f588e14fd2.tar.bz2
 
 # Hashes for license files:
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 2e5a12a6be..068b9d7059 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SCXML_VERSION = 57491f554bc53bd020978b5744437b7ac7e56a27
+QT5SCXML_VERSION = edc6f0dd5e806cced1937b2b853717f588e14fd2
 QT5SCXML_SITE = $(QT5_SITE)/qtscxml/-/archive/$(QT5SCXML_VERSION)
 QT5SCXML_SOURCE = qtscxml-$(QT5SCXML_VERSION).tar.bz2
 QT5SCXML_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 6ba9d7ae07..d66b169af1 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a9c64bbec1eb0275fd8a65aad3266d7699a8456e95adfcab75bffcaa2eb0d0a7  qtsensors-50a61b360877e7c1300df76b5aabf8d75554a398.tar.bz2
+sha256  994d5989ca87aea80677e7a0f063f38a88d7c3991f6c259f0df027a13bba37d9  qtsensors-8c6d11df60d4d783869c2d81568e3178f5ae75ce.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index cddfbaf588..b362a2c84c 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SENSORS_VERSION = 50a61b360877e7c1300df76b5aabf8d75554a398
+QT5SENSORS_VERSION = 8c6d11df60d4d783869c2d81568e3178f5ae75ce
 QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
 QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
 QT5SENSORS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 7ec310cd81..6d65f00cc3 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f7adf196dca88859b1d2962cd37c638b4d7f7ee261849cc43bea88db86569cef  qtserialbus-c23069351ec31563c9ea9fcdce42ccdba95ea518.tar.bz2
+sha256  f247c1838a0a68f0346be604639e2d57148d003d4c4f52f436200fa94782c47b  qtserialbus-6734222bccc5541f9527281c810c6b5f8fdd092f.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 87a3ef639e..418553a2a5 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALBUS_VERSION = c23069351ec31563c9ea9fcdce42ccdba95ea518
+QT5SERIALBUS_VERSION = 6734222bccc5541f9527281c810c6b5f8fdd092f
 QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
 QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
 QT5SERIALBUS_DEPENDENCIES = qt5serialport
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index b867abd4af..6cbb6a8f3b 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e444f67762ca7641e7e9288c6f7a7f877a149bff3c84abc07bf06ef3bf55e173  qtserialport-b64a7eeda9b6a65b5ed01b1b40b07177f0aa4c0f.tar.bz2
+sha256  f876a002891a92f25cc5b9aacc8f37ebcbcb9e1efae6c92087a649b17b5e61f3  qtserialport-ca1f2486527e7acf87d466062c035845f9774573.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 729ac10be6..d9b48c0aed 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALPORT_VERSION = b64a7eeda9b6a65b5ed01b1b40b07177f0aa4c0f
+QT5SERIALPORT_VERSION = ca1f2486527e7acf87d466062c035845f9774573
 QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
 QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
 QT5SERIALPORT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5speech/qt5speech.hash b/package/qt5/qt5speech/qt5speech.hash
index 04001e6256..4674ec4d64 100644
--- a/package/qt5/qt5speech/qt5speech.hash
+++ b/package/qt5/qt5speech/qt5speech.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  460f33a11110e0a730543799b7946ed92d286b1f6dc6f4681575434a5a71fd86  qtspeech-aa2376f9b1302222edcd16b4641bbd7004318c00.tar.bz2
+sha256  165d64b1014f6c382096340a1740b27d8d0160f89733d7092a14285a73491116  qtspeech-a384f0d4fb8a2d0743d5dfdf12e40f6d76f8714c.tar.bz2
 
 # Hashes for license files:
 sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
diff --git a/package/qt5/qt5speech/qt5speech.mk b/package/qt5/qt5speech/qt5speech.mk
index e5336e64d0..26ee57b4e7 100644
--- a/package/qt5/qt5speech/qt5speech.mk
+++ b/package/qt5/qt5speech/qt5speech.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SPEECH_VERSION = aa2376f9b1302222edcd16b4641bbd7004318c00
+QT5SPEECH_VERSION = a384f0d4fb8a2d0743d5dfdf12e40f6d76f8714c
 QT5SPEECH_SITE = $(QT5_SITE)/qtspeech/-/archive/$(QT5SPEECH_VERSION)
 QT5SPEECH_SOURCE = qtspeech-$(QT5SPEECH_VERSION).tar.bz2
 QT5SPEECH_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 01c8c828ca..8c23aea7d9 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3df1f47c5f9ac9af9cc505b8aca71b40cd142d7ce79bac3570f8456bf6ba3e38  qtsvg-b74f7291f343dcbcb487b020868f042d8fe83098.tar.bz2
+sha256  e42cda3109929ad1fb809d7114df040dc340de8c7ff6c535f781b86f52700e1b  qtsvg-d2abfb9cb1f036446e5913fadb0f065dab9f0159.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 34e74cb629..85f8b61202 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SVG_VERSION = b74f7291f343dcbcb487b020868f042d8fe83098
+QT5SVG_VERSION = d2abfb9cb1f036446e5913fadb0f065dab9f0159
 QT5SVG_SITE = $(QT5_SITE)/qtsvg/-/archive/$(QT5SVG_VERSION)
 QT5SVG_SOURCE = qtsvg-$(QT5SVG_VERSION).tar.bz2
 QT5SVG_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index d8e684b8d5..1d190ed547 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f53f515c1b00ded46ca7437bbdb0a0db4cab86d7ff5bc1dfa98b6d842a16845d  qttools-fa40a2d3373b89be0cd0a43fe0c1d047e3d34058.tar.bz2
+sha256  f32286a45861115c067125f15f28bcbdca8a8d6620c8a7b0dda8955b0f6d1203  qttools-3e3ab58b40734a1b9bbb7e72b2969d1f752351b1.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 26742d1566..64e38215d5 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5TOOLS_VERSION = fa40a2d3373b89be0cd0a43fe0c1d047e3d34058
+QT5TOOLS_VERSION = 3e3ab58b40734a1b9bbb7e72b2969d1f752351b1
 QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
 QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2
 
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index e748f328d6..2634351052 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,9 +1,9 @@
 # Locally calculated
-sha256  356f2edd84b626191b15e76d71a484ebe9daf64d8156554ecde09403971539d7  qtvirtualkeyboard-859d2a6ee329cc08414410b2ef8c0af77a6853d3.tar.bz2
+sha256  44edb033fa010c16c5ba8ce7fe160ee3a93117f99a12de014087b1f66856f29c  qtvirtualkeyboard-4fc9919ee3fad1d520d0921ba3069dca3c34ff78.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
 sha256  7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10  src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
 sha256  05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1  src/plugins/openwnn/3rdparty/openwnn/NOTICE
-sha256  b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986  src/plugins/pinyin/3rdparty/pinyin/NOTICE
+sha256  cfe4f79e6a8ba7c281f485a0cc100b2d0d4b4054f4594428a7a22a5a52cbabed  src/plugins/pinyin/3rdparty/pinyin/NOTICE
 sha256  9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6  src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index a2e86e6499..55de9a5a03 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5VIRTUALKEYBOARD_VERSION = 859d2a6ee329cc08414410b2ef8c0af77a6853d3
+QT5VIRTUALKEYBOARD_VERSION = 4fc9919ee3fad1d520d0921ba3069dca3c34ff78
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)/qtvirtualkeyboard/-/archive/$(QT5VIRTUALKEYBOARD_VERSION)
 QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5VIRTUALKEYBOARD_VERSION).tar.bz2
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index e1fb1b3b18..912c6cf33d 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  81a250da038d7270c06d66463c6dbab665e1eb7bad84b1f9796f5d23f39faf0b  qtwayland-df49b9f3badce793a0a9ea850cf1a02cc5bafef6.tar.bz2
+sha256  edf5772fd56b312ec3574377d04aa5ddf2f45cdd0dba5c8df04e35a2a232ea49  qtwayland-605b8bc942ab263b9d1892af33a81b408f522ccc.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 8e21ec6da3..bcd04d5fd7 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WAYLAND_VERSION = df49b9f3badce793a0a9ea850cf1a02cc5bafef6
+QT5WAYLAND_VERSION = 605b8bc942ab263b9d1892af33a81b408f522ccc
 QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
 QT5WAYLAND_DEPENDENCIES = wayland
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index f668b76cf8..26ecdf8bfd 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d5215daf4c023f1ae256230155e42e8b8806d0166d8c9609251de5e0a93911c9  qtwebchannel-2a157921861e651f43456cb7941b250c89feb736.tar.bz2
+sha256  53dff72f087b62ca380d5acb5cca1610036e72212fd52f40527d18c4e69719f6  qtwebchannel-6a20afaeba182ce6e3faee592e1e85a0d3ec0fc6.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index e72ff03944..62b0828ccd 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBCHANNEL_VERSION = 2a157921861e651f43456cb7941b250c89feb736
+QT5WEBCHANNEL_VERSION = 6a20afaeba182ce6e3faee592e1e85a0d3ec0fc6
 QT5WEBCHANNEL_SITE = $(QT5_SITE)/qtwebchannel/-/archive/$(QT5WEBCHANNEL_VERSION)
 QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5WEBCHANNEL_VERSION).tar.bz2
 QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 00df7e1ede..3390e4d86b 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBENGINE_VERSION = $(QT5_VERSION)
+QT5WEBENGINE_VERSION = 5.15.18
 QT5WEBENGINE_SITE = $(QT5_SITE)/qtwebengine/-/archive/v$(QT5WEBENGINE_VERSION)-lts
 QT5WEBENGINE_SOURCE = qtwebengine-v$(QT5WEBENGINE_VERSION)-lts.tar.bz2
 QT5WEBENGINE_DEPENDENCIES = qt5declarative qt5webchannel
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 212b6829b5..aa7146fbc8 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  565f37e5d4c497c0b60a3411afe64d11f254c7fbc1e558c39b77b41cabb39ebf  qtwebsockets-0f910acb737cefc889ce1088fc60d15bc18efe9c.tar.bz2
+sha256  1554c0bd5e24b533c2410a9394de991524953679a6dc15bb9065ce5f2bcbe00d  qtwebsockets-10eb706b24aa05f4ee69c2f2fec99b21994dfe2b.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index c3a97adbe0..5149b65b7a 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBSOCKETS_VERSION = 0f910acb737cefc889ce1088fc60d15bc18efe9c
+QT5WEBSOCKETS_VERSION = 10eb706b24aa05f4ee69c2f2fec99b21994dfe2b
 QT5WEBSOCKETS_SITE = $(QT5_SITE)/qtwebsockets/-/archive/$(QT5WEBSOCKETS_VERSION)
 QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5WEBSOCKETS_VERSION).tar.bz2
 QT5WEBSOCKETS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index dbaa068d20..604d926eb6 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  efcc711f71fdccd58ea3d43c5ca259a38b99222882459de545e81614963baaba  qtwebview-34342073a59f3a27ef3de02f6b21337c4f8db6cf.tar.bz2
+sha256  daeb5dd775d4d0ccca5e31d122025b88743a523249e4829999d48d7651d3879c  qtwebview-043cb7c0eaf8d1bcee56a62d6a102f727a22fcbc.tar.bz2
 
 # Hashes for license files:
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index 2b3e554ac3..a25534d694 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBVIEW_VERSION = 34342073a59f3a27ef3de02f6b21337c4f8db6cf
+QT5WEBVIEW_VERSION = 043cb7c0eaf8d1bcee56a62d6a102f727a22fcbc
 QT5WEBVIEW_SITE = $(QT5_SITE)/qtwebview/-/archive/$(QT5WEBVIEW_VERSION)
 QT5WEBVIEW_SOURCE = qtwebview-$(QT5WEBVIEW_VERSION).tar.bz2
 QT5WEBVIEW_DEPENDENCIES = qt5webengine
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 07cda343b6..66860c4109 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b10784b71e6ed9451d4b52c74e512f4bb61f1fed1a1da6c263210935bdbbbd3a  qtx11extras-c44c4fa86fa0794c25baef4ee1f6272aca8c511a.tar.bz2
+sha256  3aa91306f55545d53ad70c4798533623baa82c095797db0cf49b016875833638  qtx11extras-6695a3df4460577b3fcb5546b45a0c5cb3addac4.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 93e61677de..96796362f5 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5X11EXTRAS_VERSION = c44c4fa86fa0794c25baef4ee1f6272aca8c511a
+QT5X11EXTRAS_VERSION = 6695a3df4460577b3fcb5546b45a0c5cb3addac4
 QT5X11EXTRAS_SITE = $(QT5_SITE)/qtx11extras/-/archive/$(QT5X11EXTRAS_VERSION)
 QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5X11EXTRAS_VERSION).tar.bz2
 QT5X11EXTRAS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index e97ad378e7..3f4f745064 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ef029d2ce7ce5226d777640783b2d953bf57b23e9d3be3c08149b838e45d0a31  qtxmlpatterns-0b644263abca66503db1ce8a4e126cf358a34685.tar.bz2
+sha256  65074e1a4e8f6468e091710c703ee26c438bdcb8b6a26db63dd71dc674384b8d  qtxmlpatterns-ed3b333aa56ac193e969725e3c34be9070441271.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index b098cb8034..6e9cb89d64 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5XMLPATTERNS_VERSION = 0b644263abca66503db1ce8a4e126cf358a34685
+QT5XMLPATTERNS_VERSION = ed3b333aa56ac193e969725e3c34be9070441271
 QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
 QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
 QT5XMLPATTERNS_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
