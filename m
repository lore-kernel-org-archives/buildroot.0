Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F611C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 19:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B4B84041;
	Tue, 31 May 2022 19:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPDwrh2gQr_5; Tue, 31 May 2022 19:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 549FD84038;
	Tue, 31 May 2022 19:29:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B011C1BF85D
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E9F841836
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvCPhc32isUE for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 19:29:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 843B241834
 for <buildroot@buildroot.org>; Tue, 31 May 2022 19:29:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so1805099wmh.1
 for <buildroot@buildroot.org>; Tue, 31 May 2022 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0RqXkP4Vjo419NYrdUUXAoYjLU5hEp07Xy1w8m5fgd0=;
 b=qqDA05IB92bx6a0+iNRHxHDgKaeCLFAvyuXqnPQMQiBuCK10wgJ3jmjUKa053LdcrE
 gNRaPOCALhQwjmw817UqxrQQnvhCjralXa33o0QDq0gVyQ2Ipc76eI4zniUzaUBjQMMT
 QYkOWC+0RfIgPjlt20fejl9Txcb/eJN4H2LMn3bIkeNo3PM79SSQWxZoR9FLG6O/nXZG
 0O96qg/2sug7k5LcrAXn0VBQamqv2laAfjqHoFpMB3wR+vDM4RLM8A5qZsLivEhTs15r
 D0JhbpLyUCbIUDsvIbMRC2sHv4kjeXLhZ1kiIj3T8cbCKSouO/1qfDIJqI5Z5Y/DNRt2
 aiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0RqXkP4Vjo419NYrdUUXAoYjLU5hEp07Xy1w8m5fgd0=;
 b=xmvognH2ZFJeu9ZOjk4D80BWlqBMepCO32jM53xULWhrcL8NXh0kRzzX6zdq2pqrad
 CBJBcHHy2sQlMahcFDD5TRf/HsnLKhkFIO6XhxIFOIOmIeKAe4FpIzeIy7qcjLKkwz1/
 e6BepO7BFah8FDdYBnFP+QLW5SqsUB1nHfDQBVH2btjbYt2gLX75F7h3y8saod38mw8B
 ZQL5qKRHTAFuVSI3VWGYxtLrTw4obfjqg/ZKmPgsGikAsEid6ab+oUDWbr2RaZG41fDq
 RyNONfr7DygFKT/sWUsB6euebPYStXiZq4O96agBJdmnaq54LvqNuRiHLq8NxT3r2cBk
 MRHA==
X-Gm-Message-State: AOAM532UNwxLU2rvdynXnArgagaM47BTOxMWV2xJznHkgy5f5Qo8MVjv
 suMYx4TXT5tp6B57EDt83V7s2W6h210=
X-Google-Smtp-Source: ABdhPJzDZZlYa/k1iqFtKnZbN2h8X1ag9UKxOsavFoRhZux9Na8/cK4nBdte+j7ED/Z/rmfgh/2rYg==
X-Received: by 2002:a05:600c:3496:b0:39c:1c19:987d with SMTP id
 a22-20020a05600c349600b0039c1c19987dmr3656174wmq.135.1654025367425; 
 Tue, 31 May 2022 12:29:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b0039747cf8354sm2905087wmq.39.2022.05.31.12.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 12:29:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 21:26:57 +0200
Message-Id: <20220531192657.340827-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libks: disable tests
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

Disables tests to avoid the following build failure with
BR2_SHARED_STATIC_LIBS:

[ 42%] Linking C executable teststring
../libks.so.1: undefined reference to `dlsym'

Fixes:
 - http://autobuild.buildroot.org/results/e61a683928795402375165adf686687f3305e0c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-CMakeLists.txt-honour-BUILD_TESTING.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch

diff --git a/package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
new file mode 100644
index 0000000000..fbe6cabd86
--- /dev/null
+++ b/package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
@@ -0,0 +1,41 @@
+From c850e04898a9498d447b43bf346365646ff1b19c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 13 May 2022 23:12:31 +0200
+Subject: [PATCH] CMakeLists.txt:  honour BUILD_TESTING
+
+Allow the user to disable tests through the standard BUILD_TESTING
+option: https://cmake.org/cmake/help/latest/module/CTest.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/signalwire/libks/pull/125]
+---
+ CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5bbac31..37e6bcd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,6 @@
+ cmake_minimum_required(VERSION 3.7.2)
+ 
++option(BUILD_TESTING "Build tests" ON)
+ option(KS_DEBUG_MUTEX "Debug mutexes, only works on linux for now" OFF)
+ option(KS_DEBUG_SPINLOCK "Debug spinlocks" OFF)
+ option(KS_DEBUG_POOL "Track pool allocations and provide hooks for rendering them" OFF)
+@@ -609,8 +610,10 @@ endif()
+ #cotire(ks)
+ 
+ # Add tests
+-enable_testing()
+-add_subdirectory(tests)
++if (BUILD_TESTING)
++	enable_testing()
++	add_subdirectory(tests)
++endif()
+ 
+ if (WITH_KS_TEST)
+ 	enable_testing()
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
