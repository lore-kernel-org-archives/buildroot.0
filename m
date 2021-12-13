Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D18C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 22:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CF6860B52;
	Mon, 13 Dec 2021 22:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlugMp8TX7Yk; Mon, 13 Dec 2021 22:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A7B60B4E;
	Mon, 13 Dec 2021 22:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19F3F1BF297
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 22:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08068404A8
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 22:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlStMho2sUt8 for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 22:11:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 168AE4047C
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 22:11:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso12537150wmr.5
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 14:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/y2sFJ8F+G6wX5wkiND6x9vjspnemplLloXC1VBInkE=;
 b=SgQMM1hq7kOoCq6aoFU8VgXQwaWshZ4C/hIUeE4T6vqN5MPB4PwA4r5o+geNQDv6RH
 cPberDhdYy7MiWkiZ/Jcm8jBrNHSsG49/HfHKd0g7gPeoX8Lv18KvJYnELtEl2+z0o92
 hfeuG/magvBwuOYmGP9mR0r5U4gNOrbonYx235ekvuWLym4CG5OGnD9J4qVf8Gm2kZ8m
 QCeFrHJ6tWMwphB4iGWr578xz6o8XSExSyv89GWCw9b9ryrzBOCQv4TYvYFY9HypuNcR
 yeUrm1G4w6OwktTZh0YmLsJ6FXmr3oRCotgNiIhIRjwRhAFM5xfmufraVBUD6n22a9pt
 dTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/y2sFJ8F+G6wX5wkiND6x9vjspnemplLloXC1VBInkE=;
 b=o1PTwZSHwDqjBm2CToF82cd7w7hMseUzyv1Xb7fwbXBSrbLB5qrlnanNo9kLnxezAZ
 ZzxieoamTVeVWmAmG9gozxsyfN/9Pcw/Xfp4sT6UK9Z3XWkjnRr46cRcVGVIcjqsUmhY
 mf63a00CF8AQC8AqN+jU8Ds2MTShX6PySMITf8A0xIyXzoYuvT3KEYPRsxrfnIw78P0d
 6HZlNAg1kJUst+DXDlxu7x13vGz6VVxwC6MeegH1F/rBgiuNzHjGq6xISRoY54BbtB60
 nT/BhiaOAMXrNKddPs0c46NF7GB1igVhIdi/1gXE+VtVWzkHfPA6EORdMlnGMeB4U9VU
 GNKQ==
X-Gm-Message-State: AOAM530boL4o0PcUHrOKIT+hk4j7V8PdOtvYLgU8Mky5RQItD5u3OHwo
 a18hoAbhu84F+K6V/ntFLQGBYkLYAjNNMw==
X-Google-Smtp-Source: ABdhPJyuSFtHQJCgDD9R+ChfY9SYZA4AYxviZLosfJ1BcPMq206lgkigpja06ulwNzONesI9MqrK5A==
X-Received: by 2002:a05:600c:1e87:: with SMTP id
 be7mr1756025wmb.182.1639433460981; 
 Mon, 13 Dec 2021 14:11:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a1sm9160935wru.113.2021.12.13.14.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 14:11:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 23:10:35 +0100
Message-Id: <20211213221035.1779283-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213221035.1779283-1-fontaine.fabrice@gmail.com>
References: <20211213221035.1779283-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libvirt: fix dependencies in
 Config.in
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
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious "depends on WCHAR" added with commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 and adds missing wchar comment

While at it, drop BR2_USE_MMU from comment as it is already added by
BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS and fix indentation before
(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 5693ecb4cc..e75f1cf15f 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -5,12 +5,12 @@ config BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 
-comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic library, kernel headers >= 3.12 (4.11 for AArch64)"
+comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic library, wchar, kernel headers >= 3.12 (4.11 for AArch64)"
 	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || !BR2_USE_MMU || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 && \
-		  (BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
+			(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
 
 config BR2_PACKAGE_LIBVIRT
 	bool "libvirt"
@@ -19,7 +19,6 @@ config BR2_PACKAGE_LIBVIRT
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
