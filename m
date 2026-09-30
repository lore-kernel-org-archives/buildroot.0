Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A51CA5FC5
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 19:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8199140836;
	Wed, 30 Sep 2026 19:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1sYpFiMcU5O; Wed, 30 Sep 2026 19:17:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8DE5040640
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790795865;
	b=L89f3kLXZplwPSQl1n4Yo5D7jeWiISlLzEacLZ8O/TNvTrBke8AN9JhCBscwIe8bLJmO
	 BuIRHDft1u2CjkYW5hp9wVAam3oct4UpynTBYFHNdduuYCvyTbs87Pl19x9dl5t0O0N/2
	 yIpZEdNZBlUvOT4X00UaG/qER6wbdmtxX/J3cEfecZyBiWrVyWSIZaqSknftVGhsMED2p
	 4dahK7PiGC5n/ppEPADKsOXZ7FbIjOvOa1M6rt/wF5kWts1flmYZ5LRwa3k9zXsPr6agT
	 4n2BHEb/lqpj5QfQ7Ztqz5O8bBD0XptcNE44nEwVcA3sxgSqFKSuqxOX5bl34+8NHew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790795865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+jIJ1Qx4XPW+SM8oNeS0NH/oJ1f2I4EQYtjl830Ib8o=;
	b=ZpoIV2VROoBrFJtipBU/hd+YMZDT39vxOluKzRA0Ellu3GxzoGQ6DnwScC8jtE6CV4Xl
	 hV01j/4ogJQpClJg5cyp/LxHMoAzL7Wzt6RwohCMPCPyk0XCPR7Bk9Y68yYWb0gtFuzO1
	 3JlAN2A9ktEbaECqxS7X/2Yo8xPXNofoxz++qXPaA5HI5iOHiaSim5McS3XgkVccrJfHc
	 FrW81t8B3eqT17JGDy7H7hOXWA3iMOkSeI20s06xCacULb2YTqQi0/aK9Q1HIGbe66cMH
	 RJF7HlSLE3E2TUR04pdf41H3i0pzqZUm00F1/g9u4oi4MsZEa0RhUTiAPVTMV0Ck2pA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790795865;
	bh=+jIJ1Qx4XPW+SM8oNeS0NH/oJ1f2I4EQYtjl830Ib8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WvThCAagYZBOCyMl3hGlMKtVU+FsACHE0RuYyfbcTvwbQwmLUmr64pxaMLaAOWsEI
	 K5oy9MAdCzZ8JBYhM9TdlRjAsf2hnyNkKaocZ0Ti5SZ7yU0oWogE7S5qcgcNI4IUk8
	 xxbsqd97tfNe2icwIElSCh2h9634yTaPvUkzEUaiE+BuiBrYNlTCjvJvUyQVWoMgUi
	 wKh5UQB+P4fi5hdut/ak1k03ZZI0nW3jEeFXCfFIg0GeqMuegH+q2n05Xx9gg/hWv0
	 J5YrKyyC0r8q+Pna8E//+xoI2eDBhPIq8Fk81a8mIIocNbMMn/8Je40X722sQK669u
	 E9pYAxp/UlrhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE5040640;
	Wed, 30 Sep 2026 19:17:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51D1C3AC
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4306980FA2
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wi2LvsrH_Tfg for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 19:17:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2ED0A80F95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790795863;
 b=KmjPJ9GRrxJ+3yPLjyQQ1c9GwkWIQg5eRlZ7LkJESAKoXh7G03FCqn1VB9GZLC1vdV0p
 /g5p7UQoV6XFrAxZ4nzrnGWkckTftD3t3tWskoEBWU+EJprxiR0HjwaXEOPl7WX4krD0A
 d0Rhb6K+dZMCzaC9KkyQp9hcBp1AO4NouU0cJdXjIHNfJw1ptujJVOxH/pEV4Q4ZqAchy
 kHK9a1QeEprxJoNmivR0wIwEiMRMsJSN7mrZ8ObIIB2l7TNxQYRFfi2tPcCinb9OJf28s
 JLpwJ0iXg58UQxZag15D5j5iLQbsE/Ez02lrd6lBvYlYB7GKOGd3GgzLAtaBzMtAaVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790795863;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vOTwvlVbg9HTRtEntY+BoZuxlHWHfCRluuDzyK0qI9U=;
 b=eQYCwZfFq+2SnnEyIBdqUcnofCuU0PFbRgMNo9xzIKz8uKX0Ne1PgUahzqL5Yyku7s+3
 d1x/AEOlZle8Sv07nTm4ax70YUmOpYJb6cwhLZhGvB2yMKgpDEq9YO571VuOH9rWl9mj8
 T+bn5+aMjcUk5sxLB+dlQw9WWwFVsdaF6Fx4ngicZSLhp9gXLAKYsJeT5sbrTdCBhuDK8
 R4qhhkKEgRkai0HMFzXSAVReGQV+IsOo54y1rYM0o4BojsNDv8CdfU2Blw70569AeX//r
 pHxb+OWClcuYGNC2MSWF3Fcp1d2vM4sNoe4q+Y5fXXahWtzN1eWzPseE3F9b7BL5GUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ED0A80F95
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:17:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C75B298446; Wed, 30 Sep 2026 19:16:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 20:48:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ad0796f2b40eb8dadc43e95dd1d56708b191375
X-Git-Newrev: c71fccc7a9ed80ab38c56d54b788bfe92090df35
X-Patchwork-Hint: ignore
Message-Id: <20260930191629.C75B298446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump version to 2.44-55-gc90398e00
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c71fccc7a9ed80ab38c56d54b788bfe92090df35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-89092:
https://gitlab.com/gnutools/glibc/-/commit/c90398e00571476711792baacb6d92bd2a7b6891

Also fix typo in comment.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 7 +++++--
 package/localedef/localedef.mk | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index b32fdada8d..439fe1f140 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  d55ac4dbe32f36310d7a4b9a38d3796666fe323581825cc530f2000a2209947a  glibc-2.44-48-g1f5026241027260e9280039698bca031484c82ad-git4.tar.gz
+sha256  2ba6ee9ed5177a792fcce4da13225800f0cb3a2413a459e7864b8843eb5cb790  glibc-2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 6e306c7f2c..a838ac1a81 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+GLIBC_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -40,9 +40,12 @@ GLIBC_IGNORE_CVES += CVE-2026-80489
 # Fixed by 2.44-39-g0b4e41fc51e6aba6216a908961b49b0622b47fa0
 GLIBC_IGNORE_CVES += CVE-2026-18374
 
-# Fixes by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+# Fixed by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
 GLIBC_IGNORE_CVES += CVE-2026-8674
 
+# Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+GLIBC_IGNORE_CVES += CVE-2026-89092
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index f20a05aead..e4bfce1a3a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+LOCALEDEF_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
