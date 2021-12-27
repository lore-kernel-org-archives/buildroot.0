Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04789C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADDF360E5A;
	Mon, 27 Dec 2021 14:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4nwttwW96Ln; Mon, 27 Dec 2021 14:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B05F60E70;
	Mon, 27 Dec 2021 14:44:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5853F1BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 567F5409A8
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpsoh4UL0We1 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:44:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89447409A7
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:44:22 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id l11so14508555qke.11
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CwoPg5L6S9VFSRcaNjNzjEOMoRvoXFk0nVoVNVgJTI=;
 b=dCvBH4RCFjg5JAtpbJrmOJK/2rL8Yc9tPJpy5zkOOJ5gWOjQKsLQu5jEkxDg8XU+5v
 dTZMbVEQnBYTraFUqIftLLLcD7rf+GGEnAYWTPtwp/rvTMJZWjEJKJLo04d0IApoMQPR
 SMf3/5dP5WMuqdXk7uAQCpECpw2t04wpZzquJUaqjr5zF04DhQef1Lqls6a26UtbVNrR
 u6Lf1Ksf+qQese7qiBd/16NeuobXaHsOvOgOIsvwAIqCpOMH4AILUUgFNgRRu0ndan11
 hAAWGdJzPJbsoVVKg3J8VxOsUJnn6QEDLiB68au1T1RdEj0Trrdo0ZxNlUde+3ul1N10
 Ut9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CwoPg5L6S9VFSRcaNjNzjEOMoRvoXFk0nVoVNVgJTI=;
 b=RQy4hgBQCB2zESTEHo12/be+E93h7BshJsPfza76uxEAnCwl+X85jW22TyNuFv5SEP
 vFPKeDRUmJKNY5P+4ctpa3tUMvnUk2NaDA6CZ1RaoqlpQWfzSAzZ66VsZhBBzXCWTE/B
 Ipr++M0RQ12Wh2KB4SDfgBm4pOQcT/48rBkWiAQ6QDJO1K4Fbygl3VQBcPkKDSPu3W1F
 lht7LjIyd/KUIWDKUXSUXhLDerbOe2nr867YqauJLuIB6As0GVPVdQk+S9d9HP8XiUe7
 e3X9yCJfsaDywcJvKlXtdhfKMXW0brtf6HJuNTIOWvwRDjcZbpD+t03tsW7bafrzn+sk
 lDrg==
X-Gm-Message-State: AOAM533quNAubpiUfngBic7LWIm0mtao0SOi52XOhG0hbeaOEnfWcp3D
 5D2X4floCLLqLyu4p6I09HxZZgtWu/g=
X-Google-Smtp-Source: ABdhPJwl3G7uXU9d8cmAjweUc8hbtxILfIRVKxwp04XeymmvjBmvWyk+aIRyKTQFiZ/wdgpXFQ3cUA==
X-Received: by 2002:ae9:efc1:: with SMTP id
 d184mr12265246qkg.707.1640616261012; 
 Mon, 27 Dec 2021 06:44:21 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:9e4d:7b75:ee5a:c500])
 by smtp.gmail.com with ESMTPSA id
 t12sm13802890qtx.58.2021.12.27.06.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 06:44:20 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:44:04 -0300
Message-Id: <20211227144404.2484384-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx23evk: Bump the U-Boot version
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

Bump U-Boot to version 2021.10.

This fixes the following error:

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
collect2: error: ld returned 1 exit status

Fixes: 
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006170
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx23evk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx23evk_defconfig b/configs/imx23evk_defconfig
index b5bfc849b434..94d159cf9e5c 100644
--- a/configs/imx23evk_defconfig
+++ b/configs/imx23evk_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx23evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_SD=y
 
 # Filesystem
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
