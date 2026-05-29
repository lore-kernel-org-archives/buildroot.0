Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9125ECD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69DB6614B8;
	Fri, 29 May 2026 08:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLkS1hhpayBB; Fri, 29 May 2026 08:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81646614C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043321;
	bh=zALXhRVTxsx5Wx5nEs+c0vt1RceqJkpvXf/miDOntow=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c5SLu6/Q2pzKHV+d+XwT0X9WzeMXbdGgLNqT5N2ULwFOokEbV6tmy9QyHmG7x6PMB
	 YumgVoImk8cMmlaWFJ3ox9T1N7OF+vrKz9M0Vs4Mp2GK7WX6L5SeQftL9SfRunCVN3
	 cx3Tz5Gnecm6RT274RVYqfZNIZwcdV4lDHYY8SzCvtRU1/4x3QTcopxr01QC4uhq4c
	 v5lUzpsH9TyHJAKsfjHNiKj9McEdiDB9BTncJZ8Q6qmRJZZ1FJNLXAi16Ow/8jDmXU
	 nFhsMnw+VPJXCyWKF5Y0imS6+DwKEcDAUcK6sPkIKkkJZYSSish/DDYR8pEF9TSD1V
	 iaW6r7qYiV7JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81646614C4;
	Fri, 29 May 2026 08:28:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 023CA28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 412146142D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n61ONWUYhjBf for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B916661459
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B916661459
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 577F687334; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:51 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: f210a8ce1e3d64928559281abcd96c93b069eeca
X-Git-Newrev: 2896d8fcc40e28f3ba0dc4be78a34b08403b0c31
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.577F687334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/bind: security
 bump to version 9.18.49
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2896d8fcc40e28f3ba0dc4be78a34b08403b0c31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Release notes:
https://ftp.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.49/doc/arm/html/changelog.html

Fixes CVE-2026-3592, CVE-2026-3039, CVE-2026-5946, CVE-2026-5950.

Fixes bugs:
GL #5804
https://gitlab.isc.org/isc-projects/bind9/-/issues/5804
GL #3589
https://gitlab.isc.org/isc-projects/bind9/-/issues/3589

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 5528e00b10c5b98356550585324f775db2e4ea02)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 7b268a49b4..b719012de7 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.48/bind-9.18.48.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.49/bind-9.18.49.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  c742a69bff2561c23099d7c70c6984c145bcca1c1e3c67fac1f68a8132e8e7c5  bind-9.18.48.tar.xz
+sha256  c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24  bind-9.18.49.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 17ea50c5f4..6c0d2f8a03 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.48
+BIND_VERSION = 9.18.49
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
