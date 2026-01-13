Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE88FD30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B3283DA8;
	Tue, 13 Jan 2026 20:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFWqc_tx5RTg; Tue, 13 Jan 2026 20:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD2E583DC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337952;
	bh=WcppSC6zNFYKF30DANI5q9O38kQwNV//FLfgc7hBrDY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fzIzc4ocQNXGtCG/PqLbUIcuWs2wcmHnnjwgmUrudNvrWk4jtKW50PlDFUTrpbmiU
	 0B82jqz97emo/VZRfdNZ3tqHxDUBjse+rzjEHccSGX1AinkwYYzi/K2yTM4fKzf2bv
	 QnazLk8hsS+193q74UVswBj5tfG9DYMnjU2kBEL81twKdyadeL0e1p7xkCw3qlDSyL
	 XYKRIJURV/XInC2lDLvFGsdf6yXSzCPav73vtRIkf23U8RF5QuMC7ziZVpHnDqraoT
	 lZb399znaG40pcDSM2l5NHTN1x9f7fpIiuz+xMr/HURWl81StcQBPa49kWKNWknS96
	 JECv4pwFLGjjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2E583DC0;
	Tue, 13 Jan 2026 20:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2493F1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D737F407A5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7Q051m04wZO for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B4D40772
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13B4D40772
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10C3E88570; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 287906a87023c363dff8ecf18daf7f339d796911
X-Git-Newrev: 3cb3e09f4dfad9162578c131bc17b41576379bd1
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.10C3E88570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xgamma: bump version to
 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cb3e09f4dfad9162578c131bc17b41576379bd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-July/003620.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xgamma/xapp_xgamma.hash | 6 +++---
 package/x11r7/xapp_xgamma/xapp_xgamma.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.hash b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
index 17efe0a975..675f624f14 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.hash
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003267.html
-sha256  1c79dae85a8953a15f4fe5c2895a033307b43b8613456c87ec47b374b113bc8f  xgamma-1.0.7.tar.xz
-sha512  9eeee9b537dcae9e4d153774eb632a6a5e8dd32bebadc9bbd897a773e5b56f76848f32a1699b8c921d3094760c42b5083365d853b89ab31fd85c7a0d46feeceb  xgamma-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003620.html
+sha256  98f9f69e53a11c354a6637ea5c3d7699ceb5c5b1f8ad6f0a14d9931e5a10d079  xgamma-1.0.8.tar.xz
+sha512  edaa33fc18a9eb9e3bf5395ca0f6196778d0f8d8007e94ed53fc26de236bda51ee06a3eb8d0543a9e4367d3a350e7571664032e963001b7b6d525c27a3b3e8b6  xgamma-1.0.8.tar.xz
 # Locally computed
 sha256  78d354d348feaaab8d67a220e84137ec24fece04af4dface2e67132c72e216a2  COPYING
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index f2e9e91efb..487da4398e 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGAMMA_VERSION = 1.0.7
+XAPP_XGAMMA_VERSION = 1.0.8
 XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.xz
 XAPP_XGAMMA_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGAMMA_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
