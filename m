Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88853CD5BA4
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D23983EFC;
	Wed, 20 May 2026 19:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fru2rCpCJcxI; Wed, 20 May 2026 19:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 913FB83F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306090;
	bh=d1lLK82zbhC0yeYuiO0p1fXHp/HYT2AbCKe4obX+YUY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UZWE8gNXGebTYgz+OCf20Hi0tZKcCwC/MBoYR8Ds/REaD2SnBM8lkystUt6FK8gMK
	 2DtRKcWa6uJjK9f3JI6XbWApI0FTtNrlIThWh7z4SJ/b1G1UOBnkK1HJKucZCzRH9A
	 J2oyY4CotnJuDM7EOb/25CU1F42k3rUweP7VIj7EWEgjDEbHcI1HhhavGaI893v7oT
	 GCpfl7IpnYA4Qc89AxT4YjtujFhoMZ8E0gt+FNXrw4h/q1rbFw2Jvpl0VKv0A+LfZb
	 cOW2UCyrSpV3bHOnMvWFpAZ0kERQUNSlmjrgi3i2Ntu018NLFtqbpNFMaw06+g/c+7
	 iDOvWuC9WDWaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913FB83F01;
	Wed, 20 May 2026 19:41:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EAD9265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749D9613B5
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Odikzi-zDw1 for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DFB0613B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DFB0613B1
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 456CD8693C; Wed, 20 May 2026 19:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:36:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47b5cbb1cac5215a66590eb91937e29a7936d252
X-Git-Newrev: 5528e00b10c5b98356550585324f775db2e4ea02
X-Patchwork-Hint: ignore
Message-Id: <20260520194117.456CD8693C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.18.49
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5528e00b10c5b98356550585324f775db2e4ea02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
