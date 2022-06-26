Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 12:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1124260E83;
	Sun, 26 Jun 2022 12:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1124260E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6S2Bfg9D65s; Sun, 26 Jun 2022 12:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA12605A6;
	Sun, 26 Jun 2022 12:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA12605A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABC631BF2FD
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 12:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85F7D410C6
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 12:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F7D410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywWPScIT6eRv for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 12:38:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE17140E47
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE17140E47
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 12:38:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so30647wmb.3
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 05:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/VUBu8Sipk4UIm5glv6NkiG0qE3u67xh/vH8DnVXmg=;
 b=15sRpvGRzfz+pHsAr/QBZg/+9FcrAGULKwqtlyjV+WSATkNa2N89ffOhgca4pAa0ut
 8dVDmdjYLsB8HpTOHG5AL/2jll7V7IXi1Wm0tpLTqa6eN7+aLdDIKQ9PTcAP5hdHo4Og
 uIELj5/ux7TZGhY5YPt2k/SkqX5k7CdHddrlXydrlKoUOxEG7Avk3vIWaUrd72nkcpB5
 BHxcL7PouSgn5ZIS/Q9U789Y93MXyIHVsvlA9iyStu/XiKEQCvs7V0TdpWEkLRpJXG2J
 Cq/+REqmOFQKZ2+9BNca8VYnSbnSgPU3Lc5nsM0XdU8m8n1PNCZ/h8Je3atHoE3h/Yrg
 RReg==
X-Gm-Message-State: AJIora/CQV+0+zTYa64M9szEZLK18g43ARx8nPDUOv4/9DwVCENgwt22
 gqZSDGHiv2c0qCk/ivLf7c2uEfwVATo=
X-Google-Smtp-Source: AGRyM1utbzbXdk17eMwYZaptJZnc6mzgyHaLnB2hhxFhUdmGuY/y1IP/f1aAX9cFNtCqMsW4XAToFg==
X-Received: by 2002:a05:600c:4fc8:b0:3a0:3ae8:449 with SMTP id
 o8-20020a05600c4fc800b003a03ae80449mr9569139wmq.26.1656247100664; 
 Sun, 26 Jun 2022 05:38:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z4-20020adfd0c4000000b0021bbf6687b1sm4607395wrh.81.2022.06.26.05.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 05:38:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 14:35:08 +0200
Message-Id: <20220626123508.1543766-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/VUBu8Sipk4UIm5glv6NkiG0qE3u67xh/vH8DnVXmg=;
 b=JwY/JoKMvf7KATMsjI95L5DEcEhxIxLK0KkkarlyXEwwMLVm2DGWJK+3MK71eIY7pr
 00KDbuM4KycKbuT1DeOBStEbOnMQPVsBrihcsVPffgg060HqVle28yvGUJen4y2NedCJ
 4gIDS8ha36MtzbDQDjYGMs4lFPFMu32ZPDYzAUcQ1NTy5UuCq38QbZuhJ3ibbRQcww2A
 6DiGnqu+RxuObLN0c+FU00n+VlSHYtgKJMJ4Nq9fn3/v28jxxpCfliXSzN36Z5WiFPil
 NKBqR6ZYRUJBX6X35YblAaD5J7LRjxhz7udAMI9WjEBMH1EnH0Rr+ho+A7WCk/1OXjXZ
 ONfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JwY/JoKM
Subject: [Buildroot] [PATCH 1/1] package/cereal: bump to version 1.3.2
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

doc and examples can be disabled since
https://github.com/USCiLab/cereal/commit/6e1c66a94cfb2dd7d726afbe270681b7b19763cd
so set BUILD_SANDBOX=OFF as BUILD_DOC=OFF is already passed by
cmake-infrastructure

https://github.com/USCiLab/cereal/releases/tag/v1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cereal/cereal.hash | 2 +-
 package/cereal/cereal.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cereal/cereal.hash b/package/cereal/cereal.hash
index 18889b4d42..1ddb504a72 100644
--- a/package/cereal/cereal.hash
+++ b/package/cereal/cereal.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  65ea6ddda98f4274f5c10fb3e07b2269ccdd1e5cbb227be6a2fd78b8f382c976  cereal-1.3.1.tar.gz
+sha256  16a7ad9b31ba5880dac55d62b5d6f243c3ebc8d46a3514149e56b5e7ea81f85f  cereal-1.3.2.tar.gz
 sha256  58604a126af6a671ea390ee3d5b3e42228aa59b2858fb7af1d5b20b31739ccbb  LICENSE
 sha256  d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
 sha256  7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
index a44f09c743..6da7df9360 100644
--- a/package/cereal/cereal.mk
+++ b/package/cereal/cereal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CEREAL_VERSION = 1.3.1
+CEREAL_VERSION = 1.3.2
 CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
 # For licensing, see also: https://github.com/USCiLab/cereal/issues/609
 CEREAL_LICENSE = BSD-3-Clause (cereal), Zlib (base64.hpp), MIT (rapidjson), BSL-1.0 or MIT (rapidxml)
@@ -13,6 +13,7 @@ CEREAL_CPE_ID_VENDOR = usc
 CEREAL_INSTALL_STAGING = YES
 CEREAL_INSTALL_TARGET = NO
 CEREAL_CONF_OPTS = \
+	-DBUILD_SANDBOX=OFF \
 	-DTHREAD_SAFE=ON \
 	-DJUST_INSTALL_CEREAL=ON
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
