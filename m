Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE13DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F99B40363;
	Sat,  8 Jan 2022 13:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uj7ye7My_TPm; Sat,  8 Jan 2022 13:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541CC40425;
	Sat,  8 Jan 2022 13:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3F0A1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFF20400CF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id trhkGkk5vPW5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:14:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B37D40022
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:14:21 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id m15so815802uap.6
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 05:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyNdqKeftbDsp2oKv5kf8cwH+WrkG09hxK/ecMUZ/Dg=;
 b=cM2ONLlAeOlbanBCsa+7zY3G915JdPk9C3H4PzpBB+/n5aFhmw/wKDk0nTKVSnGob+
 lCZ6p6bk5AKI3Hne7EOOxGPUox8tqfhVDXLiLB/tSQpYzmxhFXq4EJFkpgLP/UwzHnAi
 gCqDqrnS23IDO4xeU2JrJUsE2cI6gp2QRSr9hplf2PmhDIDt64AoIE7Gx+dMO9lFZ2k8
 zQPZsLBxW/r+19oyh6PDemFNdIbb3KJWk0yIOUe515b5FZRwN9oc+q/CDgCDtjCbmck0
 spOm4jPgVlN8pjikc7RftLVOYpgiPV/znWKQ2M/XAK2Ml1LpatudqxEFgdQWy1aXbM+x
 Fpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyNdqKeftbDsp2oKv5kf8cwH+WrkG09hxK/ecMUZ/Dg=;
 b=5hoOp9jYnJ95I6XPJIj+A5wlfiUtvb6sVfRbFjvn0pblxRBpIeGjbyh3rI0eaOsEqJ
 yKL3DmsYJNrPdI9uSxd+bPc/rPypw4/lR6JaBIzc1HmkmjXcIBLMZUseA6dgPP3gV94a
 IT8+PgTyIivY0QiYvarnv59B0EKSdzCNgtBfsm01vy+bYxXIXv0qKuKgKHahLaoY399E
 18qTs+oKNeKasqckbjEFZ5PgzTg0gauURS1gUQ3YVqYt86I77UfbA6LZtzUiHWENUoi7
 O0FUOxHZrhEV8KAvZ1sxSD+BLtUSStSoC1x1c7L6BTxn2abC+H+1JmUM7Qj4tLVt4dpC
 fhhg==
X-Gm-Message-State: AOAM533bvtCbvSaRjyH4zF/8XEF6dhmRfYru+8pFllz2Jikv3h04yhVM
 KeBjGXvlqmkUGhgSVtM6TmIduLcCQNs=
X-Google-Smtp-Source: ABdhPJzSmFrxSGEuOzalUFVwYSlDZxCs9OD2NrEGE2Nxt9NsJ6hbnOMjnSk8XuIjWYybMm564FoXFg==
X-Received: by 2002:a05:6102:d8a:: with SMTP id
 d10mr12080652vst.47.1641647660128; 
 Sat, 08 Jan 2022 05:14:20 -0800 (PST)
Received: from localhost.localdomain ([2804:431:d77f:9271:1901:b73a:309b:7ec1])
 by smtp.gmail.com with ESMTPSA id f132sm895173vkf.18.2022.01.08.05.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 05:14:19 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:14:09 -0300
Message-Id: <20220108131409.990135-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6slevk: Select
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
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650628
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6slevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6slevk_defconfig b/configs/imx6slevk_defconfig
index 6f0bae5aa94d..9448267e2b28 100644
--- a/configs/imx6slevk_defconfig
+++ b/configs/imx6slevk_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
