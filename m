Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5163DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E5A361200;
	Tue,  6 Feb 2024 13:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E5A361200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2K0XDMY_GbGw; Tue,  6 Feb 2024 13:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5784E611F4;
	Tue,  6 Feb 2024 13:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5784E611F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19F861BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E540B41E73
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E540B41E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nlU5O735jm6 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:21:54 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15BB841E6E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15BB841E6E
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d0abdde3easo26040811fa.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 05:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707225711; x=1707830511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgjksmOrOTrnCXyuvaoQWjhuJysJtT0g/8g9h6556QA=;
 b=THrf9GGE4gDlLWyPEDbrdXKmF6IsxkCZr247CMpu8Bq/BAqeAlW0MdQk4EI7gYRqqg
 /YVTwTHQt2gwyqW6Ewu0gpFcCfSYQaaROc8nTus+Gab3ATJnsxoxvixzCl+S8c6uBVPS
 2SB69vZVVNoBozm2waQGGO1oqyDZMP2h28JSDIbGVZ283YaL9IFbUeO6yBAo8aczjmh8
 y5PRJTePECDD3gOWFnWYESspqQXotzN3/M1klzy3MW39ZF5KdrpyR8qySEUlSw5sng5L
 vZxgSxOCvEv9aVYmTJFmrPC6sMZIXhrmw+JibrsV7XfOjZD3pycA9LvDo6YnOTWX7v97
 H2Dg==
X-Gm-Message-State: AOJu0YzrIgtRYsu3v63B0fDhyQ6lT1obzaguEWB1WSr281SwXcLGZ9+x
 lPJoDihJ2TOfSc2fVlAsn+tP0ZyDL8oZ3A22530s4JbLOaf8unumndSDQVAJ
X-Google-Smtp-Source: AGHT+IETcx2TMvuWCkLGQ+Geyym8rMfYeH0ZeUktUqlLhHuKEDPGOgCnhZgVqgzMcq//PttYSpqsdg==
X-Received: by 2002:a2e:9417:0:b0:2d0:b2e6:1133 with SMTP id
 i23-20020a2e9417000000b002d0b2e61133mr1847445ljh.24.1707225710529; 
 Tue, 06 Feb 2024 05:21:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVcwi1kuCUtv5fpdeOr/gE5ZxMrXzrLaJZrkrmJWlpekp6xISTAZTYMxbxU12RKvjarJHyZf70Q3L/+jI+s/iCYlBrEEBUnfb9WLA==
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 g23-20020aa7d1d7000000b0055f0f643ebcsm1017966edp.96.2024.02.06.05.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:21:49 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 14:20:51 +0100
Message-Id: <20240206132051.2838897-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1707225711; x=1707830511; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hgjksmOrOTrnCXyuvaoQWjhuJysJtT0g/8g9h6556QA=;
 b=mzgOYUhQ5KYcpvqxPfQTIzvYS9BowyGoyqsllA+wCb96Rc7FF9VRG3cwAPbBBEAp3V
 V1Kg5ir88/6d0Kfhuvm9xT6YOndQVfXLCyBU5awIEv6d5LRgNvIOpK2ppQ0cPo66oCJw
 Rk+mwgH9an0u7q6REOQiZiKPjRd0DochNLB9l5zNEHOQZ3/ON3TYA9tMgJhB6AcLo5oV
 OI4bR2uJYzRK8UJFEbp+PfNfXB22hxIsWCyFTYrJQqIJyv9CUa5hw9h5C8LPi2uee76q
 OUkhymzenaYYmWvM4NCUwhliJlnaNGb2fpA931yTsJlASXrQDmCQa0rMo2CvSagAA8rd
 FcMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mzgOYUhQ
Subject: [Buildroot] [PATCH] Create a .gitignore file in the CANONICAL_O
 directory
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This .gitignore file ignores all files in an output directory and
hence doesn't change the git status.

Remove "/output" entry from the main .gitignore file as it is already
handled by this general approach.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .gitignore | 1 -
 Makefile   | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..14b7ca5040 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,3 @@
-/output
 /dl
 /.auto.deps
 /.config.cmd
diff --git a/Makefile b/Makefile
index ac625152c6..86d4444745 100644
--- a/Makefile
+++ b/Makefile
@@ -63,6 +63,9 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
 $(error The build directory can not contain a '@')
 endif
 
+# Create a default .gitignore file that ignores everything
+$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
+
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
