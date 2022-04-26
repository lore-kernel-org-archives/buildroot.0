Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50029C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F0860EA2;
	Tue, 26 Apr 2022 17:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoLAfHybYleh; Tue, 26 Apr 2022 17:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE17960E73;
	Tue, 26 Apr 2022 17:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7B011BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B572D60E73
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zl42TZVA9zE8 for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:41:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D725660E38
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:41:40 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r12so21083235iod.6
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LAM6nQQ/SJtRc0H1WE4y+YldUl91qwdGRzZF3maBvgE=;
 b=cOd1vygXBEk4pebMTIDiddprDAcLe/2hLqlSIYmIO0zEmdeY7C3IBCZE0ecK3dUnGb
 49jA3xVT8b7bqLj9DYtxOh/ffw64PgOoGkOoWrfSnv8EbEnOJI+s+o8kiyCsSbew6MJw
 JNZVg7YYlxzX3k0oLw2KdOqFDFKAqPyCQzkIc2oHhuGLc54Nt0DC8UusJ270Sq6fCBna
 L4FBCcMv0mMeBXuwR0wRoxo1zyVn34YSQwuicqUyiHp3BPXx7Y07viu2T7F/I/wW6Nrx
 Gatlx1kW83fB+0cgzyAybz6f+OYfm7OwPxkLYqX4/OO4pcCywJUKphpIIiFgtbZI3UT6
 afCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LAM6nQQ/SJtRc0H1WE4y+YldUl91qwdGRzZF3maBvgE=;
 b=HX+X6S+5qKp7jSCqxg4fowRTlRUbDazFyAsuVkgUtVukajInKZ6T4OjKdQIlXnSGIa
 /F5dPWWm6SllHZOIuIhQVOkpxxvW3UxC/B2VEHphlY5xDhfeRJpZ0ULgbxD+Rjmm8XOe
 keanPlNQKJOsd4igE/MciVnU9fnT1Sd6LaC/hvjwN/gMEJvtDAf9uSHSngcWh+NCqVic
 CoqBh12j4REj5SbgzZbdOuZJS20uXVZeLTYi3k5agWq7eCnUb4WmRWzUMT387qqrdLGh
 N0cyIi3k3rEPSuwKRPSwuJAYrZ3vO+s4GyBbP4imCTqymXj5UOPm4Nqg148akEgng4MF
 ++yg==
X-Gm-Message-State: AOAM533fld14f9QNzQxCHCOsHWiMNomnKl3HZ+vFjeUbx7MeRWlMHNXA
 FAyPifohjVCkokQ9MGSorUCroaolPiR3kg==
X-Google-Smtp-Source: ABdhPJz+PEy6jPD9V40CU3/MLjdRPLI9LFJHVoSm0WYr0vWU/GT00nTZkqE2u0mxt/pTFp6u0Tx6cQ==
X-Received: by 2002:a05:6638:6a7:b0:32b:1019:46e with SMTP id
 d7-20020a05663806a700b0032b1019046emr776158jad.112.1650994899719; 
 Tue, 26 Apr 2022 10:41:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d9ec2000000b00645ab33390dsm9452833ioe.9.2022.04.26.10.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:41:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 11:41:37 -0600
Message-Id: <20220426174137.3014322-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wilc-driver: add missing
 BR2_LINUX_KERNEL dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.net/results/40b/40b8aa0c19917f64c3f272f5479068e7631ffcc3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wilc-driver/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
index caf46ae281..6b93a23a47 100644
--- a/package/wilc-driver/Config.in
+++ b/package/wilc-driver/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WILC_DRIVER
 	bool "wilc kernel module"
+	depends on BR2_LINUX_KERNEL
 	help
 	  External kernel module for WILC1000/3000 devices.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
