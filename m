Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F865C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8350610FA;
	Tue, 26 Apr 2022 16:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQStiun6jumJ; Tue, 26 Apr 2022 16:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047D260C14;
	Tue, 26 Apr 2022 16:41:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE711BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B3BB83E31
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajqpIKi2-EYu for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:41:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D58983DF1
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:41:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p18so17901077edr.7
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cQ8o+eC9AkXjSKZQCKkNSrKWBpR+Zuy9lfVzfAsG214=;
 b=h1OWo6HxkfTsMu4Ix90GRwxmsha197ZPg+lGCner5qqOWWdydO0rIR2zbrxGOz1q50
 eMPZRTU5tC/rC7gjeUT/8yezbNJnEdwXd/KsQam0lFuqr9Kd7BrkoK+SFOJM3odhVnDQ
 KV48fBaYzqCB7TpSLndV+G87z2X56ak6/GbcOsDBlEgsKPTeNXLs53ZgDZ8oZNTO2TsZ
 AUr3NlXz8Pnt1eL0TaqU9JSxxrji/CiYUGhrpqAXqTnAUgqQercsgMzBJmKrZEagcNxa
 IsjcSNbcRdC09nhy99T0DQAzboWqDrrKmlhrC58I5anK+RDoz/MFfOOwHPCIsRANbX1x
 PDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cQ8o+eC9AkXjSKZQCKkNSrKWBpR+Zuy9lfVzfAsG214=;
 b=iXFqiq0c/sqNtO+ZFxUhKt6N+7JO2fHEUtPiSLEsrLtIW2WY/AT0zICGtd/cnSgRi7
 acSEmJnihfnNQdu22Oxq/QEHdZKL7MuJv9Ye11kqttPX4kxVWiFpnMIKjc03iIaMHjU+
 +AhUNZSDHd+4WY4R/1pMWxKZE9L6f5ZjsWRiWvkPa/iQLufDN7ElPM971sIuNOpJqVNh
 bXneqEQu/gN02hK+7PiCyUdx7KnAEheOVK0/UD4RF0eddOh6fnmMxEseR5ikkAeGntoe
 al5ArSILvGMxMQbVwATqS8LyR1OlePM05eZCCJKmtRxJhqZEjSzuzL8tR7pxsM0yVMe7
 ukAg==
X-Gm-Message-State: AOAM532hY6jieRJIsUEyuHur0cuDFMDBtaSdB3r2QtQ9F0J1YyaBeOXz
 RCWGWcsR9lBntQ9Ny+q89iCOpzfbJB4=
X-Google-Smtp-Source: ABdhPJw30YOI092ieDcVhWVKZ6a0L3MdxWGK8UsOUYAUw7DlugqwFJteCK4/sGywPr5oSllrCmHKWw==
X-Received: by 2002:a05:6402:1850:b0:425:f2e2:2594 with SMTP id
 v16-20020a056402185000b00425f2e22594mr8519400edy.3.1650991293814; 
 Tue, 26 Apr 2022 09:41:33 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170906297100b006e49a9535f3sm5137707ejd.114.2022.04.26.09.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:41:33 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:39:05 +0200
Message-Id: <20220426113905.3544867-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pciutils: bump to version 3.8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 4b13c7484..0b66b8258 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  9d40b97be8b6a2cdf96aead5a61881d1f7e4e0da9544a9bac4fba1ae9dcd40eb  pciutils-3.7.0.tar.xz
+sha256  91edbd0429a84705c9ad156d4ff38ccc724d41ea54c4c5b88e38e996f8a34f05  pciutils-3.8.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 67defcc74..c1445968b 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.7.0
+PCIUTILS_VERSION = 3.8.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
