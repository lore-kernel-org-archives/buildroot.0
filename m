Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF89C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 17:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D40C81448;
	Mon, 27 Dec 2021 17:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxMIxW4pIQqk; Mon, 27 Dec 2021 17:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E45813B7;
	Mon, 27 Dec 2021 17:52:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 499AE1BF3E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 398C660E51
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyUsxeO2qiow for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 17:51:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69A37605AC
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 17:51:43 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id j17so14118088qtx.2
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EI3v5QA1reXec1okhMlv4UTHzqVCWnuVS81vBJ54C7o=;
 b=kM5nGrKuTkgHg5k0nrOPWwlIuddPgMFlRN28AoeCPt5DhGMKwI3/tp+F3TDyCAil2S
 lcEGEDAfsgNkT4jQyoMOpyzRH7a9x3Gn344i4bcQ/YpMdb3IlnOMuucrlifuUxGrGs2x
 PXdK7WLN6Jjee99JPmS0DI/ICU46GWmEuzdra7tN+vy7Je+TwIsk4eUT+C5W0kChKodO
 EGSvtW7Zdx/R4gJ3pNG8RF1XEbliZcfQtKZE+p2d9ur2Jd0mRvu1Jre4xh8dBULIXDq+
 qsFeZlGaxPE0MswqpBopTyLoh6+vLmmpOaYV7hjMZRCqFr38iZLxT6ukRWOyjaBuvZuB
 AKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EI3v5QA1reXec1okhMlv4UTHzqVCWnuVS81vBJ54C7o=;
 b=H+90vDOFERXisFJCpH4MWhYSXjW/fUV2YkZFcaSIzD+uoNFRjGzeX2+P/gQMEpgvta
 P2nbfQaB3SGULEoyyYsncJtl53ro6rmlTRkuVcVj0ByHow29wXdQbZvdHn4N7qBfjAei
 I4zXknDwhmjoODsn0g0IAdRUdOw1GsSQns1GcOl2XjtMPC5vUeXct2Me8T63TU0MC4SP
 nCaMqbM4l4WeC0bew5p4yF8cz/pfe44DQPkSLy375UX1ZSn5IpLGOKCpf2JFRCYS3yyv
 b+WTdPCPVXDqb7vYNhfQt+ulX1ZeJmqX961kpmm28L/SvSrrEKdU7pswbEUKbgBlfAcf
 lYbA==
X-Gm-Message-State: AOAM531wuQdRJXuq6XbzmPx8hFuIBDaeHvL1kqom3cFWY+W+m3rYyl5N
 zYFssjfNMuCwqFafP9zEXsjgBjZ+TN4=
X-Google-Smtp-Source: ABdhPJyVEg1LSIl+EBosesh8hIPwAy+OOLcGHTTFWtGRtCYXzjdMvY+xUB/C5EaaOTzw+wDHjQ8qBQ==
X-Received: by 2002:a05:622a:30e:: with SMTP id
 q14mr15901755qtw.93.1640627502061; 
 Mon, 27 Dec 2021 09:51:42 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8f6b:751e:ed35:8559])
 by smtp.gmail.com with ESMTPSA id
 j16sm14087862qtx.92.2021.12.27.09.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 09:51:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 14:51:30 -0300
Message-Id: <20211227175130.2986949-3-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227175130.2986949-1-festevam@gmail.com>
References: <20211227175130.2986949-1-festevam@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] configs/imx6ullevk: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006189
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ullevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 06641f14586d..c6e2981697f2 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
