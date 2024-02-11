Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 05:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03139407B5;
	Sun, 11 Feb 2024 05:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mx8PK89plVkr; Sun, 11 Feb 2024 05:21:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125E4407B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125E4407B6;
	Sun, 11 Feb 2024 05:21:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 490EF1BF30B
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 05:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32B2082BFD
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 05:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mznr0_Zg0kva for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 05:21:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A165782AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A165782AA7
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A165782AA7
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 05:21:12 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d73066880eso20748245ad.3
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 21:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707628871; x=1708233671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vw89Cg+V219sRdbvI6seBAhYeZSywHgtxxPqHav3oZc=;
 b=ZdGS4kMHEPYj2NieWfJYo2+HqD7vpWfkcqcu2KNZ8LekEGqBwcECuuCbbjSc5BOkUf
 zfC510eSmZW9sAkY6kdDYUbRtWzp2a11KtedOJQ9Nvp5EoKKB/oMqigV9Pn7BAXvHbcb
 cSDxdspvO7K5gDiP6J1a8pkJMXtWN7ehEKomgaoetihMFsN8AKQKPfcTOiKL1IVudGog
 yebR9rjkR5xevohN65ue4HkDqnUTytHRIfSypSJi0yL6J1tVqkiwueqD8IlTFr2yKX+y
 WDOcywJ2yLIUBabQd662CIK+vSerVYVKojC6wW+BN+itABxuoEm5lpYjDCI6anoT3fuI
 s1MQ==
X-Gm-Message-State: AOJu0YxT8VQpcr/zA8YWiZ95uC5DERh/u34/d4WrtTl8lCCnj27y+tqA
 xm/++zMYQ7PjRF32luKajzRB5/QN8MDBpnPHlXte5964++JJX9/+tNJb6H/pVb0=
X-Google-Smtp-Source: AGHT+IH1PbOuqmWIq5BtGyscHmUDjvVVyA3Ur/i/CiM6fJghr+Mgvm2jdQtzmkkFRar9Q9oXyYWY8w==
X-Received: by 2002:a17:902:ea08:b0:1da:192f:3ecc with SMTP id
 s8-20020a170902ea0800b001da192f3eccmr5644608plg.53.1707628871215; 
 Sat, 10 Feb 2024 21:21:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwf15QRWWuSis/3qoFvwkkTIf+KTOcQZsp27OYoyLNE3NiIeyv2dVRg92pfZWtpId8J6cZ543u8NgXi2/dJbockkV8G+kwFIE=
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 z23-20020a17090ad79700b00296b57ac914sm4461164pju.38.2024.02.10.21.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 21:21:10 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 21:19:07 -0800
Message-Id: <20240211051907.551771-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707628871; x=1708233671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vw89Cg+V219sRdbvI6seBAhYeZSywHgtxxPqHav3oZc=;
 b=j5NlIVvDHJXOHQxijLPaO+z0lVgEELJBfl/AvEpv4735j9vhJBxpeeXQju87hHZSbU
 ProheMvGkJCBDzAMDPYHjc55Z0Mu7T/rrX9PDVAH/q24Ov7b+YGVOLqjQOCsyY+dMX01
 3omR+yFrYkxjpVXDYSW0R9iipZ4e7N91VL0ulAsFWnzmC43DZl+RD+7TMQsHXl2JeqOs
 uR05yfw6VgkmPtT28/NeUDTkKW/UqarKsw7Oh8ECJMom5WDrBU4WgIfIMTiZLHeDMko4
 +vQp40vVUzPjrQmxqu4A/Jzt23dQHN3rak5KjFKUA1vMUHqQOQwfyPSJuvzdDlP7HJnd
 RgSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j5NlIVvD
Subject: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.7
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Updated hash of COPYING (year updated with
  https://github.com/strace/strace/commit/eba0ac1fc4f8896b938d41081e0643cb06283a9b)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 75a35d7cf4..a35d2b0be6 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.6/strace-6.6.tar.xz.asc
-sha256  421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c  strace-6.6.tar.xz
-sha256  6e5648c0ed522b163f9df1dc500c73491b1743495bd78388e99685cecfa79707  COPYING
+# https://strace.io/files/6.7/strace-6.7.tar.xz.asc
+sha256  2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7  strace-6.7.tar.xz
+sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 6279622fdb..f916936207 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.6
+STRACE_VERSION = 6.7
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
