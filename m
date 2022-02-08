Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A68DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 22:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF64981275;
	Tue,  8 Feb 2022 22:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7lgWCYl8n8yh; Tue,  8 Feb 2022 22:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F104180C34;
	Tue,  8 Feb 2022 22:23:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00AE01BF3D5
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3D4E80C26
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQtBeFRfqXCV for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 22:23:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6CF380BE0
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 22:23:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k18so786529wrg.11
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 14:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeEyB+oQdPuN5THHBfCPAzD3wsJri/0Ervp3kB/xdZ4=;
 b=lTOhjJXE0MBtm8zOgd/2+C2ImZ/YbP00hw+7n1xh/XOGdP+ewNgiEjW0EUBetlYeI6
 DBQA+21T7G53171fRYsIPcuTMJOx28W5bw4xO0uoVh2ymy+82XZ+4tA+jzEDiudIQ6a9
 CY7XBA5B5pYuovJhsNYvwlU3fo8ewpbNK6I5kCnhpEs9JICm9PT2RNnU1k/F2/2xiR4w
 S2f0rnbBwYP+Mb4duzYha5+xqGNHObpsAF4C7i0lcSipMQzZVIlWcfietElTkwwA0Qfd
 ilPl+OtGcI+Unkh/N70M5f9BmF7U2YC5zlFr183eva/O4hFRvfWNirv9OSM8S2cjqzK5
 9UjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeEyB+oQdPuN5THHBfCPAzD3wsJri/0Ervp3kB/xdZ4=;
 b=i6bJpChCuGvgiqVrRkgpyo/vOf747jsSBw7hXL5rGonEjvZ7xK39LQ0fofLe6XcC5y
 Is+cyseWOrHXRYi49m8Tftp3bOfM5x96wZM77oJLKb/hdOrNhZGQxbSDzIPhLJ67ywS9
 n4aX0Laty9SKMmRL2VABHwkoF9NvjdzNYvt/lJKFf9EaSSontQqAjAHmeTVLCZEaiDn8
 jaa5Jz9MOsaB6tWImPJ4TNDNhFfN/natnQd3+XwjEYFDuNhBsG7OFE9CAmica/QVfdnl
 ObD60yAKtXliKbT3H1OyxyKCfxkRS4xGGtelOz7u5dL7XF2wPh73nYo2q8UtiPQQDhg9
 TnTA==
X-Gm-Message-State: AOAM532XVU8q751JP7ynrKrCXbsy22yBx/YYEmVLViHANNs4gwqeKiY5
 FPJDors9GKAh+OtrkfHeRebaa1gfMck=
X-Google-Smtp-Source: ABdhPJzeEaddto3ii6ln9PCtgUTmXSdENoBdw3LOiy9hRV+sW2mLu3Cvp0mAZjvGJ9BM4+0dSxQJcA==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr4982447wri.705.1644359010896; 
 Tue, 08 Feb 2022 14:23:30 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id x17sm5049129wrv.107.2022.02.08.14.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 14:23:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 23:23:56 +0100
Message-Id: <20220208222356.24675-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/grpc: fix fourth patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of fourth
patch in commit 8251d8c2559b25f11684776fc343059cf100657d:

1 out of 22 hunks FAILED -- saving rejects to file CMakeLists.txt.rej

Fixes:
 - http://autobuild.buildroot.org/results/44f6d7c61316e90d22e75cb1fb77c3bc5b31ad66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/grpc/0004-host-grpc-only-cpp-plugin.patch | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/grpc/0004-host-grpc-only-cpp-plugin.patch b/package/grpc/0004-host-grpc-only-cpp-plugin.patch
index 43fad7e3d6..c97d9a9385 100644
--- a/package/grpc/0004-host-grpc-only-cpp-plugin.patch
+++ b/package/grpc/0004-host-grpc-only-cpp-plugin.patch
@@ -10,6 +10,7 @@ others.
 Upstream-status: not accepted (see https://github.com/grpc/grpc/issues/25322)
 
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt | 43 +++++++++++++++++++++++++++++++++++--------
  1 file changed, 35 insertions(+), 8 deletions(-)
@@ -167,15 +168,6 @@ index e8934a3e03..c2df332cc6 100644
  add_executable(check_epollexclusive
    test/build/check_epollexclusive.c
  )
-@@ -3906,8 +3931,6 @@ target_link_libraries(gen_hpack_tables
-   gpr
- )
- 
--
--
- add_executable(gen_legal_metadata_characters
-   tools/codegen/core/gen_legal_metadata_characters.cc
- )
 @@ -3958,6 +3981,8 @@ target_link_libraries(gen_percent_encoding_tables
    ${_gRPC_ALLTARGETS_LIBRARIES}
  )
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
