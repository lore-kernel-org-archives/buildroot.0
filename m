Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733AAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 18:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14F6940126;
	Wed,  5 Jan 2022 18:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyVsr381v1xp; Wed,  5 Jan 2022 18:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8496240347;
	Wed,  5 Jan 2022 18:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32D5C1BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C4A6FB8F
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKPUtnNeROAZ for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 18:05:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64A2E6FB8D
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 18:05:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o3so26517427wrh.10
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VdtwTeoKPeunfi4uR5DkO/lCJ9qKenQMaH+WO4OnCFE=;
 b=UzVtIQC9KYscibVxbKldU+syft+aQ2e1Hz2uBgb0bQfoPbb0La4VZwdVEYL6uKagZw
 wd5Z37r6fCYCdXtXI6PnvgzBQPXMY1z0EaHq43iWQk0NtcFzOJ84AYYNBLTvxvaCM6md
 jnhiJ0gclHRuRR4Rx9Yqzq10aUNdlTpg4nUETypGe7RqmBXCj49svTllcKCTJEygpA/A
 TwYBpQ4kTErMuDVuxw9mkfB2sQN/zk6lRnCFWDKvkT5rCxOQcrOBmLVPMw6xRUZz4GYg
 nnbzGweQjxjOOUPJoBMocu7wC3GF0/YoOqZfKUCP4gVZQT1az2MCwxabt0CQPdWCvMXm
 E2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdtwTeoKPeunfi4uR5DkO/lCJ9qKenQMaH+WO4OnCFE=;
 b=Jnrp04JtXh6PztJQsmCy1Ne6LH/OU3ojx1STu+CJdcTdkduJqdyEVRFT9wEsNooAjt
 Zq78K9VuRqKuroj9fCj8WVF99lmhzSXzMmIa8TG5zIBBSQWUhQ3sXK0PP/8qfB17n4WB
 5s8rf3QFD9bH5A+EYCdcyBeDPohuw4wChKjTEbsex64XucnbB2BLo6suOYjncIqegC++
 Ghn5+XcRfZ6wm+a3J/E0jT+x/qoWNLP75z6qCyZJr/tWhSoEv1aUqtIYmM+dH+yh0Kdq
 bHUxEgaUA2S5qP1MP3o9B18JDV0B/0G25piyFMGLVNh6fRv2sTQixcilQKcPT6NhbDy5
 /16g==
X-Gm-Message-State: AOAM531gVD9V+9cqk9mUtsGpidogBUl5fVe3bo4C26LiSAwQYSxBDAKi
 YlIr+TvJQUvmxqLSkKEUwPr985jxWyU=
X-Google-Smtp-Source: ABdhPJz3m+9IQzF7e28mSdepjsXm9a/52ObDMFeyv39CJTy5G2VNHBLX7iFUwxEIP+oX/2g3BnyL4w==
X-Received: by 2002:a5d:42c8:: with SMTP id t8mr48313157wrr.369.1641405914601; 
 Wed, 05 Jan 2022 10:05:14 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id a24sm1642283wmj.42.2022.01.05.10.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:05:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 19:04:02 +0100
Message-Id: <20220105180402.388388-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
References: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/android-tools: add host gcc >= 5
 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add host
gcc >= 5 dependency

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/android-tools/Config.in.host | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 433f4e384f..576e53e8b5 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -10,12 +10,16 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS
 if BR2_PACKAGE_HOST_ANDROID_TOOLS
 
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol
 	bool "fastboot"
 	help
 	  This option will build and install the fastboot utility for
 	  the host, which can be used to reflash target devices
 	  implementing the fastboot protocol.
 
+comment "fastboot needs a toolchain w/ host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
 	bool "adb"
 	help
@@ -24,10 +28,14 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
 	  implementing the ADB protocol.
 
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol
 	bool "ext4 utils"
 	help
 	  This option will build and install the ext4 utils for the
 	  host, i.e. make_ext4fs, ext4fixup, ext2simg, img2simg,
 	  simg2img and simg2simg.
 
+comment "ext4 utils needs a toolchain w/ host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
+
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
