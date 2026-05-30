Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C23CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC44660DAA;
	Sat, 30 May 2026 21:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YIIH9wp4Zhv; Sat, 30 May 2026 21:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0E56F576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176060;
	bh=4nI1n/ErIvBHceG/LLUm4VsboVNyKN8xIgCimH5tiC8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MTMbOpIrN5floN2G3aIvnWrbuIY7ev/NV+BJdP9RN82riJ39EVLfzOIY5/qCf9yfX
	 nI5RS1dbdWNyGD4mgA1RL3e01PA8sDJZ4ZwMoNzsVrbJUF94NR3K39WaDAIXdc/PE/
	 0HZD6g5s5CeydF3oERj9Q2ow6a4WI9LHgLTD/kcH5ofs0kojmV0T5J8Mi3TM1HBx5N
	 tbBniSq6XFpBwpMpAUxiOxTKmSCQzE8EdgHts6pj2HTDqUpxYBWT/jvKUMCXHf3W3Z
	 9Y439M6843UELCmZQKa/BEabDYDDN82txreb6xRBJ6KxvK9yJIjsXdhFv5FKUB2g2O
	 FSEMtsIfg1beA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0E56F576;
	Sat, 30 May 2026 21:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6049356
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C59476F576
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPFb8CcMB9FE for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE8A60DAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BE8A60DAA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB4D0875DA; Sat, 30 May 2026 21:20:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:20:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc3a1bde77a496b5f205e0bc00035c2508c7a931
X-Git-Newrev: 822a7ffc079714a369c1ea5f012cd643dfec3f59
X-Patchwork-Hint: ignore
Message-Id: <20260530212043.DB4D0875DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/stellarium: fix
 qt5serialport dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/822a7ffc079714a369c1ea5f012cd643dfec3f59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

qt5serialport is only needed when GPS support is enabled:
https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L623,
so having qt5serialport without gpsd doesn't bring anything.

Please note that we disable telescope support by default so only gpsd
enables the usage of qt5serialport.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 52c219f5fb..ab689bcf72 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -47,11 +47,8 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
-STELLARIUM_DEPENDENCIES += qt5serialport
-ifeq ($(BR2_PACKAGE_GPSD),y)
-STELLARIUM_DEPENDENCIES += gpsd
-endif
+ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT),yy)
+STELLARIUM_DEPENDENCIES += gpsd qt5serialport
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
