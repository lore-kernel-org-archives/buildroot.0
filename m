Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1D9C433FE
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 09:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7562826D5;
	Tue, 21 Dec 2021 09:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eBjE5bSylW6; Tue, 21 Dec 2021 09:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC2782611;
	Tue, 21 Dec 2021 09:34:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 144111BF83B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 09:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11E084049F
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 09:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohb4qNp_5Y0j for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 09:34:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFB224047D
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 09:34:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so826999wmb.1
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 01:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dvuru5x4MGOt+6GAhp0RSJxK+OLLLF+Rk0cNPCI9JwY=;
 b=QRFz4R0uBreZp1JMnczS6HZDrKlEWd26Mq31SdsNPdYbW1KydFbdsNhx0CYSEMaQTJ
 tZU6Hg9FNJThI9U9F77U2al9upJ2TZYe8ZpfzvqqU5+pGzgeQZ3vTUBZGlPW3G1OObYd
 A+mSHcv4lImOcBaiSI0j2+++p4z2urbiiQsZZ4O/4oLv6iaClbDn4AABNSyw51PThizb
 BUUp/q2cBj0P9C3v246o1abOBIe6Pw9EAWD4pVu7+DyhdADEJ17vKcMmlT8Bu4LjMIyV
 mqOCkYU5TYeSS8V54ziZb92OauIkFPI+J9B90+X/k7HzcXqsmBmPO6iiHSMsOPAoVHCh
 gQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dvuru5x4MGOt+6GAhp0RSJxK+OLLLF+Rk0cNPCI9JwY=;
 b=Nq7+RdK5ZFg+Z0sh9vJlsx/j6Ah196t+clsHsEPshj3/Z+qP/TJgkuSKb0OurANY51
 +q93U8dH1XK2j7nGFhYM+Rq6LO7tgMcb/h3BqaFtsESoIV1nnm2tON0JKYNWTk/ATjyX
 Xtr7ukaJbcHU4sPM8yyFriBsaPqX1MNadF1xQST/OTbH1xrrA1Iz244KZO9++aurYBd5
 ooRSj4LJ+hSmrSxbXbJU9EOCMZ2acqdl1CBDXjSY+1WsZ27t+MBay8AdBQVIjo5ojqLJ
 orFQDlctkEmBHf6n2o0ojAoIBS5VZX1aY+WPHXyubGKmnhgwtH0ySCnb3TPvO3s2xYBI
 pEGQ==
X-Gm-Message-State: AOAM53319QcgpXHVuTNK5s3qHGdisajHc7j/O4Djm0A6u1KLMiY2aDAj
 69eOyl5bZD7bTA7Xvbxqw1A9P7QPCfjNag==
X-Google-Smtp-Source: ABdhPJw42op//El1E3D5nqOwqCzWA24jyh4yVzdj1F+0qQKxAKJp8f+1cmwZD00a1Brq0uW7bMfBqw==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr1843931wmb.73.1640079256827; 
 Tue, 21 Dec 2021 01:34:16 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id d10sm1499122wri.57.2021.12.21.01.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 01:34:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 10:33:35 +0100
Message-Id: <20211221093335.3362615-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php-apcu: fix license hash
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix license hash which is wrong since the addition of the package in
commit 8ddeeffa186d8bce875ac713c1e71483c618842a

While at it, update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/0829e7f1f7a18976363b3e3f79ac9865cd099df4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-apcu/php-apcu.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php-apcu/php-apcu.hash b/package/php-apcu/php-apcu.hash
index 8b286d5ae3..3aae4120d2 100644
--- a/package/php-apcu/php-apcu.hash
+++ b/package/php-apcu/php-apcu.hash
@@ -1,2 +1,3 @@
-sha256 b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390  apcu-5.1.20.tgz
-sha256 c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  LICENSE
+# Locally computed:
+sha256  b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390  apcu-5.1.20.tgz
+sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
