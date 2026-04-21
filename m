Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08131F8FA9E
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDFA740D43;
	Tue, 21 Apr 2026 17:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3MJcTMEEYvJ; Tue, 21 Apr 2026 17:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A242640C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776791734;
	bh=8yrZKh8tdD8rmNuiu+uf/HeTDv5dhIDywxoD1u2UQTo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AniCmjjf4WjILVNzG4iLBB8znheFXVq6SVwFJq2GkRLUoYu/+7WUF+5lqDUnPtb6c
	 TRewqcmukkblQU28RIpcDd068gTcDotmwC23eYB37S2gMiQX0pv8w6y9B4epeVi1Ww
	 mBN4CFJWdAPHBwZIWQUY9dlCCQm87vSnVNGXVmWCuyplKGo5YEBB8PkTX0+mi96uXO
	 veu498ZIfwVpHvwbV62VXLNLy9mGMfZlnWQ/u8lvzjsmvzfQ+5H1RfxZIijBKnuSoE
	 fJhYm3FZ8Ae1G6gZ9xcP8WvKfKza4AO+PbJtyUSUIgnbcVG+SbqghIsUHxu86N7mMN
	 Yy31MW5gZRV7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A242640C29;
	Tue, 21 Apr 2026 17:15:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCB0A183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB894028F
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLrR0lIKRrsa for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFDD140262
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFDD140262
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:15:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D9E0821E6; Tue, 21 Apr 2026 17:15:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 19:11:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c07da534b4e9f58c9f9ffc2e0dad2e953a16f7ce
X-Git-Newrev: b5a678a1ce776efd87a7d18a046a5896c380ac24
X-Patchwork-Hint: ignore
Message-Id: <20260421171532.8D9E0821E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.2.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5a678a1ce776efd87a7d18a046a5896c380ac24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index bc6a19a131..b0bc621113 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  bb03a16da6b2cca43962b65a2890faf4e6b16607220cf60270436a11e09e6f46  armadillo-15.2.4.tar.xz
+sha256  97cb8ef708541f632e861d005a462dd0367240f81ff96f8e63ebbdd75c8ce55f  armadillo-15.2.6.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 8c9c44f89a..194af02e00 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.4
+ARMADILLO_VERSION = 15.2.6
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
