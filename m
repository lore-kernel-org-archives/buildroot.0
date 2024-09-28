Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191BECF649A
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 06:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC646060B;
	Sat, 28 Sep 2024 06:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzSGE8F8jNzC; Sat, 28 Sep 2024 06:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1F8D6061B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F8D6061B;
	Sat, 28 Sep 2024 06:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB73A1BF45A
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 06:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E76626061B
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 06:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YB8dttJyd0-s for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 06:28:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C87676060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87676060B
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C87676060B
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 06:28:42 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-536a2759f0eso4268771e87.3
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 23:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727504920; x=1728109720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Mv0yi60BX7F1Ah4ujDXO7uhTD5B/aD3kSoiYoOWXuY=;
 b=L+sXu2WNAozptHsb1O6FRVhOdAh5WAMf6eeBi/vNM/KCYk63V2oUCMlswHiHsZsvMM
 C56Gy/GmZN47kLMgmzL9KEZWZZ2CmAL22oh/eLJmY8owVfV+aAytFu1VqidE5i2htlyW
 /ZCGL59ofcfAWhoNawU14V97RCBD0xVQ7oi0LKzg6v/lGJsOpEPn7NBY1sALEwfZ69gZ
 D3/1hn+qHEZn8zg4i+cxnlyafJoCG/vjXBRXO30JxY1esPNEzURQMJpBlT3tuDShNAxy
 lL2rlMaa6oGKdie6xEu4Zg3elJP7TyWRFJUBa5wlS1Ifj/YkWeDyqhJlsZMBU542MwT8
 2LTw==
X-Gm-Message-State: AOJu0YzAUMUDd5J4X5roPDLYXj/FOEa7Wi5r/19inmd0A1awVJFcpKid
 k3rtApzPXoKHuisejsUOvkoQxcMXx6cXBvdFsxc4LLDIyiRBGneUN3fpdw==
X-Google-Smtp-Source: AGHT+IHdHTnF1o7i5Ls+Okor/9Cw69i5LydWWXru8PjT66YpekFWrjFlFONFHATv9xUv9NERGU1flg==
X-Received: by 2002:a05:6512:1155:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-5389fc33043mr3532032e87.3.1727504919944; 
 Fri, 27 Sep 2024 23:28:39 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a043b1basm537435e87.221.2024.09.27.23.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 23:28:38 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Sep 2024 08:28:29 +0200
Message-ID: <20240928062830.1037480-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727504920; x=1728109720; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Mv0yi60BX7F1Ah4ujDXO7uhTD5B/aD3kSoiYoOWXuY=;
 b=iHqVkt3nAGRLHS60lMJMOLgTbpJ56t3EyJrsWSPdoXpZ2LJa71idhzWKhcHDGu5TIi
 1nHmzVK8646uzd0tJkhdDne11O02P/dAL6I7/Ef71KS6Jm30Z3LSN1K1c7NbrL1XqfQI
 NKVnirEbL2zifFoUJ4AG7iBbTb+xnTkDfKCqMcxrxB3+eqyLGYQDwslDmqfTGwuOSmmD
 oVxnWZ//sPyqJnErIhzwHXi9cVGOjW3znbBPpeMrQxe/RbeOScp+ifQj08y/jBNAzEzP
 8mwKW0qZLBOzprBCiPPayo4zgbyi8m/eGFvD62Sd+vXJynQbYxRO4H8JvHezmFqoflaK
 yRvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iHqVkt3n
Subject: [Buildroot] [PATCH 1/1] package/dlib: add missing dependency on
 wchar
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
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://autobuild.buildroot.org/results/f5c543bcf57181373680d0c16a1814d21b000bcf/
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/dlib/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dlib/Config.in b/package/dlib/Config.in
index 2419af967b..7862f8d074 100644
--- a/package/dlib/Config.in
+++ b/package/dlib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DLIB
 	bool "dlib"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	help
 	  Dlib is a modern C++ toolkit containing machine learning
 	  algorithms and tools for creating complex software in C++ to
@@ -9,6 +10,7 @@ config BR2_PACKAGE_DLIB
 
 	  http://dlib.net
 
-comment "dlib needs a toolchain w/ C++, threads"
+comment "dlib needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
