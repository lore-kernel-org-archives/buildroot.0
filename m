Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE167C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 16:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 519D640567;
	Mon,  4 Apr 2022 16:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuiAnfYaxH0P; Mon,  4 Apr 2022 16:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6161440182;
	Mon,  4 Apr 2022 16:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99F801BF983
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8158140182
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDUz1BRnBdcf for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 16:54:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FFFA4011C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 16:54:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5979961wml.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 09:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GICSzzypEL2L6DlOKych32h5T+ZWc0yeAjd+NRNl5uw=;
 b=D6FEC3RC+T7VEViI5pRS5Sjgy7j3LczwTpH+0QqEHsH7H7K+xa9nG8GMNY0AO3T0v1
 EFbIGIRgOlx8pGtIYgExA2eYYJohiyXbtNFwqB2inbsW+izJn2ybo68qd/aIaimDVB75
 dOyBArVDG9tvpXDLxFVZFgPq9m/yWvnBtxdz74H2Znnj/7wG5qGqvtjttPBLsTmnzHNi
 G2yBbeVRiGKplH+hFLOww8cuWx/XvV/BFCdrDRP8LvrusOmQFNwJi4KXM9X3+EPirB/j
 BNvKVnatrW4gV9pXEkBaYcTKrp0LF4nQBzKqPiDABVZ0xrf5Z3QNgfy7fEZRRO26fihV
 Bdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GICSzzypEL2L6DlOKych32h5T+ZWc0yeAjd+NRNl5uw=;
 b=XBPP/F2jQU5YMwRfnAJ2FaO/PAEK0i7S53pZ9ccErpZ5NOKJw264UxohWZ8WuMF5dn
 R8TdgBbq2s945rFv3Cz3oZM7L26F7tsD+mKbCQc7a9kYBtbx3Yu6mtl5PSP1iAFY/n0H
 S1Npy6JE64YxKbmbipz6sFjax/uep5xXdbrIcy9jgkdc6VwEnNrIjgG8WyvOjy6p1o2V
 FcWv++x4DkO+nUHUv1wrAL7g+ZjdEQ13m0m5ZfNXkWIdOiC2JdgeYsQ10owwTgaCmNEI
 q+WCt3Gtk5DI6ggtpEQXaVrmA3J6hfFhwZq4eXzQ0e02bzloT6K8q5lpS1lojcX/91BH
 mE+w==
X-Gm-Message-State: AOAM530L/r/NMk9i21GbcaBFzCcXce3w0qv7Oe98FSlSGwhpQbGosNQ2
 MFJ1xL9tuzSWPzYfC2yVjPNWyLog32I=
X-Google-Smtp-Source: ABdhPJyuxbx9MnVSYfj1bYYEgkaDDcFPdik8QCL0EW0QN5L/B67TPJfNf6Z83wki9sagT+9p9u9izg==
X-Received: by 2002:a1c:cc11:0:b0:389:e8aa:ad4b with SMTP id
 h17-20020a1ccc11000000b00389e8aaad4bmr47171wmb.79.1649091244510; 
 Mon, 04 Apr 2022 09:54:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b0038c8fdc93d6sm39129wmc.28.2022.04.04.09.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:54:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 18:52:20 +0200
Message-Id: <20220404165220.338388-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: needs NPTL
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.3.26 in
commit a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/b029000610d122ac12939d02ade2264605ff43de

thread-loop.c:(.text+0x81c): undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/6019f4e9676743685e8af81d60ef198c1eba1fde

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index dd13f31a73..3bfcf42a81 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
@@ -46,7 +46,8 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ dynamic library, threads, gcc >= 5"
+comment "pipewire needs a toolchain w/ dynamic library, NTPL, gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
