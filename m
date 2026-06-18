Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20CFCD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B6A41C79;
	Thu, 18 Jun 2026 20:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50XXu0e18ohG; Thu, 18 Jun 2026 20:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD9C441C7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781815800;
	bh=P5/cFkkNdFcWRTYaR/kYcXDCn6y+amt7RZMpH7Hkd8I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EGMI1MR8WG2yPfxt0GAKqrbPNEtD7eMOVWtY9pql1x92USSHbk/b7zAZZ8bBTf7Er
	 KBiOY4TnFtYZ/pDW4uICYBjjcZokJyWNU9jIpAr2P7eOWwma2UAYj2xqHXivNyEBhM
	 1+ZEtqUErSbgiL3Z3Ca+XETv9YFZwcniVWnBriUEHTzdKT6fGTR6ijxDbLFOv5u2or
	 VFlvoamOrzRTIx5B9et3uE5Gimrb2939ACNJlDrGuC0KKJToHB5MC4tEyo09anR4hr
	 pGIR5/+aP+gRpx3MrxLs8L7L8ziAngnlYjzp9Vyg6QVOsIOmhPafJy6J5xTZNfrk8B
	 r4YRpfZbiVvPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9C441C7A;
	Thu, 18 Jun 2026 20:50:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B40F4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A35141C7B
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wctP616PpkiT for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ECAD41C79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ECAD41C79
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCA88814A5; Thu, 18 Jun 2026 20:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 21:42:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40ce6355c9ff046a1821857c4e2ccccacfc24a4b
X-Git-Newrev: 09a13526b8197767a08d56d8517aae1cd783177e
X-Patchwork-Hint: ignore
Message-Id: <20260618204933.DCA88814A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.18.50
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09a13526b8197767a08d56d8517aae1cd783177e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/changelog.html

Security fix:
GL #5934
https://gitlab.isc.org/isc-projects/bind9/-/issues/5934

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index b719012de7..766540ee22 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.49/bind-9.18.49.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.50/bind-9.18.50.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24  bind-9.18.49.tar.xz
+sha256  a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d  bind-9.18.50.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 6c0d2f8a03..54870bfa4e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.49
+BIND_VERSION = 9.18.50
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
