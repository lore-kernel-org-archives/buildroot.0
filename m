Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891FAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23D5940368;
	Wed,  9 Feb 2022 19:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjZLAioGOYJz; Wed,  9 Feb 2022 19:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28644401B2;
	Wed,  9 Feb 2022 19:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB211BF27C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1944560A81
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8jGKFMdm9Ug for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:59:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A68C605E8
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:59:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id i19so729015wmq.5
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFH3+cfeTyXeeWziDerar7rTDAJPIREGBihQQuY3HiQ=;
 b=Nv/+HD1BGtFwnnoswyp2iP8IMYyJnt76EjeJUXBJCdEPfrJzTU04i4uW5yt7eilSUN
 5hzlTGVIunGJijo5LDk8xAPy76tmBLBCOwefdba40lBN1E/FpigJe1RmTHc21qf3wWQh
 Rp11ziuaZ+b4joXMWFicFacXeQGYJ8Mnk95aiIF4erir3iWe82Da8N5YT+/VZqFae5av
 R/fOq/4MdEs1nvXwia0QBh7QsenxG0m5NvjoYrVLVyfGscAjtI0txnjX2KNtB3ZfXfnZ
 jeg1/JEimueypA2D1FSyGPCwYoYxxaZjaZbyr1r9TiLl3ZNi84P1MWg2R3Ysq1PM4tC0
 zDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFH3+cfeTyXeeWziDerar7rTDAJPIREGBihQQuY3HiQ=;
 b=AKBOQqqKyV+SmNttZNfQdoN8pKe9qUma16tWCkY70JmNO9hIoaIqAP/0abeiTEOgYH
 7h2KlXp015YE8+/NGsiPjOHgBulnGxfycVaKjURMD0ziIWOLEoWl+IsFVDoiYIF92mli
 heEyrohUBXLI4hF8ntQKRwZW0AQLEK7+BLSoKF65r1fbHjiNi/rf0AkiqYwxTTeWZyYV
 nsOdDY1RAi0s0uWzS2SJg8IISUkhNKLBJPqDlpgPev8o8O8UHdwIszmwnQMb7EFmg1Ke
 eQVgnTKvFAfajx0QpgddoXbPpJoIIETuUabqmWB6Eihw6GTue6qmW3CarCbTX+eIMun2
 CWAQ==
X-Gm-Message-State: AOAM533iyXounMjm+OipjUlaVYkkWOkL+gBGSNBwiYjDOYulefidBfkk
 +L3ZDkv9K2j9jKFvXumVv4G9f8C6mko=
X-Google-Smtp-Source: ABdhPJwrWwQzSfkTVdp31yTf58I5zBhDG3LymjcM3FArjS7fMNKG7h6pRv2htYSlD10WxL/i7QUEXg==
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr3550685wmf.133.1644436742134; 
 Wed, 09 Feb 2022 11:59:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i15sm1760246wrf.58.2022.02.09.11.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:59:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:59:30 +0100
Message-Id: <20220209195930.349179-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fping: bump to version 5.1
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/schweikert/fping/releases/tag/v5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fping/fping.hash | 2 +-
 package/fping/fping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 0b2233f379..4671cd77cf 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ed38c0b9b64686a05d1b3bc1d66066114a492e04e44eef1821d43b1263cd57b8  fping-5.0.tar.gz
+sha256  1ee5268c063d76646af2b4426052e7d81a42b657e6a77d8e7d3d2e60fd7409fe  fping-5.1.tar.gz
 
 # Hash for license file
 sha256  6051b27e4b4a648f7bc8b329024da53a6e95ce88fcf0ccc259c371a74b741757  COPYING
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 0a03c1dfdc..5986d05b93 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 5.0
+FPING_VERSION = 5.1
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
