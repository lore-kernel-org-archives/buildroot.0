Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EBCC433FE
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 17:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C7F40177;
	Mon, 27 Dec 2021 17:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YaXXR2UGpPAx; Mon, 27 Dec 2021 17:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D544019D;
	Mon, 27 Dec 2021 17:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 743FA1BF3E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 629DD40110
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sP2g990U2-c1 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 17:51:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 816AE400A0
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 17:51:41 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id v22so14088723qtx.8
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 09:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wvHs0Wl6tJW/GfUov4p/cl6deLwR1I8s5MxEPQY6tcw=;
 b=pTAeK/2+cB00fdZ7ILPI7Cm4XAjOgnaXybLZpEGZleW6rFaMdPXOLWB8mIjebekPvv
 veUmh1BrgwS94r8Y1PJQWBaV0fqAnkyMXbO44720XnlDzN5sblDSdGDU9D6r4r81DO/G
 igEU1eS5CYzKrxrLFo9uHDQmYUbAfdat2h+2lu67dDxmFn8spwb7+kEU2G+tTJ9MLqX7
 x6MRoLZId18vOat4+og8eUt2YfnZZxd8ev4yTjpK8YRgUv9qalY/PzUpjcUutxNXXaxx
 5tir4xqZUNbPjOVRY7PH6udvq59ZPwOroZ4xk/CpZcrZ50wAVJxURQArCBSYYHfuYX4w
 Ixpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wvHs0Wl6tJW/GfUov4p/cl6deLwR1I8s5MxEPQY6tcw=;
 b=ZYvdKl+gIImD1L6hUWMlfExMyCd6jCtpTj3eCCDh/8/Zv41JxUGwyvutpWQM9gM6PX
 Eu5Knud32Q3TgIJTQ95YnWnX24RXanvcJe4KDWzxIzgzN7RkmO4tpfRDgjdSxQo/6/Eq
 wVmDWZpvy5dJBrQJ45BjnK+K7i6XJzCdmnLDY8cjT8AfcPC4KstVLMeMoNptCKeWvAVD
 TZTGJFlQ83ogOsQonMb9yz80enZ38SrA7YWU6Uzg1pYGNnzmhRzZhFzKePORUlUicQwz
 58MYk542wpW9J8dNbyem+BOFdN/pWkvMUoABCzBoB+emmua+dtRoyASgV3xHDH+HKZbe
 nHAQ==
X-Gm-Message-State: AOAM532s5XsXVjbXyXyymf/voFg2AYByI3rRq/pt4lnsQgEnn+w80+45
 bOu186m1P5Qs4EA4CyUw2EcIxUHTN4I=
X-Google-Smtp-Source: ABdhPJySQcy+w2EihM1sLoYW+hVUKwdEdQQLDk1aQUkIDoEop/DvB52cr+WsHFgmB9xD04NNxvoXBQ==
X-Received: by 2002:a05:622a:144e:: with SMTP id
 v14mr15601828qtx.66.1640627500151; 
 Mon, 27 Dec 2021 09:51:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8f6b:751e:ed35:8559])
 by smtp.gmail.com with ESMTPSA id
 j16sm14087862qtx.92.2021.12.27.09.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 09:51:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 14:51:29 -0300
Message-Id: <20211227175130.2986949-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227175130.2986949-1-festevam@gmail.com>
References: <20211227175130.2986949-1-festevam@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] configs/mx6cubox: Select
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
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006257
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx6cubox_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index d0ce2f9a6d7b..e80d9955251c 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
