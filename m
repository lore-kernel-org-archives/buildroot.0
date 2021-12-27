Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B9EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B18360E62;
	Mon, 27 Dec 2021 14:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpPlnRB_ta24; Mon, 27 Dec 2021 14:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C278560E5A;
	Mon, 27 Dec 2021 14:55:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 261321BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 228AF60E5A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oc4X_aDZZrdX for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:54:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D370B60E3F
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:54:57 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id m2so12951114qkd.8
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 06:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pf8RKVx+4T7ITAhohblMVEe9PRoBt0O2bNIgAfA3Tas=;
 b=bGRIBZ7OPXq/yrkU4BhRTYyP9ozqOjaLStExGHHwOWC67XDe1j22ogP2dCJilXUCzU
 IaPcDniYQcQixVYSPlzpL/oMqyelJbBhxsfltg3pcahXMYXSeo2TXV1oVZILFAWS/Imk
 LLcQOX522zZ7oRtheGL0994FL8Etu0FHGv7gAuxxFv2B0wn/zt7LZQm9oGssNO16ehw4
 LqThFQXJJiSAADkial969jUJhs39WI3zcOIBZKQj+nBiAxCrl/f+2nNiqjjbUEYL67Yy
 dsUFEUYM0UhAM2Mla2FIRQpkUm7Vh8ld6tHB3bDPKM0UoL2ZxcTWL5HWuwDh7QPMBhU/
 wKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pf8RKVx+4T7ITAhohblMVEe9PRoBt0O2bNIgAfA3Tas=;
 b=TLDsFCfdfuCg6KQFzQHhEpu2vka9Cy9So9nRcCQRTEfB7i10rUhllSCM9xUMfNR/oM
 S3pv1z/e8Y0y/n95AWpruv86c7FPtbIbph2SEWKb2AVmlnfy3RC7YwS/EdJBjDc8z1UH
 HP3mfyGWMlHkz/4OJUuWjYikXycSsq0b3Ivp8tGvyvNv3KtHPvLmd/QFyz5z4KNCH3b1
 D9v8JtDjMvimYsUY3VTrwUA6I6LfwRCowyE8FbUZOSEFXq+OGOSvFiU4YuQgJNrf3gVw
 6CjwDcfztsk5vGjD2jmON0NNpy7DdPXh0sCkaSZ3DSsVkmx64+Vr6ZYUWyVmZUlovFy2
 BmCw==
X-Gm-Message-State: AOAM531cTqgj7M4RexfgyKgrwjouclJI7keAt/8BhXcC0xgLYwS6Yyy9
 +GMjzhg5gMNqDXkXFHFtVFXHLCZoT9A=
X-Google-Smtp-Source: ABdhPJw2GJN1zTlX+WEHFdarNjUJBzcuUoqseTiijEBg6g3j7+GmqgkahVcU6rtX/dPiORLnBE8BnQ==
X-Received: by 2002:a05:620a:1991:: with SMTP id
 bm17mr12113820qkb.459.1640616896400; 
 Mon, 27 Dec 2021 06:54:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:9e4d:7b75:ee5a:c500])
 by smtp.gmail.com with ESMTPSA id
 f1sm13506872qtf.74.2021.12.27.06.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 06:54:55 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:54:49 -0300
Message-Id: <20211227145449.2485689-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Select
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
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006172
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabreauto_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index 7df774988a75..24b3fd387f90 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_LZOP=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
