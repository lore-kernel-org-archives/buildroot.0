Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACD7CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1CB761B4C;
	Wed,  3 Jun 2026 18:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHSdCvSf0k3Q; Wed,  3 Jun 2026 18:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82E0761B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512924;
	bh=dzHDk+MxY4PrUCPrJTZbGwzqS/2nEUcY3WXfdtRxh7Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qyC4fRMfMdhFXdRXkyqwrGGCCjsZj84lZiG4SK5ZKgs9D9GMIwMgduYOVrAupaUcS
	 ERLFCZVX4RzpwSqIwAx3qK0he1iJ96dI/R5OGUCEmSfctb2BbgRm/rxRGGZQHNsrKp
	 xw4z/vu0UzsIr4Pu3MubB+t4uIM39xLCZ1V6GuA2K5bq83o8H1g4wj03HeB+W4KCPj
	 Fh6eJLzcaF1MQiR8ceLbH7LKcX/mo03Ri/afD2UmAf/s+OX3yc5ZCs1tRY3xobblnK
	 hfPVzsHs1WoeHHXXcszDq5Zb62MXoLA+zZmvE9ck+yawKLbLN7Q2opwnVuEsrBiWkI
	 9HYb62n6ak74Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E0761B62;
	Wed,  3 Jun 2026 18:55:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 674F9192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0967C81228
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j94ajQRQ4WoQ for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC50081B99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC50081B99
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDF4B87993; Wed,  3 Jun 2026 18:55:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:51:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f660c7bae3e0004958acb3a2518fb409c6315a75
X-Git-Newrev: 71009e5890400fecd4eda9ee94552f59c9e1bdfa
X-Patchwork-Hint: ignore
Message-Id: <20260603185500.BDF4B87993@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/alsa-lib: bump version
 to 1.2.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71009e5890400fecd4eda9ee94552f59c9e1bdfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 1cefb08d5e..9544f1cafa 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e  alsa-lib-1.2.15.3.tar.bz2
+sha256  122b1e3166d55fe19bcde656535d7a36f2ab10e66c72c6ad2f43f20ffded0a96  alsa-lib-1.2.16.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 50e54712d0..2530dae9db 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.15.3
+ALSA_LIB_VERSION = 1.2.16
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
