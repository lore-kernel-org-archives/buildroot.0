Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6FFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 19:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9621860E46;
	Mon, 10 Jan 2022 19:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoxwyPPF_tS9; Mon, 10 Jan 2022 19:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF3760E27;
	Mon, 10 Jan 2022 19:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 627E01BF488
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 19:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FCE240961
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 19:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMQsctMw4nmh for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 19:44:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D86540956
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 19:44:49 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id 78so8855726vkz.7
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 11:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xp+Vpf4Vw1/+XnZNIpdBdCga6Y95GVyKPKSHVj1rOLg=;
 b=Yt6jhwJKXX2h1rN9FqNPQlpIFVHv1drZPH7TDmGeuatGuoNiWzmfs0YOxxgbG6JDxv
 6m52Exo0N+9qT1rQMGGi6du8RcWO7fIeWxqfrlTBvPiM1NPkdCjOOfJdPkYU2yawowUF
 EL8BaSXBK8G2+z3IV+xmkmgyDzL9xq8+HLSMiuzJC+MReZnLBrtQ0TxdhX/I9ncQJyw9
 OO13wlWctfMJlURiKly9U3wPDN67878IuGijqeCZNhTZhceF/XiaHer/agkbN+sEHsVf
 wZmuUUJ/CkwyTVSomOsVAuvKyHlE6iAtEJpCmf4x9Vdn4CW0/vyPudhfF80x+S+BfAB/
 UjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xp+Vpf4Vw1/+XnZNIpdBdCga6Y95GVyKPKSHVj1rOLg=;
 b=dfVItZzkcGb1zoBD0ZE38J/jiU/9BxWvhNjrT2OwK1XKuWQavnw2GPgaTQ9uxludU0
 VMaJCytBUgGGV3WpkdrvIBAd+1OQz3SOjCVTy+1DOlbDWMei2A8QHjcA1ODtNBSdEIHC
 IwIhxeHEy0QXmcRijrhV1Bw/BZTG0r6KC2WmB41kjdr7jje/xLYCveX9GIj4KkpaRAHk
 Y3EfEHrT8cJRAAaBZDjd33qe+03QTeKjddNbaO3Hs0sUR90VB4b8RE8b24qW6mYwjdjI
 8V9Di4zZlUHmWblcy9ViPmqLEzobuzCao1+T5qIZYckX3bzhJcyB4y5DrO5YL2HdBSlr
 oW2g==
X-Gm-Message-State: AOAM532xUwzTqwH6/Ck5ezK8SU0M4ul3i8cJeu/o0jJQh5inU9UHZTrx
 ejeqxDg5lsJVvIsCI0v/08kAmGBUDlM=
X-Google-Smtp-Source: ABdhPJwqhcKrYZs3rAcP+HxQ2Kppo49HQ6osDD3o08qBF2CLhHzKnVE8GU0c7FrNc5E0XaBJa/BbYA==
X-Received: by 2002:a05:6122:16a7:: with SMTP id
 39mr662657vkl.30.1641843887731; 
 Mon, 10 Jan 2022 11:44:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:9e9e:dcdc:97da:bf2b])
 by smtp.gmail.com with ESMTPSA id
 63sm4488283uak.17.2022.01.10.11.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 11:44:47 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 16:44:39 -0300
Message-Id: <20220110194439.1809166-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/uboot: bump to version 2022.01
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index bffb7cfb19b9..c630fc655291 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2021.10"
+	bool "2022.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2021.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2022.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 68259f69f26e..9171a794a168 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cde723e19262e646f2670d25e5ec4b1b368490de950d4e26275a988c36df0bd4  u-boot-2021.10.tar.bz2
+sha256  81b4543227db228c03f8a1bf5ddbc813b0bb8f6555ce46064ef721a6fc680413  u-boot-2022.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
