Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4368C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 10:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33FD041D5A;
	Fri, 18 Feb 2022 10:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vH_H8V_SqCqC; Fri, 18 Feb 2022 10:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D91C41834;
	Fri, 18 Feb 2022 10:59:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1741BF2F6
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46BD660AD4
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pfw3UiX3o0QV for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 10:59:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C9F8607E1
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 10:59:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso8310467wmj.2
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 02:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2S3N+b2kno+XKX/i9kkFaZjRBphdWW4LnG6ayFIRDp0=;
 b=Ng7xVU7ixMpzZtVgwe9ZOcwPktW+EcdksmObM/amKyQccMzwP2p6xNBsf2Ol8hzIc3
 0a44/q3/Y9uBOjvMPcnAl3dZpV5uZUSdibsYD6dFP288eYeKR80L6Nm0o8j6TTpq/mwd
 vD8YcmvbggTAYbpdcg9O7WxDFJSTzwr7sFldL0OgnF8zQ3yY5rmujwegicVaoOvqKX3A
 5VnwGvtS84RCuuUVlIlq66+YUhfDqaFXZwxlBQJdpwspNMlyWDfCeJ9vhzMQqG77zVXD
 yhTEDNFkxHNqZ3lDX6ZQzKDkqajKBi4JyYZzNxTibDlV7cWgBON7obrCPKRYqCQnytGp
 XYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2S3N+b2kno+XKX/i9kkFaZjRBphdWW4LnG6ayFIRDp0=;
 b=wcspkhPr1LSNaSRVyn9qXcYC5PFgCP4TZATSmoUrbUBSF31D7Q9rUeT/+kb3jso5Rq
 9cPXqkkjPlSM+/j/zVhx4lTThy9bDc50SS0gyBQUEalHfncG2uEmi0mmF5ihYhhRGkqW
 j/EHUo3mgYLXDyw7kxuz+7yAlkbbkXglLknF7YRmkdsrrx2JQDXma/op8CqncjAHel3m
 j7g5WjYU13IoiYMP0kn9Gu2Bt7+DQSRCj+zUhQ2NbfbuWzP+YwTH+/skOnevT9+KtxSR
 2iNSKnI4SudyDEKHoYlNyaRWTVRyAu2slGq0tXuJCT/jnczzQUzYfrT56CQpQHmMkB3F
 WkPA==
X-Gm-Message-State: AOAM531QVfwvXBAHCx+m7LHrtEcav5xLvtfLudHttnHcNplsgWU8WkYM
 Zk7amSzQghD8N2Wa66BGDAod4aDmKBw=
X-Google-Smtp-Source: ABdhPJxRYhd/DkCEyq7sCRvd+zGMX/w9vLwkm9hrnN8NkTKOXzk6iWuB7vQysUBEN0qBIaKC6MrB9g==
X-Received: by 2002:a7b:c201:0:b0:350:de40:c295 with SMTP id
 x1-20020a7bc201000000b00350de40c295mr10271626wmi.103.1645181952420; 
 Fri, 18 Feb 2022 02:59:12 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g22sm3835957wmh.12.2022.02.18.02.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:59:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 11:59:24 +0100
Message-Id: <20220218105924.738666-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://discuss.linuxcontainers.org/t/lxc-4-0-12-has-been-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 2b58df2f1d..d460bc6a01 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  afa481e17ca9a9cf9fd3d2d7a04e42a8f6bfe60b323909326c968e852cd9f02c  lxc-4.0.11.tar.gz
+sha256  db242f8366fc63e8c7588bb2017b354173cf3c4b20abc18780debdc48b14d3ef  lxc-4.0.12.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 08f64bcec7..9311dc8775 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.11
+LXC_VERSION = 4.0.12
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
