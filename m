Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A76C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD25961128;
	Wed, 20 Apr 2022 18:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYRl_jRVxD9j; Wed, 20 Apr 2022 18:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B196F61107;
	Wed, 20 Apr 2022 18:25:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F93D1BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C1AD410EC
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91DQfj9tTS8f for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:25:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D8C740537
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:25:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n134so2770931iod.5
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kA+SK8fnya4jI19ekFmjbkxKC5T6hmVCaPI7TVcd7I=;
 b=VQDYT14huOhkqF7oeKConIbyTnDabXFNRfcGh90G5a+nMUd0X2cB9wOrkQU9yXEl9e
 UMINGBFMk4seUdlcWl5DL9IYVOajuMzKR8arUD2cTPlueaPPyB0k6izNf4vY0q2OI2gK
 7CCPJjhO5dxn8FP8/mBvqhz4LGPHb61nkVGz3ptG6QpsDJL0s4j3/YNMPLI+5cs++pPO
 XdWRvcZ8rlTW7d/QPWfVkolXiz2CVp/Fv2bH/OOGPBX9G1WMEgMsnZg+trKSEYT2VVMG
 aK3K/SWekMAwaA4hlmxWW6UTN0uv/sMGGjdZ0nSEpOANDL8jH/TSznFKgYjBxAotvrDr
 YLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kA+SK8fnya4jI19ekFmjbkxKC5T6hmVCaPI7TVcd7I=;
 b=OYLWzsUtob5hSiu4V6SFCzhLx4KbM6XDi8XF4IG+mycL9ha/wTr8srEpXYlNyeOu3P
 wtycSka62y1kd8Rg+WPGUHFEIts5ll9sTDNuCZpnux0S2YJbuD49alZGRBI7f5uQL7zN
 +QjxFIABdCwTZ52956tvuAh6XWHzSP3NgMzO8/MKizC+mWWhmaK6JdzOP/IvnRCTGVAG
 nDlzBv+n/es5EFVj8jtUEB5zlmzoZN2COoPxregTY+y4i1CFMuPZlj1rqL3qLx94LmED
 07cav2wgJiYmvlRqQVuj/4lsqB0fL64PztpfMdG6tXIPgyH2jeCPS/I6wvPAaXlJxtLa
 BBXg==
X-Gm-Message-State: AOAM531T6RdTtMSoCpUcAFsIWQJkDPXhzhypbgNnb05UliXeIVOXcYPc
 hRWmOeqiLhnAnM4u+WMblO85BYYalh1IRw==
X-Google-Smtp-Source: ABdhPJzIW80nTMNBObnEwAnoklM26EXAep1/kiobdEmGMOna7bBnkuATWOP9uuHRx8ejGlCvIYrpQQ==
X-Received: by 2002:a02:9429:0:b0:326:6774:5ba0 with SMTP id
 a38-20020a029429000000b0032667745ba0mr10159858jai.213.1650479106454; 
 Wed, 20 Apr 2022 11:25:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 u4-20020a92d1c4000000b002cc14bf22ddsm6933280ilg.77.2022.04.20.11.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:25:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:25:03 -0600
Message-Id: <20220420182503.768753-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cssselect2: bump to version
 0.6.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index fd892e297f..ffbafdfd40 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  6206ebccfdd9fc02196f60e830fa7b1f  cssselect2-0.5.0.tar.gz
-sha256  d98a7bbdd8ebc46093279195d669a3359bd5a23f90c19e82c19d9eeef333e617  cssselect2-0.5.0.tar.gz
+md5  cb5630e049172f431aeb82a3d504664a  cssselect2-0.6.0.tar.gz
+sha256  5b5d6dea81a5eb0c9ca39f116c8578dd413778060c94c1f51196371618909325  cssselect2-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index b3ddf41fef..0e34059e75 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.5.0
+PYTHON_CSSSELECT2_VERSION = 0.6.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/ce/e7/1333b9042beb33a9bb425900b6d9b59035b98c31c950a323d14ceca1275e
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/68/62/b6a16d0c32bb088079f344202e3cd0936380a4d8cb23ef9b1f8079ff8612
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
