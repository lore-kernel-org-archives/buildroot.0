Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505BCC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D96EB41620;
	Mon,  2 May 2022 22:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyRjlMfDlZfC; Mon,  2 May 2022 22:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31B241612;
	Mon,  2 May 2022 22:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A97D41BF39A
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9804660B57
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1vc71aylaKv for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 22:38:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FE2160B3D
 for <buildroot@buildroot.org>; Mon,  2 May 2022 22:38:37 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id z12so8745920ilp.8
 for <buildroot@buildroot.org>; Mon, 02 May 2022 15:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RIekm0A07pITFIITrPOEi2NDMQSzvSupQBd36EevSag=;
 b=GEx3JQDC4i4nDfOnjXbHW2w4PEYlNJ+eb2GmigdPkd1+tIvDGkXhMoyEJGujN/kFtn
 yoc4BkEmQw7JNbGNRX+bLigh71i6QngReEQo2ysQd6Qt978/tFbN2D9EZ2CtMXKt/uk/
 9SqJ9tiIGg9WWVSTPGxbG7LyoH+EFyxdmWM/Puvuu3VQL65L3o+vz4kCjuz0tTUlKF4K
 Xvu/twKQz5iZwbrdc5DJjgbC2zuiiZo57fTCFMsBfRZsc8Log6tirgFT6Yc8LyF6E7mF
 VaCgX9dxKwaBwugoNwQakidMCVq7CsEu3ZKVHSHdYBXpjfqvA8yMt5Dq06veueOvdsLH
 1LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RIekm0A07pITFIITrPOEi2NDMQSzvSupQBd36EevSag=;
 b=cdBpLsK2rUcnt/xtKSD+mb5hajANR+djHIdxVEsHvP1aKlUhEY2OF6d+cPjocWe2RJ
 X1iEc1dkYOCO6iBXjF45v0NBsWUgy3FGCqgLGScMxfV9yp2HMT8Cl5vwjrkCcci7Q0Xt
 igjVYpFxwt+upu6fbylq2qn2zKAE/S+DEAFHA+OFXKEZseEdZ5/z5qQ7tZpD9p4BmnPb
 lVZ4IsszjyiLzu9+qxDD5PFRBRJFObyQKfwdVv1VhnJYaoUF9V+EAuHX9hmyHGf4iWc9
 V9SMjHX9oK57qstajFHfBLm/+1mweKBgWQKdHbQix/rx7wl+KrrtnqFUsAjcWWQ08xNJ
 e1ww==
X-Gm-Message-State: AOAM531QBov44AkC2paoVHL0x6w0/mWdYxO9b5OemQSkUZGmeYYBSJuI
 zKdVXH7lGLg4DN4dDF40SktDyJK5bbA=
X-Google-Smtp-Source: ABdhPJxcyXZiDwxLJERm35YYEIDAfdNgTdR/eDJpFNALpM1rHZ7r6L+lx+H/DuChTuC+XC1XaiPpNw==
X-Received: by 2002:a05:6e02:1d8a:b0:2cd:fa75:6395 with SMTP id
 h10-20020a056e021d8a00b002cdfa756395mr5316460ila.294.1651531116447; 
 Mon, 02 May 2022 15:38:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 w27-20020a02cf9b000000b0032b3a781796sm3429620jar.90.2022.05.02.15.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 15:38:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 16:38:34 -0600
Message-Id: <20220502223834.948086-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libxml2: bump to version 2.9.14
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 81ac3e3f31..e67d3b0b8a 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.13.sha256sum
-sha256  276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e  libxml2-2.9.13.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.14.sha256sum
+sha256  60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee  libxml2-2.9.14.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 5382f28ec4..3647549a4b 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.9
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).13
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).14
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
