Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6418BCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 342D3615A6;
	Sun,  3 May 2026 14:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldZ8vkVts1JB; Sun,  3 May 2026 14:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B1C1615A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819895;
	bh=xB2pV4wjO9weEfWaVe/aytNKQFiXMPHQ066Inuu3gts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P4SCtGeOJZD3awXIooK4kIrQ5MakkuaUuTyJNczxhlMsygFbogvzS9kgWzOAb4pME
	 r6LxeZ8IrLv4nkAe4D7mLYu3CqYq2fZGThBxWZZyiE0umq9qXqFyKb/eYR47NuTygJ
	 t/diF1uivhokUg2DL5oGWx7+5+lZfYzcwYn6vBTaDKaAO3u8PdYbBd42wKMc6MKyfz
	 YGOrp4f43ByXVDa10NiQe2PtLTX66/0GBHwMhJR6wS5+UpaOQQ7PJSKTizLv2P61pC
	 pquFmd+31ToVglYjLmYibIVPOJVs5vCZiIhpVO503eThFrnzpu3R6vmKrBUAx+lrdn
	 2R3lHJHAz/L5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B1C1615A9;
	Sun,  3 May 2026 14:51:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F390392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A91F061314
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAM_demWngaI for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B683E6130A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B683E6130A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ECFE83FAE; Sun,  3 May 2026 14:50:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 829239df7f3fbe3847fc694af3bcd2b91e7d42b6
X-Git-Newrev: 5b42dee87767b9cf2ae45c44edcdfdd7263a169f
X-Patchwork-Hint: ignore
Message-Id: <20260503145048.7ECFE83FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-textual: bump version to
 8.2.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b42dee87767b9cf2ae45c44edcdfdd7263a169f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Textualize/textual/blob/v8.2.5/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index 00a6759383..a7a60f631f 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  d94bf25d9e81458d56b86aa108bb3fea  textual-8.1.1.tar.gz
-sha256  eef0256a6131f06a20ad7576412138c1f30f92ddeedd055953c08d97044bc317  textual-8.1.1.tar.gz
+md5  c1831151f5fd52aa6f09c834e32df3b7  textual-8.2.5.tar.gz
+sha256  6c894e65a879dadb4f6cf46ddcfedb0173ff7e0cb1fe605ff7b357a597bdbc90  textual-8.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index 9401964732..d7ada90102 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 8.1.1
+PYTHON_TEXTUAL_VERSION = 8.2.5
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/72/23/8c709655c5f2208ee82ab81b8104802421865535c278a7649b842b129db1
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/62/1e/1eedc5bac184d00aaa5f9a99095f7e266af3ec46fa926c1051be5d358da1
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
