Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE43FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 19:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B0C80B68;
	Wed, 11 May 2022 19:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JviwYyiHm-_I; Wed, 11 May 2022 19:46:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93EBD81314;
	Wed, 11 May 2022 19:46:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56D381BF3A1
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 19:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BEF6068D
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 19:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8E4rPHBq271v for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 19:46:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 399A360596
 for <buildroot@buildroot.org>; Wed, 11 May 2022 19:46:21 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q130so3927985ljb.5
 for <buildroot@buildroot.org>; Wed, 11 May 2022 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBc8YyRXDmkqMfETncjhpHY2yDC5CeGvQ0IJlTRlY8c=;
 b=oC8CCNp4b7irwO9vPIbz4gsP89J2/pI+/kKuOblmCZwAgxEPa1a0+qtIibb9GOuayK
 pR7JHYFIDWTjCqFDiu165xQFdP9sBvliKP+0hIIpVSYqN4mu6ZU1Sh989Men5a3YrQH7
 PzGH58lLHzmQMdR7RMR+R0JxVZ/FveJ60sxmY9J8CL4JZ0w/BX6BpKy3HIBtJFRP4LId
 X+OPlsqg7UMVjn2PllyQeWY9zzJnRMnPru/7OB5Cv0Co+68uBWE92kyB30YKn4D4BcRD
 T435RBCbo4DrGrrN46hcEMZbGaK8LVckwkOSehOoKYsmPvGYkUWoZviiG3+CTeAJErWt
 Bj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBc8YyRXDmkqMfETncjhpHY2yDC5CeGvQ0IJlTRlY8c=;
 b=S4+0mYivRzX9zINtiBtTkoeI7vBxO/JlEp4xcY/TNiTppnS3A0A/Xbpvjsgt+6GU/m
 7Jy86t3eRflOOd5Mc8VnH8rSJ7r1Bz+1aREzKPq+ryX0Ff2/tCbvug4JDfi6TgJCZYXP
 89HiKSqxoMS2L/FFnSbCwdpcws1nM3D/z9Urs0KmPM1k4W6ZIBYqTMFb+mUicxFoFsyn
 G4xWlesTEwfScfwTKdwRl8WFCyCgAdr68G1LFrvPE8K7sAVJpiw3ubnvw5xFajObdFeM
 6S2QCOCeKfQuefwla5oCFBIifCKsd7ALHmA799wAsC61eD3yRBHazjZdkb9G469e/Z84
 ewmw==
X-Gm-Message-State: AOAM530Qwy8RMEPd+1goIw6C2heMWtxvfjoplbWzA29hL5t+t/rMb0n5
 5MhY/FrsqljNZqntzfZm6PbXsc3Wu9E=
X-Google-Smtp-Source: ABdhPJz8VOj1RG+RCcjVTAVhQZ5fEzMq5vH03aWzM8mRhWBZj7NwnQUk7d24IyY51GDjG/iSkvO/pw==
X-Received: by 2002:a2e:bc19:0:b0:24f:4de2:38ba with SMTP id
 b25-20020a2ebc19000000b0024f4de238bamr17950962ljf.351.1652298378764; 
 Wed, 11 May 2022 12:46:18 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 136-20020a2e058e000000b0024f3d1daedfsm482276ljf.103.2022.05.11.12.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 12:46:18 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 22:46:16 +0300
Message-Id: <20220511194616.2272499-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: wired driver needs
 headers >= 4.6
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wired driver enables macsec support which depends on if_macsec.h.
That header has only been exported since kernel v4.6, see commit:
https://github.com/torvalds/linux/commit/dece8d2b78d19df7fe5e4e965f1f0d1a3e188d1b

Fixes:
- http://autobuild.buildroot.net/results/6bb619eb7fdecf7824fcc549c4ccb8e487665d10/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/wpa_supplicant/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 7e2432985c..92953f69f0 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
 config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	bool "Enable wired support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
@@ -49,6 +50,9 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	  supplicant can be used with Ethernet.  This also enables
 	  support for MACSEC.
 
+comment "wired macsec support needs a toolchain w/ headers >= 4.6"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
 comment "wired support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
