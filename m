Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6306C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 09:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE9C60E21;
	Sun, 12 Dec 2021 09:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCIvg6RF-zDS; Sun, 12 Dec 2021 09:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B659760D9D;
	Sun, 12 Dec 2021 09:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B023D1BF303
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 09:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D46B60D9D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 09:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpTnaLjJK5zq for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 09:01:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A058C60D89
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 09:01:11 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso10954777pjb.2
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 01:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOrL7nlBjIYMoyXZ0JEmspY4aPEGdIAvQkH3c+BZTSs=;
 b=bip8WQurBTdjToAt8013P3HFlFIqakUuEoVnr4CEEk7N8JG96zFNITre35m/UEOxiv
 uFoJ8EsMyo8Iaj7o2e3P5wse8+pYtkQs/zmHvOLA4eVMMkUG1/1r7f6OWsf6ELFklO0w
 7KH6qczj8Y2GPqMAZmoT3xVQ4r6UlvlKSzVMseLagmo6KhQsmJr7ny3k3H3OhKndRfWT
 8mFQgQAntKZxbLXlRRA1RMiYSfPf+uMfXcCeDYzhfptm3TmMeugBeDsY3xuQZ3ueOecs
 pBr+wNbYFqGwGcLkBWGEMC62cihKqvhd/nqj7eriIp1s4pYZgWncQ0Jv/oIUrr50+o/w
 8WWw==
X-Gm-Message-State: AOAM532Hz6trqZK9d82vg5cPu11SgPQtDPvTZ1fvUTJA/FNXzSwzbbhe
 tsM9l0NuYko60N5G1X8brt07MvYDP3NX0A==
X-Google-Smtp-Source: ABdhPJymlaKFC2Cw4Vv4KdpANOMOoiHaqyHj1xluAlC2rRl3SYTdsVvHAc7GCIXy0QdDPfOqETFdYg==
X-Received: by 2002:a17:902:e852:b0:142:19fe:982a with SMTP id
 t18-20020a170902e85200b0014219fe982amr89358303plg.13.1639299670794; 
 Sun, 12 Dec 2021 01:01:10 -0800 (PST)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id p12sm4545985pfo.125.2021.12.12.01.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 01:01:10 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 01:01:07 -0800
Message-Id: <20211212090107.2975294-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.17.4 (released 2021-12-02) includes fixes to the compiler, linker, runtime,
and the go/types, net/http, and time packages.

go1.17.5 (released 2021-12-09) includes security fixes to the syscall and
net/http packages:

 - CVE-2021-44716
 - CVE-2021-44717

https://go.dev/doc/devel/release#go1.17

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9031c33d8a..39f8226aae 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
+sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 59177e54db..0d9ceab2bb 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.3
+GO_VERSION = 1.17.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
