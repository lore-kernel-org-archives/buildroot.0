Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9999C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 679F44076F;
	Fri, 17 May 2024 21:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UzcMNiBe-QC; Fri, 17 May 2024 21:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A2AE4077E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2AE4077E;
	Fri, 17 May 2024 21:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3CD21BF336
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 21:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF8434077E
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 21:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3ny_1Jn3xeu for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 21:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F0924076F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F0924076F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F0924076F
 for <buildroot@buildroot.org>; Fri, 17 May 2024 21:25:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42011507a57so5600085e9.1
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981139; x=1716585939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZYFFzRCSpXk4wQWCGOAf1oM4wCqREgaMVWEg5Yi49M=;
 b=fyqL9rU2VR4+KtRJ4ng9IhZQiBqo/yHh0R8KnQdVDo+FKTGe8mO85XrbYakDptyOO5
 mZ1B8BJlSrpBSilEKYEPATpsoPUizDiWn2FhYydtcUAHTwbB4u7V0Ntd+fsz8at8NEQv
 4P92L2gYBHbGxZ42fyTOh3B9Bh4S9KrwX6JXLa1PucJmnyKOYXQqOHxvaISjJKI4nJK/
 XaPmV70YpNn2O0R1OAT93vLJxxqgjYyGN1SZy2+BVtVs30v1c+YwhWw8Xon2LCJO8hif
 44MOMAtMFSEddl2acgu/HiRuSkFusV+k7NseMnyYRetYoB87HblLIuuSsWbPcjrP7xv7
 bzVw==
X-Gm-Message-State: AOJu0YzpNliuymtAnT7cuVYkRULqzMeC6Dg3feF/xxplLM9nE3oDvSVb
 ZQmOmn9xCxfnNWqt0kiTzqBRgAxLWdt78gbCQ72qlGZTbBaee2dosZ79mw==
X-Google-Smtp-Source: AGHT+IE7pu22IPUGtbFPT9G7K6w9aSKdHvOnhUu+X0M+yLGfv32BjOKf/i93Kk95tZjIZiOxQ0BvJA==
X-Received: by 2002:a05:600c:1c88:b0:41b:855b:5d26 with SMTP id
 5b1f17b1804b1-41fea927e30mr170144005e9.2.1715981138930; 
 Fri, 17 May 2024 14:25:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm321508295e9.11.2024.05.17.14.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:25:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 23:25:34 +0200
Message-ID: <20240517212534.934492-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715981139; x=1716585939; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fZYFFzRCSpXk4wQWCGOAf1oM4wCqREgaMVWEg5Yi49M=;
 b=IPJvLC0l5rTa2kY0xCSp5hhUhzdYtkyC1kzUeP51FfrIuB0y5ZE86Uvs+VtrE0p8p4
 saCLE9q+cLnvpxEiFYb+Hfp2RPt5dixXHAhLtDIfNK3I3PeyYsGhvzQsus1iUnPFO6az
 yIcUFH+o6L/h0NSC2gXYeqXYxaN9GsB3dqHaorjSeNANz17vVfrLh7z9OPG2XoPLG4pW
 U1wmwU6mQg7gF3KLDog4XOHvpK0ZfKZMxwBUOc7kq4sgPzIu3w459FBZHe9ecKpTfKm4
 lfRcVcRS1zCNqbfCZsNTg0llu3VEcvreLtWxmRc9bI3J2PtYcQlYURoAnS8y3AUiZDVe
 /RiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IPJvLC0l
Subject: [Buildroot] [PATCH 1/1] package/minisign: do not strip
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
 Patrick Oppenlander <patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set CMAKE_STRIP to an empty value to avoid the following build failure
with BR2_BINFMT_FLAT raised since the addition of the package in commit
d90ac63d9b3448a239bb9aa8030326699a3fdc3d:

/home/buildroot/instance-0/output-1/host/bin/m68k-linux-strip: /home/buildroot/instance-0/output-1/build/minisign-0.11/minisign: file format not recognized

Fixes: d90ac63d9b3448a239bb9aa8030326699a3fdc3d
 - http://autobuild.buildroot.org/results/9cc9fd17c7eb4a741c08f27f69764df4a26295fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minisign/minisign.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
index 34b3f4046e..7cdce597f7 100644
--- a/package/minisign/minisign.mk
+++ b/package/minisign/minisign.mk
@@ -10,6 +10,7 @@ MINISIGN_LICENSE = ISC
 MINISIGN_LICENSE_FILES = LICENSE
 MINISIGN_DEPENDENCIES = libsodium
 HOST_MINISIGN_DEPENDENCIES = host-libsodium
+MINISIGN_CONF_OPTS = -DCMAKE_STRIP=""
 
 ifeq ($(BR2_STATIC_LIBS),y)
 MINISIGN_CONF_OPTS += -DBUILD_STATIC_EXECUTABLES=1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
