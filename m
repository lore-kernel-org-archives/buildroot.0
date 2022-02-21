Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF97C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 16:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDE9E40296;
	Mon, 21 Feb 2022 16:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiWSF5GtFIl1; Mon, 21 Feb 2022 16:06:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04022402D7;
	Mon, 21 Feb 2022 16:06:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC341BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 16:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38BA7817AD
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 16:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=protonmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXodEeoIaQIx for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 16:06:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DAF2817AA
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 16:06:34 +0000 (UTC)
Date: Mon, 21 Feb 2022 16:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1645459590;
 bh=mdZH1Tl7E6nQZEO63N7QxbuzkP7ueFWBFv+3lBdppM8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=rvYfG1S6x7g2NNTTHYdqmaP+uXWCLeSiHxdMfYCG0oIHJ90LpEY3vrgEKbAqTQsML
 5ocVYJAopmMB5/SuUki36e9ALI/gi0tEq8v78cFy1M3k9p8fKGODdSOmKVLP7t/V+k
 7ASNljyGARKGpI7BtXGRjUAjtVJC8JF8h2WbP6kgcNdRc/7ARIskJGdS34f8JHgyBq
 L4f7yW1VxPAM2HPbnWO3RXndrAL/h4334Rushae3SfjHOKluwSF9Cg1Lf/rrTbGx7J
 raM+kIdmv3QbyqE0C2r8VLizgf5r8sftxoBGuimSagKq/niO5ZIVFdiCoJpYOBBVoa
 7/kvKN6YSjd/g==
To: buildroot@buildroot.org
Message-ID: <20220221160549.20554-1-andrei.gherghescu@protonmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dialog: bump to version 1.3-20220117
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Andrei Gherghescu via buildroot <buildroot@buildroot.org>
Reply-To: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Cc: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
---
 package/dialog/dialog.hash | 2 +-
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 2286590b66..3136d18b2b 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99  dialog-1.3-20200327.tgz
+sha256  754cb6bf7dc6a9ac5c1f80c13caa4d976e30a5a6e8b46f17b3bb9b080c31041f  dialog-1.3-20220117.tgz
 # Locally computed
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 1c98d354e3..681f8ec9fe 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-DIALOG_VERSION = 1.3-20200327
+DIALOG_VERSION = 1.3-20220117
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
--
2.35.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
