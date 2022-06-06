Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D24CCA483
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D057541740;
	Mon,  6 Jun 2022 10:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RK3ILC2WAi-w; Mon,  6 Jun 2022 10:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F0B41604;
	Mon,  6 Jun 2022 10:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1481BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8862C41604
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaxObEvDjTQs for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:15:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F76D415D3
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:15:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p10so19180729wrg.12
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nUrY5zmokXLGTEsCO0FQMH3yvi16ao80sDqedtODyrg=;
 b=gJqkP4GWM+Fi4fwTopVDoLN6C/vNrqh3KZWURBbD9Eg8Bvd/mRWyWtvqC2S/SM0Mpy
 oWi9R9sK1w0gRFqOnYsRckPmbNUHYwzBdarJEAUYzkhVCc5hdsw7sj1bpXnBOQ+2UeMf
 lfZmxU334wE/iVfWmXieVTq9yZs4vFh+D7XMBv+nZ0gbknSDwvQ2FUqbdqPjK5Q2a0mq
 Mykt3MS4plftQtrjtz4Jv7+Z3BaR8rUstlMTh/dHeN0GGX5CwjiblamluR4CSRZv1q4u
 s+KOlj05hLWYND9RsRiQvbD87vVtVDawk5b47SVJR3WwgwP3xCPsTNDYZ3GZ/Ic71k5r
 +7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nUrY5zmokXLGTEsCO0FQMH3yvi16ao80sDqedtODyrg=;
 b=w2WoGXDvV7lXBJF+J5mYyAaq7pHQSqpNT33Znv7CDjA7RZuW89GuKwI+oDi9KBsihD
 +7gDciWkImYUYv89wU7ycaGvgxs65KOWAenOz1BprS1rjqubXrV+/X+siQW61N0MvM6r
 kYHR9/Ba/ke8QljxSU2//jbE4ziFdvo7J0dtLJPP7KGxdnIUIyL7DYGjw+Cha9lYajF1
 DtSZ5fNIP90b3MC0rZVyWzrzDBeIGSpXR3zVDJb5tthCOJW7J9uBBBctOk3P+iHAaEN9
 +2szVv4aBtDbZiHJpFi3/sD63EeVPYuA4wBOIS6zz8HR0mmgP87SxNgE9b2hfT2fRVDl
 Q9Hg==
X-Gm-Message-State: AOAM533IkEMEX20EeASp97n8O5m4g1R1PutOT2kmYARR9yzWqcaL7S5q
 X40A4YlpPt1VDK5KxdoQ5P5Y/YH5S2I=
X-Google-Smtp-Source: ABdhPJzMXr/eaDW7WIfnpr9QTL/xOoJ31M6ADU1Q7J4I4oxC52a8KuegEgTXHAcllpw8IK8/c1a2mQ==
X-Received: by 2002:adf:e708:0:b0:213:b943:572a with SMTP id
 c8-20020adfe708000000b00213b943572amr16344229wrm.560.1654510550174; 
 Mon, 06 Jun 2022 03:15:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056000184a00b0021033caa332sm16825024wri.42.2022.06.06.03.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 03:15:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 12:13:16 +0200
Message-Id: <20220606101316.366344-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mono: needs NPTL
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mono unconditionally uses pthread_attr_get_np and so needs NTPL since
version 4.0.1.43 and
https://github.com/mono/mono/commit/748fefa1d7199f008c6e56499ba482fb17fe1583:

mono-threads-linux.c: In function 'mono_threads_platform_get_stack_bounds':
mono-threads-linux.c:26:15: error: implicit declaration of function 'pthread_getattr_np'; did you mean 'pthread_attr_init'? [-Werror=implicit-function-declaration]
   26 |         res = pthread_getattr_np (pthread_self (), &attr);
      |               ^~~~~~~~~~~~~~~~~~
      |               pthread_attr_init

Fixes:
 - http://autobuild.buildroot.org/results/6534ee4ae699c17ee98f6f89a8a1212936e04481

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mono/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 44b8cf8581..76178bcf9b 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
@@ -23,7 +23,7 @@ config BR2_PACKAGE_MONO
 
 	  http://download.mono-project.com/sources/mono/
 
-comment "mono needs a toolchain w/ C++, threads, dynamic library"
+comment "mono needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
