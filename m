Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96FBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 10:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAC4402A1;
	Wed, 16 Mar 2022 10:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnnOhOWZUwOJ; Wed, 16 Mar 2022 10:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A66EB40271;
	Wed, 16 Mar 2022 10:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71D131BF3F0
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 10:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F6CC8433F
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 10:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyEhhz4alGBf for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 10:58:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6811484331
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 10:58:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b19so2352954wrh.11
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fxztkeegCf9uGT6aFKMG3Oy1yGLBbeDLTQUCvPMEw60=;
 b=WZEGH1lAHC7HyrFABK9AVsRlz7OLHTEU5UhGICkM5nq6KMClHj+59F01w+2n5d3Vpk
 ctwWETYutILtISnKTjqBC0Lvy+fK5a1RVv7kn2wkT95Ipe5keLAsGQqItA/Gxmgqj5C4
 KPFZPtpPzrKAj3+kanwIHWx14jF6/FcxSVmjNqmXcKaotA3OagrYMng5gvXbN5rP3NZG
 En0k0bszU4mABStnLbLlBHGQ/joz+BTgg0gipsDq/UiCY/AtPJ+289mF1T22Ao9sf4h5
 XLcMaAFqKZ4oKWi+blSdqupBRTIQyqswWBvsbqFjTcU/RSeWf+ul1qnRyHofRe5PK3yd
 iX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fxztkeegCf9uGT6aFKMG3Oy1yGLBbeDLTQUCvPMEw60=;
 b=f0lVC4glsMto10wVPNLKUuawEGsZ8nrkfqwD6e9mqMbYf5ieFB6pmyZC2/oOYhiv1+
 /JDaJUJgwcf35IV09V5Crh75l9X4w+k21HZJ9ZlLHWeYW6e2mw1dU6VxYklXM7zGVdMR
 iPBt1Ul1cxPjPF3DlpXe7HARspPPyuutE+T0WnzY686sqEDRpUJu2RQbOOBFAAIn7zVU
 BhpIJzePFIJbVfUYF8DAd2Uw8HwU9s8XQUC0cU/1uHB4zALIe9sMYN3HVaaSK4sA0Vqp
 LifT2/jYeHiO8hYoDsKdsu+HKGhgVKC0VhU0W5OtEEffN89kY2ZLUtNPW7Y3BXJO7vCR
 f8RA==
X-Gm-Message-State: AOAM533FDHP+uvJiaigQoqvgkh9FlwLsZ+y463D3gpoqcfFwa57Ek8pe
 WbmxdBiMzLMDJdBrLJjdPNkQDuqw8SI=
X-Google-Smtp-Source: ABdhPJwYWJEYsvMgkXwG90vQhF9QLV86AiX7GuvuDhcd/0kNf3ScxnMtg3PWtE59RhjCjWqKTAFw3g==
X-Received: by 2002:a05:6000:18a2:b0:203:d2fa:95c9 with SMTP id
 b2-20020a05600018a200b00203d2fa95c9mr5878913wri.554.1647428290412; 
 Wed, 16 Mar 2022 03:58:10 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1417620wmz.43.2022.03.16.03.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 03:58:10 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 16 Mar 2022 11:57:53 +0100
Message-Id: <20220316105753.1134088-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: security bump to 3.4.3
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

see https://marc.info/?l=openbsd-announce&m=164736531714549&w=2

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 990ec8bda..e92399871 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  cb82ca7d547336917352fbd23db2fc483c6c44d35157b32780214ec74197b3ce  libressl-3.4.2.tar.gz
+sha256  ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d  libressl-3.4.3.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 6eee86dda..0bb468ced 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.4.2
+LIBRESSL_VERSION = 3.4.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
