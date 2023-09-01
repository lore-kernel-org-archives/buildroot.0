Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C261DCA0FE1
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 14:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390F94199C;
	Fri,  1 Sep 2023 14:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 390F94199C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1I6vB94-I14t; Fri,  1 Sep 2023 14:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87E4C4198E;
	Fri,  1 Sep 2023 14:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87E4C4198E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B47B91BF3ED
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D7E960773
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 14:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7E960773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4JXs8jbwZSP for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 14:48:42 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29BFF6072A
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 14:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29BFF6072A
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40078c4855fso20051585e9.3
 for <buildroot@buildroot.org>; Fri, 01 Sep 2023 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693579720; x=1694184520;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8aoVY1kFbgF5sgCEJ9s/val4L390PlYCOyw/o3PJx8=;
 b=MWo0hC9iHr9UW9G3iNM0ENjypsvR8keTQlhcPXOMb7Mr+mQo2XkWkNFnVIgrZJmwi6
 Z06eqeWlEp41L37kfb3I6zscuhUI6dHFjbceAmqg1lfw3xdoGqzeyGjBXUJzqJUuZjLS
 Vb2Sd7VHKnNPSddlznMZvQqQ7TfeEOsSI0bfX0z1OeyvjvF2yTNUjOR6vnvr8sUGrEJs
 x+xwKwL/HkgSa+/cpesDgyu8vDcxcKbo5EMQmpY2Scw5sDALpkfW8/KHqMbF/uIk+aUi
 UAZh/i12X69nJ422DkRnFN+74VDACDB7n/vqpwLd9TpHNHG5lrRf6RkEscapvjiUklVA
 r0lw==
X-Gm-Message-State: AOJu0YzWzRPSxb6Wu1o0E0XHHJzy1FjhAOiTO54VVRsbiNes/8i6ZNXV
 GWijoKUzmgS0GWHDH880o3YTstwu4X9UBQ==
X-Google-Smtp-Source: AGHT+IGFAc+b5XNgYmXhKcqpm3iHOCDfSTZz0mG2zNnlNYFvFPieV2fbBJ6lJyxZ0UlUCbE/VCan3A==
X-Received: by 2002:a05:600c:2283:b0:3fb:a102:6d7a with SMTP id
 3-20020a05600c228300b003fba1026d7amr2073159wmf.28.1693579719453; 
 Fri, 01 Sep 2023 07:48:39 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 e4-20020adfe7c4000000b0031c6581d55esm5458289wrn.91.2023.09.01.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 07:48:38 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 16:48:36 +0200
Message-ID: <20230901144836.425829-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693579720; x=1694184520; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=W8aoVY1kFbgF5sgCEJ9s/val4L390PlYCOyw/o3PJx8=;
 b=qvly3MX1b/IIv35WiuRj6eM69zhp3UEPtcI2DdDuL+tsIvLizD0oDvzUHkd0T1O4vU
 ceR7P6Qzh5PhYTg0QjaAV3A1P7ZwCnBMCszQg7HW4jtDrVCY27RWSbPmzqMIqQNZCHAt
 HlZGPhjnmocB7lgTLYGnD5rlh7sb/jcKLqIgdvgu5Chs4mz0Yzso+9J+8njG/AhZ0olt
 QM+sWyxZ/tDJn2zyyBx7Ks3kkVsHInGlI0Rj7prILdCqa0DZEK6qQUThvhuWQ4ggKcfz
 PbPshGVcGDFhHek8+wZuL1DWIYHY7ixXGJ5STZnTIow8CArdDt6kk9/MckND/SKq8pLk
 VQEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qvly3MX1
Subject: [Buildroot] [PATCH v1] package/lighttpd: bump to version 1.4.71
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
 - https://www.lighttpd.net/2023/5/10/1.4.70/
 - https://www.lighttpd.net/2023/5/27/1.4.71/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 29bf5124b6..a86ebf2f68 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.69.sha512sum
-sha512  9d174c8e0a192b4eb8218a9f76b0bd42f90030228600bb7bbe35ebb9e7bbaea36ee2732535c5cc6dab171294817837bfa26074ff84a37832dd89f57488b4071f  lighttpd-1.4.69.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.71.sha512sum
+sha512  c1388b563b9cf9dcab0a57bec42b09b2cb5e1932bc137ae5f957d1bf3932ddd8f5f188002a7b9a00f0a92ba3779b21ecbea2ccffa91e686b6660c9cc455d6598  lighttpd-1.4.71.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index ca2035b6b3..bc0dbcbf45 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).69
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).71
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
