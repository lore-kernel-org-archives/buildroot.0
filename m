Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F2CD98F2
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 19:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10AA6FC70;
	Sun, 21 Jun 2026 19:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLAFOTZL4XBD; Sun, 21 Jun 2026 19:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A04C6FB13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782070734;
	bh=PqP2/H+ZWSpvYINg3bhnkzo2kb9Z86cI3VAzPSYQTAs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eHoVPSGeQe7hA3yHSN3oeVM3gmjZiVrT8yCDIXAwuMedjR2bDlFeYIClTeQ0EXsEt
	 1xEmYe3K+PWaf2BrJR9g+yE8IOL/Gyq24Anx46jkvaH1CeHPOag2BooCvZuOpLQmn0
	 UKv/Jcfx20LM/4UtmVRjVR5RMGUpEESVTxOYDcD7/kXsa3MsoGgzYfYWX9Ld8yhQUT
	 B6apoXMI80o5tsmpBEN/GV0jhznkt5NDDu0Y9P0ShwoHZQ8MmdSxgrycCPgnEezyPi
	 vB9bD4J3vgyRAyZOXCsu9yBmpeku2DvOjZTBb4cgLhJSPNTmXpWZsgw6GGf5W3M3bk
	 xbl6RRb6Tiuxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A04C6FB13;
	Sun, 21 Jun 2026 19:38:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 870DDF4
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A714014E
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9m3c8GegkXh for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 19:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98AFE4020B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98AFE4020B
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9CEA838E5; Sun, 21 Jun 2026 19:38:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jun 2026 21:37:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7fefa678beb44338bab6695477946ba97d9b896
X-Git-Newrev: aed60cba39aa2e3e189f8520412c807bf7fcb768
X-Patchwork-Hint: ignore
Message-Id: <20260621193827.E9CEA838E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.16.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aed60cba39aa2e3e189f8520412c807bf7fcb768
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.alsa-project.org/wiki/Changes_v1.2.16_v1.2.16.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 9544f1cafa..9bb686583a 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  122b1e3166d55fe19bcde656535d7a36f2ab10e66c72c6ad2f43f20ffded0a96  alsa-lib-1.2.16.tar.bz2
+sha256  f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e  alsa-lib-1.2.16.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 2530dae9db..b6000b3cf3 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.16
+ALSA_LIB_VERSION = 1.2.16.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
