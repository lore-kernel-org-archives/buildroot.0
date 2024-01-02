Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00DEC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F7DD4056B;
	Tue,  2 Jan 2024 21:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F7DD4056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rL37HhDU7tpb; Tue,  2 Jan 2024 21:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3168040A5D;
	Tue,  2 Jan 2024 21:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3168040A5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE84C1BF311
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B579E40A5D
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B579E40A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5mtrO1HHoVC for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:07:58 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D3D54056B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D3D54056B
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so28399005e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 13:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704229675; x=1704834475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nx+BKtkkWrVvTxDJWqXDjhJC1lW3BKqtOuB6R2DLZc0=;
 b=jJNP9NXuLhAZLouAF5YLmELqNG1DO/bgv2wbtp8iMUQusNWAAB/rZHt3v8coesApNb
 47SqRqt0ORqD8yMEttR/rQw3Ba2O3eUV7C6vffuTr2VZ+S2qYo9tcnN6y8vSBLdoGFNx
 dW+SBbFYhirAnaynXsyj5RuAB+q2VIR+EwD043BIb2/QhWO+7PkB6t0tF2OC74MmGm9P
 aO7KqDXbGVKtPnwLaxC5ghMCn2BmOuv75EJjGctWCub44ERwafffbXCar6HNRKtrS63k
 JYfBo9NBhD76EzSCptTwwlkDsAFF9+jAXzI97jZGYlsM7e1cGZIvDSP0oHcSMEfNa2wO
 OrRw==
X-Gm-Message-State: AOJu0Yy2Hm6CWk8Zu7y+YQzK/JV7qINGJ3ak9gaIIO2syuSbZPWCxE6+
 7KWq9qRmdqETYBwKWIa+la4OGlrlTDY=
X-Google-Smtp-Source: AGHT+IGBFUxbUhFuVJle5ZbLah8F3siBGeq7SZVeUSrq6X3f+WlCP4BYd2Lmfa64qOBqeG9Qx64oaA==
X-Received: by 2002:a05:600c:511c:b0:40d:4064:2b15 with SMTP id
 o28-20020a05600c511c00b0040d40642b15mr19324wms.72.1704229675559; 
 Tue, 02 Jan 2024 13:07:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l13-20020a7bc44d000000b0040d84bb7d6csm4436157wmi.0.2024.01.02.13.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 13:07:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 22:07:51 +0100
Message-ID: <20240102210751.1676704-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704229675; x=1704834475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nx+BKtkkWrVvTxDJWqXDjhJC1lW3BKqtOuB6R2DLZc0=;
 b=ir1O8dxXbUcnEJON2F9nYQ7XwwmeGEcvN6NyRAj3oRGlIRd7DqR2Cqtx6FjDGWq6RB
 yynVY9Or0183XBBic70gPnKj5wf8hqsItMMs7LZdfLGyibE18/jWULPWZ99gOVVeaerJ
 CqVq9eLaL9jfpMwjIvd1ZHtD3AELFhDyIxqfIOPsgOfm7VTnsOwk8HsoIPgnBhz1+qqt
 6ie0tSK3Vh89yvsUto0S2pyat+gJb0mMvyRJk+VyOUmEqEzg2QPqL+MaPGC52peLofeM
 KCHV8yinNMdgl03JQcQ0DbFYPsW4r7Gl/b78SbRnV2f/UCUGMVgVx6vOVwAAtyeE3YPT
 2SoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ir1O8dxX
Subject: [Buildroot] [PATCH 1/1] package/libcgroup: needs threads
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

threads are mandatory since the addition of the package in commit and
https://github.com/libcgroup/libcgroup/commit/99ccdf671e9df5b13f646e1487393d562aa7fa62
resulting in the following build failure since commit
9d58b525fcfd0d92fcdd3c66d7858213c4b139c6 which enables build on uclibc
and musl:

In file included from config.c:30:
./libcgroup-internal.h:29:10: fatal error: pthread.h: No such file or directory
   29 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/87c4454aee97b6955f461651c41c4186a8838c4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcgroup/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index b9333be2a2..4f9ec074b4 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBCGROUP
 	bool "libcgroup"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libcgroup is a library that abstracts the control
@@ -17,5 +18,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 
 endif
 
-comment "libcgroup needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libcgroup needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
