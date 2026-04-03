Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D677EE7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCCE81AF5;
	Fri,  3 Apr 2026 10:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0MmvCgEuzj2; Fri,  3 Apr 2026 10:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC7E81A58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212021;
	bh=6Ma1NT5l7A+jiSTm06uxISSfyOtLOaE0k+H1+mu88MU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AKhsUbi2OZBMv5to6V7bxbxJ1GNEt5uEd7Fq2RNBZrRfs+lzBVHkviDd94acV/h2k
	 tLWRSo5LpTgLYRSO/rubgNmRCBOehS0OjcHS+BMaoYgqvEKJgcTYLcqJYtYRcL1Zm7
	 L2GdF/oEDzOzvBeAWsP6brTdl4ukR8tau9icB0SlpahPf7dDK4GVtdfExlEqUefI2M
	 7a2noTXbCKH5rtT9cffxEfftp/90JSZqwx9lxqCz5CtvaBWUcgHFazGBmg3vsQBEMc
	 3H3Nidr0nh6crjcJxW3BsD5mGt0ww+Zn1y7nvMlHJvMlEREjlb9MEm+ZvHyT+Tt/eD
	 bvyHyT+yXjCWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC7E81A58;
	Fri,  3 Apr 2026 10:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80EFF399
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 613BE817AE
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRahtEyZoS3L for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670888175F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 670888175F
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D90437FFF8; Fri,  3 Apr 2026 10:26:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 36bf173d217ce827777f5e21a2d252f21ba33f5d
X-Git-Newrev: 93666f7a6eade12dd49a9f356505ce498cd9e689
X-Patchwork-Hint: ignore
Message-Id: <20260403102656.D90437FFF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bind: bump
 version to 9.18.45
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93666f7a6eade12dd49a9f356505ce498cd9e689
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix signature url in license hash file comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f0d13085291aebd484eb8ca653a9674a3c1de00c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
