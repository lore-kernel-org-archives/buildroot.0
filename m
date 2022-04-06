Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A2CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 19:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F0761136;
	Wed,  6 Apr 2022 19:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Op3GtsOo567a; Wed,  6 Apr 2022 19:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9562361131;
	Wed,  6 Apr 2022 19:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 300E31BF5A1
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 19:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B9644176B
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 19:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJPf0A4yvUuM for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 19:16:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAFCF40324
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 19:16:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c7so4738016wrd.0
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 12:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xlPSsJ0OSDR3D3oW2vcUo15k+zP2AEdMZlnWAvuDcog=;
 b=HAowYcHHPBMbWegiXq7lYUAhJYNroSCQygEGau7wkkV7ZuCLQ/HK/HTDm1NnWpQKXo
 WNSdtHyVU/Vt4CZHmSm+rx662T1Sw4i100HiloCFHvdUibFcbZlWhrYbKnhW4TPsDffb
 quo2+xKV7rjki5yHl2oGrXoRuUVjxq3WtAPZKKwSlU7eqpdQQPz+3AIhuj3yfV8uMAbY
 ovFlI9GqjEo8GE8tXPFu72dtL6azl11AXb2s4w1cyzlll4vMnNqTf/8YPOmxLCT8TZQx
 CNlcNbselcBo7ZxaBRf9j8Nv3aQwtGgHFpQKtSr40O9wZO/CDwyjNCYMTD/ewtzd29gJ
 kymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xlPSsJ0OSDR3D3oW2vcUo15k+zP2AEdMZlnWAvuDcog=;
 b=GCvTIJ4U05TWZW7Y29/3CdSxrYkhzJDkiDsXYy4f5Kuay6zVSVEenusCjip1fqeIE4
 5r+qEoX34do2JXVNcHWrwLH4R6mw3Xjo8YpekJ+R7T/K8EwJs0vrEgWnvV0ePZk2uqGI
 +LinL7SXO//Cbq15AmF8wU4xCuiRLcNwXQQU0P4iwnMWugUmQ8uhA10FkjiR8aDolkor
 UIgvZZr/n9hUpG/wXZdTlUBNn9DdN7zPKmNn450jTdhv8zR7KHb4c7lz6VXRWdwujE0l
 eRhlZkXcoWmf21W8eLPOJmdGR9RZPKqasE4EpaQsXjqDy7AyxoYbgpp5zrj4iDUSpmtg
 J/Zg==
X-Gm-Message-State: AOAM532bIfERGkvACg2UXfu/RIEpKf/rvGVuX0njuiT23QIZX1ZX8f+n
 8mNe+dZj1KdTXGRXYvjV4ZiW1pluRMw=
X-Google-Smtp-Source: ABdhPJy6zDXdpJ0CSJTIiq4Jz4iaB9y2N/GYJgcqNyhKE//g8Vubq1uTlRB0tXBCrvH3o/qKR3R6QA==
X-Received: by 2002:a05:6000:188f:b0:205:4d98:607a with SMTP id
 a15-20020a056000188f00b002054d98607amr7635940wri.505.1649272589825; 
 Wed, 06 Apr 2022 12:16:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b0038caf684679sm7206268wmq.0.2022.04.06.12.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 12:16:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 21:14:38 +0200
Message-Id: <20220406191438.4012422-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/spice: needs C++
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

spice needs C++ since bump to version 0.15.0 in commit
b784f1bc0fc3ac33a20549069a81ff98260b58e9 and
https://github.com/freedesktop/spice/commit/e6e6ded681ff154f236f260f071389c4c8c0d944:

configure: error: *** A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/4e0dc43c28d45176cccf573fb56ea9690192f754

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spice/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 2241b55b3d..ca5c562ca1 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,12 +1,14 @@
-comment "spice server needs a toolchain w/ wchar, threads"
+comment "spice server needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
