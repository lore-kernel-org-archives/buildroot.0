Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61F8C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 831596157C;
	Thu,  8 Jun 2023 18:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831596157C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QavKvif6jn5g; Thu,  8 Jun 2023 18:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD5986155A;
	Thu,  8 Jun 2023 18:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD5986155A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7F91BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A3F420B0
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A3F420B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rg4Rhx2rTbI for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:09:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D60420F3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09D60420F3
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:09:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6d3f83d0cso8951085e9.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247746; x=1688839746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hcXFbsCTahnT83wqMhssE0yzlSJv8lVj9uo/3MQ+w8=;
 b=Mkw106gd+L1mffizIQGmvBvl0p1brp49p4WThHGf3qxtz8RZSRM/ZhTtQpIo89tQ/u
 SfuLbsiO1xp0u7zwBBUs5mPUtvQ7CkVXBrVFNarncQKvkeIyshflAMgf7kVY80nQKR8f
 7dgHV+WQYie2x951qare14MqDW634JOEqgUEsTXrimdK3a7PkNDHRYfpzlWTE0ZVl5d+
 4gAt1ozmnRqpONHPHw0GyUFsOb3PRV6+/2DPKP9mTokWFp1vzjJb29ZObuia7USiB1U6
 B0VUel1WT8H0OAue5ezOf0UWbLcfj5h/fjgyX+IXBdGTfT7JOGnlKKRxXOw/KfTPSOkb
 1FRg==
X-Gm-Message-State: AC+VfDxkAc/iB7TJZ1p+hnmSp/xXxuT/lKzHQdIrUq8LHx6cNWge9jdU
 HcYquf6BAvBGyXD/TSP6+5HEzOZrHnA=
X-Google-Smtp-Source: ACHHUZ5ofin6n5Xu1VQZZvzzh9M8gK3vIHNVoijKKIyXze47OEMTT/NoQIkUHCRO6xfiu7MUS2q1kA==
X-Received: by 2002:a05:600c:3645:b0:3f6:692:5607 with SMTP id
 y5-20020a05600c364500b003f606925607mr2106958wmq.40.1686247746165; 
 Thu, 08 Jun 2023 11:09:06 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:09:05 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:44 +0200
Message-Id: <20230608180844.189528-16-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247746; x=1688839746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hcXFbsCTahnT83wqMhssE0yzlSJv8lVj9uo/3MQ+w8=;
 b=bzI/WrLkaAcO+IDsJQK5LiwZ+Dfb0ufMAauYeN3ykId+Sb8IgeUIcbVUakVdrjt2dC
 VeSojN/ZN2W1z3NEZyTf10GFheySM2HJEkiavSUhExjAqvK72C+1PEMnEHqjvLmhc/kD
 FsYkyezOdFF96k1tSho4A/4RojEFfF/TFowvJoe8SWgBu1h9orM0IDXC19JduuhyWpHS
 NKwwuIKiMoO0HPVyMKWicvP7KHjkPk9d9untE2lPpxZmANBxXNNQt2R28i9C0OxUhgIp
 Dwb4zbaPnqfQ9qbZXmy6Te/4BoC8+m3cREf5BYaZGbIZSfVkiSadUOe2YBEjUmWD4zxr
 mbhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bzI/WrLk
Subject: [Buildroot] [PATCH 16/16] support/testing: TestZ3: use basetest
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The base configuration now provide a glibc toolchain,
we can safely switch to it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_z3.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
index 71b074a587..30794a250b 100644
--- a/support/testing/tests/package/test_z3.py
+++ b/support/testing/tests/package/test_z3.py
@@ -4,14 +4,8 @@ import infra.basetest
 
 
 class TestZ3(infra.basetest.BRTest):
-    # Need to use a different toolchain than the default due to
-    # z3 requiring fenv.h not provided by uclibc.
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_Z3=y
         BR2_PACKAGE_Z3_PYTHON=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
