Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644A1C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 11:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1144C40798;
	Sat,  1 Aug 2026 11:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOn15p7cEVR5; Sat,  1 Aug 2026 11:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37254079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785582683;
	bh=j+93mksfYaWkkMlOtKknV3dEQxmbk4Zd2xyBWTqBy3c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iswLK1RFL+G62Q3cIlhJwF0LqRG8G+Iyt0MKU8Ee9+MCnnSr5KDFJnRuLgjkShW87
	 8FqlFO52zQBFQcaXcivhqn4ETuNTo5iQNvr4JEc8y02+MCh/1biFuZSpl678y4cbup
	 GEMuMxxpc02zNzUGhz5uyYHNoJ6JaNnaFa4Oty8/Tka0D506xw39ShFd03xELORXKY
	 01SZ8y9MY/3ze9/LChOY1T0TZd/P+gxeYiRBWlaMDC+6RsNbxqjUBbELyX0wTKKlzj
	 fCw2k9+H3nIcPNCwDw3R/9Ws3vcVGlnWm5/ilT1IbMrVWDB+8RLZZrL+smDOVJJr7D
	 yJVIMBjZbEeYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37254079A;
	Sat,  1 Aug 2026 11:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A74D21344
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9925A80DE9
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHZUIGvjo6CE for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0356F80DE4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0356F80DE4
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66E4986D9A; Sat,  1 Aug 2026 11:10:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 12:35:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cec50f48d6b2f2d2b8683b1637e4513a5acb0d5a
X-Git-Newrev: 33608902b85f22e97aa7c5e08c9a62a48cee79fe
X-Patchwork-Hint: ignore
Message-Id: <20260801111037.66E4986D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33608902b85f22e97aa7c5e08c9a62a48cee79fe
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
index c4425ed262..4fdff326cb 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  12781baf33c71b622c2f040fd27143479d120ec89d40f889621f0b1bb6232e27  armadillo-15.4.1.tar.xz
+sha256  58fa258d0e1f93074c9afa792027fc259b85cb974ccc0b932b061d4ada5bd83a  armadillo-15.4.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 15dd721680..15704952d3 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.4.1
+ARMADILLO_VERSION = 15.4.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
