Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3DEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B716660EBF;
	Sat,  7 May 2022 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ND9e4MbLuXGK; Sat,  7 May 2022 20:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D098B60EB8;
	Sat,  7 May 2022 20:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85FA51BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BE8582702
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03D5ZCJas8ki for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 20:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62E95826E7
 for <buildroot@buildroot.org>; Sat,  7 May 2022 20:29:12 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p10so17719718lfa.12
 for <buildroot@buildroot.org>; Sat, 07 May 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dawutekzowCvpw7NgZdkdgS0k16s4XWYUP9g68Wvycg=;
 b=DyJrqMFYvy0cQmZ8cMs9bZAc3aNtSCzJrLt70w2CnCceutWpB8k54QvImzDEJ15NW5
 n6pIUybi19osuTu6CmhkRPVW9WEyJN3+UifmitLM4mvmiFuxXmT8R4QU5H92zTkNpV6C
 QqbuE5cKSZhNxEwVSStJe2EvZueZA9HLsC1lgS+FE8wyRWrK35ATRhCmTmIU+qChBaFE
 qw3hR+e3L3kERCmWS4Rb5EqvM4W5vqy03s7VqS5y3NfzuNqpgrtcDPZt1nXTn2iJ4Ki0
 1LiAfC36aCLkzyX71RJJ6kd/iIueKK4mSjm32i3qoYva7QAbvhgikC7E4UXoD0V4uLFb
 sO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dawutekzowCvpw7NgZdkdgS0k16s4XWYUP9g68Wvycg=;
 b=RDhzpg7tDH4XNmlPkxwMYkfebku2hQOPp33TRMG989aXJ7w9OF87DjCz48ytAU9O52
 1dDONeT4NeHJJgNCjmlBoZi4+0zIEO5/ZCMpuKyJ06Wlg/8Fe1x8wJ/7egQT05v2u45U
 zbEVhpAZo/EBZ0iXxDjYt/N4ah1p6uor8PJUaH85EddNFRjk1cU9k96hgA0039gwEMMf
 +0bQlS/b7EmwQI24VJKWT08EglQTTG8KQqcGlPjJLXuQGP4riWTWH0zF7RdB7vyGpAmb
 ZAn5d7CxXBImkcZfW13Boj8YVGlJ8je6i4ugsMw5GeIQxReuJQa+ZKgY0XX+ePMv5k4R
 bIzA==
X-Gm-Message-State: AOAM531cufjqGbYw+w77pNnRRy9IJzNQklaFUaVcqWn7gA4QKBTx83OO
 wl1ECIY+HyhCmPBJyIubWW3KC1IVlDM=
X-Google-Smtp-Source: ABdhPJwWm+IZb1ok3woAAj596GHPbu/Ry9+tqsaF//qGIHhJhbrJIKREEGdXXJGingAqflKNasjtqQ==
X-Received: by 2002:a05:6512:448:b0:472:3c0e:cf7f with SMTP id
 y8-20020a056512044800b004723c0ecf7fmr7446149lfk.279.1651955350001; 
 Sat, 07 May 2022 13:29:10 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a17-20020a05651c031100b0024f3d1daea3sm1150028ljp.43.2022.05.07.13.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 13:29:09 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 May 2022 23:29:05 +0300
Message-Id: <20220507202905.397732-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507202905.397732-1-geomatsi@gmail.com>
References: <20220507202905.397732-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/xr819-xradio: enable for ARM only
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The xradio driver is broken for kernel configurations with disabled
power management core functionality (CONFIG_PM). The xradio package
makefile attempts to enable all the required kernel configuration
options, including CONFIG_PM. However certain architectures have
no support for CONFIG_PM. Those are or1k, nios2, csky, and more.

One possible fix would be to exclude those architectures in the
package Config.in. On the other hand, the xradio driver is rarely
used: orangepi_zero is the only such board in Buildroot. So it
makes sense to keep it simple and enable xradio only for ARM.
Any new xradio users will be considered on a case by case basis.

Fixes:
- http://autobuild.buildroot.net/results/2ad11cd7a9ca6b694854730e46260a944e8c4bac/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/xr819-xradio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
index 9d7fa4b0f1..351ea95c79 100644
--- a/package/xr819-xradio/Config.in
+++ b/package/xr819-xradio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XR819_XRADIO
 	bool "xr819-xradio"
 	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm
 	help
 	  Wireless driver for SDIO WiFi chip XR819
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
