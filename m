Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940DFC27C49
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 16:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16D4F415C6;
	Sat, 28 Oct 2023 16:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16D4F415C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wITCMUBgMmqp; Sat, 28 Oct 2023 16:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E594169E;
	Sat, 28 Oct 2023 16:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E594169E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C42461BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DCDE83CEC
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DCDE83CEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNtR10hR-4D1 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 16:21:25 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A75A683CCC
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 16:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A75A683CCC
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso23398455e9.3
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 09:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698510083; x=1699114883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ln9qhjdDUEeUdqcepJojVJ3Wb8JScISlGmUFBSxVao=;
 b=mNrKFLopPAA3A0p63kFDqaW6Qq5wsvNte6sJukBIbPMvI8t9GEuUvXMq64hh7MuuGb
 gVc9/if5IZPD0NqSXxZCSSUFmbOae5OQ8DbWA9skh+I+koAgQIjyknVm8oNBHyWe90t5
 ZLJZ77OiaC04PAwJcXNmcZ2UmnaCwNATV2C+rDe3mJEqTxJIJ9wSHzfzjnwPNIIdBpm+
 qUiggYhO0N583GKLJFupWrux8yGfj3+y+n5Kf5+m8rkipwUYzMy/lRWyhVYJwCNK0hts
 A1lGhpofW5ftxpEeOsd6GYXgDoS2nxQPvXttNd3KzvvSoT6lOxc1QCzyNt9hbIAqjgbk
 eAVw==
X-Gm-Message-State: AOJu0YysLtAjfrJzQOwq2p6/QBZH3vLCMx1eOnEs3x514WLWDGuHb3ph
 Joeyt1+YzM7KD4f55gl6N7zQVgJv6Aw=
X-Google-Smtp-Source: AGHT+IGGu+qlyMoPM3BZICB2egdd4/wpiE2Dxua8ky3EvqXg+/TOjrQhJKgzOt6vKvabi32AO6n4dA==
X-Received: by 2002:adf:f08f:0:b0:32d:8872:aac8 with SMTP id
 n15-20020adff08f000000b0032d8872aac8mr4548050wro.31.1698510083194; 
 Sat, 28 Oct 2023 09:21:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m9-20020adfe949000000b0032196c508e3sm4125705wrn.53.2023.10.28.09.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 09:21:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 18:21:20 +0200
Message-ID: <20231028162120.260832-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698510083; x=1699114883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ln9qhjdDUEeUdqcepJojVJ3Wb8JScISlGmUFBSxVao=;
 b=VVzJVQhniMnJ85A1XKS8VeEJU1yo75Ovmu7/VIgdycmhbyXEBpI8jNuuT1cAbJKcM5
 ThAhiho+bTqWiL275udAKm/RH8gay6aG9AG/dL09n5MNg2PEccQYOA7gZDJjzvmxxUx5
 GeyIzqypWJ33rKFILl6lFBPF1gixYSXWDs+05FnrBqIO9kWmi8WaHLQTM66M/n31a+JQ
 MKh5D6IL2FuJ9pBqaCpnF1h80GEtpwKUBe5IDEAzUc1uNfGvRcOdxmdVPzgHRld6iOEb
 jE+EYXpkkTKyIUCT91izMV54+gClU2KeQqqt/Xazzx9ohXy4gFVsJDCqOA3QqWxHuIDs
 TF6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VVzJVQhn
Subject: [Buildroot] [PATCH 1/1] package/dracut: bump to version 059
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
Cc: Thierry Bultel <tbultel@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dracutdevs/dracut/blob/059/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dracut/dracut.hash | 2 +-
 package/dracut/dracut.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 34db6af23b..6ca352c542 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24f149d683d188c0d25756529b7d1e5cd6be8028e0c1043110f303d0d706757d  dracut-057.tar.gz
+sha256  eabf0bb685420c1e1d5475b6855ef787104508f0135ff570312845256e0fcecf  dracut-059.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 3eb9bcc474..1de11d208d 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 057
+DRACUT_VERSION = 059
 DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
