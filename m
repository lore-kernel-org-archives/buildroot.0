Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF22C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 14:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E3514016D;
	Wed,  6 Mar 2024 14:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yt1SH6vSO9cA; Wed,  6 Mar 2024 14:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 879D941850
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 879D941850;
	Wed,  6 Mar 2024 14:55:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B81371BF3DA
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2C4041850
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8snjJzGgScX for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 14:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC8214016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC8214016D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC8214016D
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 14:55:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33e5978fc1bso354437f8f.3
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 06:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709736939; x=1710341739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mgUbxn+jA4MRq9ktg8BCC4KUoRp4F2vBiWXFIbwku9Q=;
 b=BJ+gdCfMunkwalib4N/FCmTzj2ag9J+Fy7Vh6jbsp5ss8MwpyyVRPL7f3RNsz/DY3H
 WvNleWFwbN7qGO4v08YVcN4zI6m25bTCURzpsaKaeApsqyDa6Tb86OkmYo5XC9x8gO8Z
 jOPgr2GthePxKgncd6IJL/wQhZKSGH2D6AtOdZgGlYN5fsNoBNAomXm39KR+2TFu6dXf
 GAqwlvzFmioVfzpT/KxKJ1Ha93F8USig5m5V2pkKSWONa/Mgm6ahIp9nkc66INTp/5MI
 rXuJiJ6P0WK6DiVzngjLkFWYKfqsyKjwQEKsxWA/nuvflXZN5oR4YH/TalDjlaBJDHoI
 KXqA==
X-Gm-Message-State: AOJu0YyKLXA5GNNcc6KXi63pztVl58DwrNy4chYemoo7KCilFzhV5t9g
 LdE50zrQ1Cf1PQj4HU0ewrD7oIWd6+Z2SgLX6TDfNpKtk8ZhdXC+Vac9e6nI
X-Google-Smtp-Source: AGHT+IHsPm4qM3u0cwSW/Kvr9qhqQpwcwv4du1n01Sm431T3lnKWLWRNHQrIxpYSJ5pNnbyWBE6Snw==
X-Received: by 2002:adf:ec52:0:b0:33d:108e:bcc3 with SMTP id
 w18-20020adfec52000000b0033d108ebcc3mr11609946wrn.35.1709736939243; 
 Wed, 06 Mar 2024 06:55:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p18-20020adf9d92000000b0033e18f5714esm15681367wre.59.2024.03.06.06.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 06:55:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 15:55:31 +0100
Message-ID: <20240306145531.1413586-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709736939; x=1710341739; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mgUbxn+jA4MRq9ktg8BCC4KUoRp4F2vBiWXFIbwku9Q=;
 b=fVAWVslD31DmdwJj9HZ/xH5pKV8w7f+jmvM2zttv6KJKh5VAVG2CPobAMQUQiS7e50
 kzKSD1xHOnp+GDXS/tT1d6Ls5VYZcwxIvaIv22Pk252P8RUU11yhJEluEFJXsbPmFNYl
 6HdAj7fdfFlwue0x+hqjTECiVQK1vB5/fnLUr/VTSLjVaMCc9TRWTY29w2sv+D9RHiOq
 DPEUH70B2TuaiBXjCnboiC4DSFi5LYRbxXF2GXxRdMeSKxZdxLMhQXXGofqKEqp8EMRH
 3w1DLBPcvgD91WFoe2vyh9MEGNvWUd6EOuwZajcgCwd5cBUkS/qb5NTObIYBnKXk+9u8
 j7+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fVAWVslD
Subject: [Buildroot] [PATCH 1/1] package/capnproto: update ucontext handling
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

musl workaround for getcontext/setcontext is not needed since commit
eaeba56aa2d21f1d264c7e361731808e3f072d9d

Moreover, select libucontext if possible to get full ucontext support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-capnproto/Config.in  | 6 ++++--
 package/capnproto/Config.in    | 8 ++++++--
 package/capnproto/capnproto.mk | 5 ++---
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
index c472128c3f..abe2a602ba 100644
--- a/package/c-capnproto/Config.in
+++ b/package/c-capnproto/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_C_CAPNPROTO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # capnproto
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # capnproto
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # capnproto
-	depends on BR2_TOOLCHAIN_HAS_UCONTEXT # capnproto
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS # capnproto
 	select BR2_PACKAGE_CAPNPROTO
 	help
 	  A C plugin for Cap'n Proto. Generates the code generator
@@ -24,4 +25,5 @@ comment "c-capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, u
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_ATOMIC || \
 		BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_TOOLCHAIN_HAS_UCONTEXT
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
index 943ba9de29..93e3a64fb8 100644
--- a/package/capnproto/Config.in
+++ b/package/capnproto/Config.in
@@ -7,7 +7,10 @@ config BR2_PACKAGE_CAPNPROTO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBUCONTEXT if \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	help
 	  Cap'n Proto is an insanely fast data interchange format
 	  and capability-based RPC system. Think JSON, except
@@ -25,4 +28,5 @@ comment "capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, uco
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_ATOMIC || \
 		BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_TOOLCHAIN_HAS_UCONTEXT
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 7424a1420f..d322c27a54 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -29,9 +29,8 @@ else
 CAPNPROTO_CONF_OPTS += --without-openssl
 endif
 
-# musl doesn't support getcontext/setcontext
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-CAPNPROTO_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DKJ_USE_FIBERS=0"
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+CAPNPROTO_DEPENDENCIES += libucontext
 endif
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
