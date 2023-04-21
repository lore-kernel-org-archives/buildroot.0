Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D898FC7618E
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 18:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25AB660D79;
	Fri, 21 Apr 2023 18:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25AB660D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTCNzNEbMItG; Fri, 21 Apr 2023 18:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463B760E8E;
	Fri, 21 Apr 2023 18:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 463B760E8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 625C11BF2C2
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15A89428A2
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A89428A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joxZ_BhxYRPt for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 18:31:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE29D4289B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE29D4289B
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 18:31:56 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7606d948295so60101339f.3
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 11:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682101915; x=1684693915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FL0r+CAi1wuIZLbtm5VYVYmF2G0s/VBSeFQwuu8GA+4=;
 b=kOmtEaC8KGIq8pl9j0YwjxCyTgf2vJBdwI9cUV2pgIXkSkfPBg6/dPs4sIFf8duv7n
 //pygzatni8Nk2m5IFdMMh+fsk8THM0B+wy/GFoiIGd0ya9S+7IrY9z3oPYs1r5dsD8L
 aSnQHvnhBtm67Np5gJqIjI9q9NkLqV2ICj1E7nXhhd8oLZZohVCpPMg+WwF+daFKRjAb
 a/8155SBFbX11jwxeUnd1aAxsGKhSoHFIRNH928ZgzDzhZMQM4VsmvF4wwz6nczsoAqF
 Jv91XkzndaM+llLFmWDppOKxbkZkBCPviMLolnTSTQsohNh8jL+gjpiqhXdhXbCdA8Ki
 o0wA==
X-Gm-Message-State: AAQBX9cZU6Wc7fxnJOLZdsgdSdPk58RdpKSFxjJKDIGNjfp340UM/yEs
 VVvJo/Yh7W4LAxM1vgbBVLJjVwn4C+o=
X-Google-Smtp-Source: AKy350YfSGqJVfrGxgzUjFBZ8y69mid0MLkI7XgSfviYWF035INLbDVG6ATJolulXndno64ov1vq+A==
X-Received: by 2002:a5d:8e0a:0:b0:760:f098:2c6 with SMTP id
 e10-20020a5d8e0a000000b00760f09802c6mr4490804iod.20.1682101915480; 
 Fri, 21 Apr 2023 11:31:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 v3-20020a05663812c300b004061dfd9e23sm1473176jas.19.2023.04.21.11.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 11:31:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 12:31:53 -0600
Message-Id: <20230421183153.699758-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682101915; x=1684693915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FL0r+CAi1wuIZLbtm5VYVYmF2G0s/VBSeFQwuu8GA+4=;
 b=edfUefHaKIOo7f1htLxXWC/hyoHkzzPa2zvxiYFW2lD5EgC+azkPGkX2XRQsS3nCiX
 rULvSaQWC4JjLzv+CIYFj5k6aTgc4PhIVMsDnlbg8pVFwXFiDxzsIBaUseJRaPyxo3QK
 aIa8TJS5VcUiTfSXjkY6FHeH7ZAgHYfschxj8jixja6c86TF6JJQJdFgVVXM+PnIZbMe
 0ndvoGyxRXpgIA9mqKgMYB2thOw3rYxpNaU+MvsiqjC6FlZWPHFqIQlnnS4WoQxdbluf
 lt+0uMzOTNh6GKFA8cXoza0fRkH61oHA+n+XL2BfuauLHPl5Brbcnem+u1siAFNXz565
 j+0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=edfUefHa
Subject: [Buildroot] [PATCH 1/1] package/granite: bump to version 6.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/granite/granite.hash | 2 +-
 package/granite/granite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index a91f468b49..7dfc008dcb 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c62d8d29e8bb59a5fa2d9006a9c13196aea9159410a7c86e3d51fa10d0f9dcc0  granite-6.0.0.tar.gz
+sha256  067d31445da9808a802fca523630c3e4b84d2d7c78ae547ced017cb7f3b9c6b5  granite-6.2.0.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index 71dfbf4c03..d5e6b9f47c 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRANITE_VERSION = 6.0.0
+GRANITE_VERSION = 6.2.0
 GRANITE_SITE = $(call github,elementary,granite,$(GRANITE_VERSION))
 GRANITE_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
