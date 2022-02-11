Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A69C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 13:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32EF882470;
	Fri, 11 Feb 2022 13:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYlNSEijoZBH; Fri, 11 Feb 2022 13:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D35D817C3;
	Fri, 11 Feb 2022 13:49:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB74C1BF2CC
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A4EB408F9
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nj68kKR_TgV for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 13:49:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6678F408E9
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644587346;
 bh=7rXa0+Srzvco6qURHniO7FJSRgcHjAFvjCdNu1PjTyc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=RG0Yvem9StaTVd4rL9CfGo/Rffd9fgFDld2iTqkvo2HRSu0Aa3CHvXj9ELs2Ir0sj
 bR+hb8HkwtOD5JNGTvaJMiO971ICtHOnPMJQ84pfOqc8JvnpclyVD7XQwdQuAi9XwF
 cf6y2yHEGnVpXxFER90DS7aMwuB7x9xuOTAHiNNE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MJmKh-1ncVzP32UL-00K7IM; Fri, 11 Feb 2022 14:49:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 14:49:06 +0100
Message-Id: <20220211134906.18280-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:VNEP/HPqII1p8n/jHxYC4pz7qsjCmcCWlZBMKvbZwY59zPdzDNw
 S6xSnoqxE6NLDfxPRCGV2/5cLgWSbQ2ZXlxJiA9fsy5aCSHPmssCzRQZQzZTvtPM9yU3ZrT
 BcUDVCiFU390Hvs1JE6C7l8EOzwXHAX0cx1rAOlse1Loht6Ga4CbnVO5gedBe94NP/UqhJe
 g71Xndu6HPZXthLJ4snyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+n77A0STgMM=:VAdGFwYzrA/g4Topjok3Nh
 zmw6o+uvDbqQAj0xLlE/Ei001kbm1tsrt1QS0VuF+rv84Nd77ZKUzNV3sK2Pqrz+v1ettijrT
 RQqJf3c2GOIfbQzJUJpZsaHgc6kTW+7lM2u/UDLZX3PPr+ajkSElGnnBhh6SxVDc5uxah3iBO
 +Uth7B354kYvXiMXPXb5KB1MGCzYX4jLJQNV11D+/9Xh+PeXcA/ZqHy4wZbKo/njjEwwAaa9i
 boBQ3ZmX6etjyghyELFugW0kzxVE65iz/P72doq9bAeaNCQG9poypjLIPV4Ku/4jjmxCQXv1I
 iAozL1az8wUEDrGKEpJeNxbg94b21ka0JM1YlG+eyOitZhtlefvJMSBvdbI8LC9dCYzSqVFvF
 avO/WdaAFJic60hpuL2BaiurO63HtwKtnvV8e9rkxmW8jwX8hKmZIpLFrPF9HuiD1hsbTtUNr
 bRgMC2avyDuqolGEU8+d7rnEon/NYF66F3Bj/YILCUnBxg/ZyjuWsN+r4pQFqLrr3uyffU69m
 d0g13nDrg8ByPYPSAUzV+6eHb54/vjweqh3OHZPiOgli3aoX+FrN14O80NUHKcH3cFwyFjGqK
 rkRX5dTIJAsRV3YZKHLFrFBni+p+mt1w9/9WOC46yJ0n3YosidfUFj0V9wG5Tt07zkzZTjcrv
 7BqFWHqhZxPxvpt1f+P1TLvnIZu4bxbyraAMFrd68EtTvQ8wL42B6NW3DyGd3zd94jyy84gk+
 EZvrG+LQdvLU/gAhQZFHwfBYacbdCRLdcbSWpnrBV8ntMhK/laUINAFbEgeYElZYiv9bNEoZJ
 PWb9Q69v+9bGPasnZ4LdSt27WPbzQGgYCHb0FhigrQ7C4ka7C6IEfyqX1LXC9X8qIyiWBJx4Y
 xEmD3FHB/U5wldfo8vp73VC+8xthnuDg7RB6DljSHWgmxJtJnIPUWFwUlMzRYtAyO4j6CbEK0
 PwKTN4z++mBl8MoLpgnDQsH9+0ZUZROx5Wtrp/+X/f1sDsKCOUFJmPmfcxOaXA5Ciy7ULwxIZ
 VVkBPV3p2EFmegTFga5aufIboYWRN+jGDq/O2sshYX/WzQUqxhzUM5Osw7JMT6pSi3AnzeaxI
 jGZlh01nOd0yaY=
Subject: [Buildroot] [PATCH v1] package/libv4l: v4l-utils needs C++11 support
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

Fixes:

  - http://autobuild.buildroot.net/results/cacd73e08cfb359d608bca807189b7bd3c5c79bd

  v4l2-ctl.cpp:53:2: warning: identifier 'nullptr' is a keyword in C++11 [-Wc++0x-compat]
  v4l2-ctl.cpp:53:37: error: 'nullptr' was not declared in this scope
  [...]
  v4l2-ctl-tuner.cpp: In function 'void parse_freq_seek(char*, v4l2_hw_freq_seek&)':
  v4l2-ctl-tuner.cpp:160:10: error: 'constexpr' does not name a type
     static constexpr const char *subopts[] = {
            ^
  v4l2-ctl-tuner.cpp:160:10: note: C++11 'constexpr' only available with -std=c++11 or -std=gnu++11

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libv4l/Config.in | 4 ++++
 package/libv4l/libv4l.mk | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 57ddde1dfb..c88f280c3b 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -20,6 +20,7 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  v4l-utils is a collection of various video4linux and DVB
 	  utilities.
@@ -35,6 +36,9 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
+comment "v4l-utils tools needs a toolchain w/ C++11"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endif
 
 comment "libv4l needs a toolchain w/ threads, C++ and headers >= 3.0"
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4dc0f15f94..ee5a1f2241 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -59,6 +59,10 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
+# v4l2-ctl needs c++11, qt5 needs c++11 (since qt-5.7)/use gnu++11 for
+# typeof support
+LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
+
 # IR BPF decoder support needs toolchain with linux-headers >= 3.18
 # libelf and clang support
 LIBV4L_CONF_OPTS += --disable-bpf
@@ -71,8 +75,6 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
 	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
-# qt5 needs c++11 (since qt-5.7)/use gnu++11 for typeof support
-LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
 else
 LIBV4L_CONF_OPTS += --disable-qv4l2
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
