Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 18:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A879B409C4;
	Mon, 27 Dec 2021 18:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIGyTinQIb0K; Mon, 27 Dec 2021 18:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 211EA409BF;
	Mon, 27 Dec 2021 18:19:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADC5E1BF3D6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A538860E16
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSoV6XzNdH2r for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 18:19:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67B3760BB9
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:19:48 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id bp39so13868435qtb.6
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LxzbJMRp1u1u2yfvxTn/I37l70JYG243QZdTF13J8JQ=;
 b=V39bshXgZriquzWmAHKUlC1aLC4bRVChp2Ysz9QMrKAaJLd4cOK2XrF62xI22Twqjt
 +1FEkTzxgZ3/NuaQHZ8AxVxk86Jf4bGGLI4aGDus4ynSDEJItpXFwD5Ic5WmuTX11wXC
 edmNoV3zxwsI55Ea6dtY8XTBC05Ta5EtBzdqHxBoqYxD7QaFPFG5j3ZGDPC1ilx/jIL0
 A+6WxvTtjRakxq+UFLA9oy/MyKFQ7erbk8imolo+3vuMU+19MYAVt4kp13T7OqVWNdve
 VABqNZWhhxxhg0qOWQLzhbwNp0FhFFxuWKtpN7nO5tvuS1WC3PgOF4t0QQqPhrHL93mE
 LC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LxzbJMRp1u1u2yfvxTn/I37l70JYG243QZdTF13J8JQ=;
 b=BjPNYgV30XvAt7gYNrqUZ7u983PepYO1ZqBhqnFY3NxCQYfrFlIlRUHRjXyNdcHmLi
 MPiVmkV93czu+AsemK5tsMh6sEHtVsLA0BQ7AI2EFtZqUvstMeYGHkU5dtIuHBX6rSW1
 X/qsCZk0/kbjnfuTztk74lUunezQnHjU1ic2ZSn/E37U59rjuz8IZm2k6u1ePDLliMmK
 p6sYjP04+ppa6RcbRL0wlOONOene2GElctuTbKm9LLIrR4EG7d++nCbbFse4XmAHD2sZ
 +JjJu4RXWXC1y7wlahVxFxUeFJDYtJf0Acg4oU6taWU5A992uu1OPWyaS/b0guE9ZgIc
 i33Q==
X-Gm-Message-State: AOAM5313PTT9GsbuK957huLw4dOjGTY6Np33lkVhEwtZLWbWLAheeS68
 +ciCTpzfy6p50uS98MhayBMcdDBvGao=
X-Google-Smtp-Source: ABdhPJxlBvM9sE3qnId9fZHUtv/JxJ36tlUpMkYIy+VhoUzA9AL63TI+9X5NvnJQ/uQGuO1xrG/czw==
X-Received: by 2002:a05:622a:494:: with SMTP id
 p20mr15749397qtx.83.1640629186832; 
 Mon, 27 Dec 2021 10:19:46 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8f6b:751e:ed35:8559])
 by smtp.gmail.com with ESMTPSA id
 l22sm13546439qtj.68.2021.12.27.10.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:19:46 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:19:38 -0300
Message-Id: <20211227181939.3114427-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/imx6slevk: Bump U-Boot
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

Bump U-Boot to version 2021.10 to fix the following build error:

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006177
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6slevk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6slevk_defconfig b/configs/imx6slevk_defconfig
index 90a02964e7d6..ee7f066f71e3 100644
--- a/configs/imx6slevk_defconfig
+++ b/configs/imx6slevk_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
