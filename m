Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240FDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC3460B79;
	Fri, 13 May 2022 21:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiFhWGPxEy-3; Fri, 13 May 2022 21:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FA626059E;
	Fri, 13 May 2022 21:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8082A1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C6386059E
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nCJ9PLmNXSYY for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1359060590
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:39:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so5387113wms.5
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZUBjHGaBxxJ+tYr1yyoRfuXG23BS4WHOJRji4v37C0=;
 b=hRfIFUz7WQqVsBkd0ihzuPLi0iD/RDmSBMO1TyGcEphewNhCcAoux57l74NDAYf+K8
 SFr1b3N//nQKAHCzm+S7If0ocnE2RbhEMvwhbKJlSyLxPJOlgAvayIeNUM3/oixm5RX+
 2+GR8Z0g5RffqBRLkSocFsaW09dRKHHHjbW95Uk91o823d4sEGJmP17+YTroZkqzs36L
 ZIhaGshq88+lv1Nx2D2RoVssbwyZyGFJKyToTpsV/RJTWZFqtnZkN7PJmbab1mDeGUGR
 7b/IujPDRIIt7Hf9NkBWe/GroNdTLSrnjpIWQgNSyEFeF5TnDXTa06n2xjmlWshhl17h
 tdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZUBjHGaBxxJ+tYr1yyoRfuXG23BS4WHOJRji4v37C0=;
 b=Vt9AvuJy121/v98uO9l5/yb4dpQSCLGW84307T+/UwCwmXsbWo0F5YtuXXVowV/Mvi
 0xZm7Is+ezcgwWf2XQLgW5TMdXxwYFjA2V6n5iLcow3XQCmZZ0aJ6jOrlENmKkvsrrX3
 V9kbFlHvU8yDyn5D7THpV++NSDXh/uKGAu/wTAJGpijAzgAIvYZuFi+ATLZzEK4gE7pZ
 DxiAzWFtl5ofpobVmhK4T4bkZBwvZW8dw0wBJiXgjtjI16sAXBksu3WKvZLirGi+U8zU
 UOGjmwwGaBt0alcoujWjGIuDazJFd+u4x9J78oPjQW+g1lkySuOtW7OE7EBcZaHHh/iQ
 RVag==
X-Gm-Message-State: AOAM53311NeqFOLuiiYHyZ1/cz7Dz5IH/lfUVjos0ovvnorAIUWYi5Ps
 GLFl6Ndk6XhmTrzoHuyMlxdyD42LulY=
X-Google-Smtp-Source: ABdhPJz6VJt6rI6fVv1vx3yxzgRIINyi5om/43SOPy66IM2f1gBCxBLHQ1dn3uDXrPT3hz9tEHh0Gg==
X-Received: by 2002:a05:600c:2102:b0:394:2765:580c with SMTP id
 u2-20020a05600c210200b003942765580cmr6256040wml.150.1652477955933; 
 Fri, 13 May 2022 14:39:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adfa4c9000000b0020cd2e8d3b1sm3224646wrb.5.2022.05.13.14.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 14:39:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:37:00 +0200
Message-Id: <20220513213700.1177636-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libks: needs NPTL
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

libks needs NPTL since its addition in commit
5752d18bfcdb060c9d3b8c13330344cbdee74b75:

/nvmedata/autobuild/instance-17/output-1/build/libks-1.8.0/src/ks_thread.c: In function 'thread_launch':
/nvmedata/autobuild/instance-17/output-1/build/libks-1.8.0/src/ks_thread.c:237:21: error: 'pthread_setname_np' undeclared (first use in this function); did you mean 'pthread_setcanceltype'?
  237 |  if (thread->tag && pthread_setname_np)
      |                     ^~~~~~~~~~~~~~~~~~
      |                     pthread_setcanceltype

Fixes:
 - http://autobuild.buildroot.org/results/8a93b75ee51e005383eac17aa7577b43eda4cd92

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libks/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libks/Config.in b/package/libks/Config.in
index 366b5bda71..4781d188bf 100644
--- a/package/libks/Config.in
+++ b/package/libks/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBKS
 	bool "libks"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -11,6 +11,6 @@ config BR2_PACKAGE_LIBKS
 
 	  https://github.com/signalwire/libks
 
-comment "libks needs a toolchain w/ C++, threads, dynamic library"
+comment "libks needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
