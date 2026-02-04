Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4974E9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85073611D6;
	Wed,  4 Feb 2026 17:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrIRWElgqWoR; Wed,  4 Feb 2026 17:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE56611D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224885;
	bh=louuXKFIWsuOa0LTLOMaLIm1HsDNdBDgCuZP1LdfADk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mv4elI9SyFyd6Q5prpC5NgW6Sbbz8mpJNxk6RIuaoCc2cXEHuiVrd/U/2mYhmMGh6
	 FxduQCz+GVwL+Y5NU3PhTvl4aXmGuxrqoPwovhrmB4x4fRiIS0lIt5APeQ8IwP1EwH
	 wl+ylzZTg8DNSbkL7utHWaODjFwPbT6VkbjFK0JJ4JsaWODdsAyp8+kNoDY89o+A1x
	 nx9AbE7lQ2CBIZW/FbAdUjoyNX5mKpPrbdsHoHIgrQNLf3/scUJW+Xz8WmQSmUAsWu
	 +DBVS7D8QypRE1a4ux4zsW/aZo33Nx0eBD3+GcHZcSozKtK5QCDAMJ6Yp7jYuwoxac
	 V7sW2lNESDhHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE56611D7;
	Wed,  4 Feb 2026 17:08:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BC1F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF7583E83
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nu5x03lKRszG for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F25A83F25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F25A83F25
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 557AB86977; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:44:30 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 26eda22e6a059ad44dba99a867ebb436b1a69c36
X-Git-Newrev: 26e6ef5c810ed0592b7cade9a8955b444850ac54
X-Patchwork-Hint: ignore
Message-Id: <20260204170638.557AB86977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/expat: security
 bump version to 2.7.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26e6ef5c810ed0592b7cade9a8955b444850ac54
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes

Fixes CVE-2026-24515 & CVE-2026-25210.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5715e7da20b37cb3b704bb1a18dd8a09e1fcbc28)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/expat/expat.hash | 3 ++-
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 9d99c38a45..7536e7cb1d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_4
+sha256  9e9cabb457c1e09de91db2706d8365645792638eb3be1f94dbb2149301086ac0  expat-2.7.4.tar.xz
 # Locally calculated
-sha256  71df8f40706a7bb0a80a5367079ea75d91da4f8c65c58ec59bcdfbf7decdab9f  expat-2.7.3.tar.xz
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 07aba205cf..215c34e9cf 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.3
+EXPAT_VERSION = 2.7.4
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
