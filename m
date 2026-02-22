Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A045BC636B6
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 18:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4937860FD7;
	Sun, 22 Feb 2026 18:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMcDy10zcD88; Sun, 22 Feb 2026 18:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68FFD61093
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771785369;
	bh=ox6JWBjLek3PcK9DGmLyS9HE2ej4tkLv5V9TWU/X0+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W0kEWBRYoMuIaMjCIRYUb83pJv/Kz7NkrHmmrqugCSHPRV9io5bGU6a8XcDEXMNwr
	 wbtJGGliVUD7AWOu67rjTVW/wXSaA7dJD413jksW2huwjX+6nU2UAfWlLjYvRiHrVS
	 Jh2Z1ED8AxBd1DRBzIXZswft0p90IdlKx80KjBT0ejfj/kbmrc5P/bTvmS3OEl5cxb
	 LjsSYOuFiD1a0V3xb9DJnYpdEhdD1Q/jHZELOfoQNWyil2wQQ88RYjL5f4glrtHHhW
	 DSWM4F1VfFgnl0xu99Yzj+2rSKbel2A067zMTHsidGdECIpWI7o4u+78CxOknkhzeZ
	 7wHtrjV2tru5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FFD61093;
	Sun, 22 Feb 2026 18:36:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08E9F249
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEAF940532
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQr253jFhqrZ for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 18:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9E440511
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E9E440511
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:36:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C91886FA5; Sun, 22 Feb 2026 18:36:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Feb 2026 19:27:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e7e7c5a66f82cd6a96fc7925d99554592cca374
X-Git-Newrev: f0d13085291aebd484eb8ca653a9674a3c1de00c
X-Patchwork-Hint: ignore
Message-Id: <20260222183607.0C91886FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: bump version to 9.18.45
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0d13085291aebd484eb8ca653a9674a3c1de00c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix signature url in license hash file comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index aaf3519ced..2e6ab4e043 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.44/bind-9.18.44.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.45/bind-9.18.45.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d  bind-9.18.44.tar.xz
+sha256  096ec94c10bc9d2ba686325660a615962d0fd6529429149acfcfb7daefaf2421  bind-9.18.45.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 041541b037..1b71bcbf66 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.44
+BIND_VERSION = 9.18.45
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
