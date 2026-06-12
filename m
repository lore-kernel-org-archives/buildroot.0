Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745E2CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4883083A05;
	Fri, 12 Jun 2026 16:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBGKHo5dIiM6; Fri, 12 Jun 2026 16:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C90839E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282213;
	bh=IwemjTzAQ7+RxVuowYsyL1rl/wv46VqxEK8LP9HWQgY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O4tN/AeNso0ZdJa+1g3t/g+OWleHcjibx7/PX1kSF7RXJhoLQw331qeALa2oSXjNB
	 a+M+9TwYxlK70Nw7f7kiZjH2O3AL0OZFeHdNLKl45K11oHPxTPucXjz05uZUZr6oTm
	 zQHCoSXzRDm6PtFGZrRUmcOMgCtm7NU9+e81XQtNVSopTb0BVcN6AMOY8Rnqocg75p
	 3fk9pKa4UsSMjXvAd+Dn391DB+iejWzhx81U3WxsCaTC1S9Sq77oF1keZya/tO+AIo
	 4xr+lsX23XLTKtn1NZOzgpqsvWrNCxBsnZM/JRKFSgSyNiOmG994zxzArUyiNDSM1D
	 NO47x82Jp8mCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C90839E4;
	Fri, 12 Jun 2026 16:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6C7F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D15A839E4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzASHTa0lBek for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C91839DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C91839DD
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:36:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3418D8811C; Fri, 12 Jun 2026 16:36:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:35:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e5477637d8df63036439159956131bd5def4eaa
X-Git-Newrev: 374d0a02e4595247aa15c34d1bc35c5dcb316c7c
X-Patchwork-Hint: ignore
Message-Id: <20260612163631.3418D8811C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: bump version to 2.93
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/374d0a02e4595247aa15c34d1bc35c5dcb316c7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://thekelleys.org.uk/dnsmasq/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 74ee5c415b..176e73899e 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.92rel2.tar.xz.asc
-sha256  43d72b8c129bdf33d17bafedc98823f63e46b5005128066bf0d2a472a32ce06a  dnsmasq-2.92rel2.tar.xz
+# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.93.tar.xz.asc
+sha256  0c00d4e5c97c8306e5fb932b348b34269c9c29a0e7df0e8e82958b407092bc19  dnsmasq-2.93.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index d7ae8a3312..b9a76fd5cc 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.92rel2
+DNSMASQ_VERSION = 2.93
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
