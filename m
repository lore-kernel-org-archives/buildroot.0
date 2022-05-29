Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34373C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C8084741;
	Sun, 29 May 2022 13:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WT6xoifIHokB; Sun, 29 May 2022 13:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF7084707;
	Sun, 29 May 2022 13:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09E121BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC25B6108E
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WM1QY4dyRU51 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E74B460F08
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q7so510546wrg.5
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGYTrVEAdWATpA7NUw3r8bBSLnmNG7QlJXve/VtOUgY=;
 b=GvwCWksPvGEBI4/DmawFaH+LSAj4Js9zqNfUJfbVc3C9iP59/Q9Br1HzMLqls30KUy
 FRtG8d4jll9W1nD/D2tVSBUE0luFGMkfJxGQIpGwG3gbh8gc73CPRf4jiQpUY/WR0Ecw
 wcAnR3/H5vXaDhetmN6ji6yu4CSaacICpwkzKNyp5toYvLDoQpl2hPu8gK11oK72b4p2
 4nY3hGR84NB3xb4vnNuMciEBddk99NVZM/NZQhAyDrGhXaGI7V92hS4yF+Wbx2JLBAI1
 ZUXqXrwfzbI6cJ71G1jURYW1VdGgYxisulE6rZsKoX6Lipxg/7EtR06JOalTnTlGnofj
 wHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGYTrVEAdWATpA7NUw3r8bBSLnmNG7QlJXve/VtOUgY=;
 b=OzQAwpl46ttHtU385RZq6gPusV3+vAYnMPUITUKgEGqI4Ia2eB9GkkUNJIXN00s2Kn
 sKOCYHds+2A++mq6OhPOV4q6AHLY2QqbNcgdCVu1H8pFDkL1SAG+q8oPXE5HLwFnC+my
 Rm5V8+bMPdrrqVMEdQc0whtV656q3xC3DNWBxpdGJvo55c0kZV4YSyykJyVvIuQx2EmZ
 f/QS4RTb92A1M6b5OP9p3ibCMDMG7TRIVdFAP3QCMQS2RxisM1JVR6iEPxri563QRgQS
 MwmheYHtYthRazUgEQtainT+PjueD30ZZGGhV00d1ZPTH0rLrtPX4HoFt43fMyd0RfkH
 3iZA==
X-Gm-Message-State: AOAM533zM4MHxreEWlXNiv96nMeB7t3Bil3tjA+9g5y2JpRtJ8kLdU5Y
 Xpg7WNKL1wgeqx7ZKrhqnbp8eAkbsqc=
X-Google-Smtp-Source: ABdhPJyZOJsVXNUcaNd3yhjvCje+279fjLgZYB2J5wnk+/3w4SYFSN8VebPepdLAbRT229vaIWKZ0w==
X-Received: by 2002:adf:d1ec:0:b0:210:2c68:a06d with SMTP id
 g12-20020adfd1ec000000b002102c68a06dmr3774205wrd.37.1653830308577; 
 Sun, 29 May 2022 06:18:28 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:27 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:07 +0200
Message-Id: <20220529131811.481017-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 07/11] package/gcc: switch to https
 urls for archives hashes
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FTP urls doesn't work anymore with Firefox [1] and Google Chrome [2],
switch to https urls.

[1] https://blog.mozilla.org/addons/2020/04/13/what-to-expect-for-the-upcoming-deprecation-of-ftp-in-firefox/
[2] https://chromestatus.com/feature/6246151319715840

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/gcc.hash | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index ad8bae4a99..e364be0a06 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,10 +1,10 @@
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.4.0/sha512.sum
+#  From https://gcc.gnu.org/pub/gcc/releases/gcc-9.4.0/sha512.sum
 sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624  gcc-9.4.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
