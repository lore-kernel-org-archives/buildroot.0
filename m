Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB83D715DE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 12:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E13B660711;
	Sat, 24 Jan 2026 12:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrtFtA_GhDTD; Sat, 24 Jan 2026 12:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13A996086C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769257187;
	bh=ox6j7CSVoaJnt/ue6ikfvUguPxxOOPVIRn0BLxRzd90=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g3Fs9FbcwEZcf3dvXVZv1Oor4VAmvI9mmlJn1v9LNVcfmKplsCQfYy9PkIakbrKkT
	 4nw8sYUZELvOlm/FirsDffseHqXbC2M6BRKJHpQH7fS7WiSpvhEC7etVawvo/nzJ09
	 RgBnkNzURIUY1dAn3R9CA2OM739TFpqLtRe+U7+lb12uK973utJEl/2cc5yrBTCwIF
	 SFYdWBCgh9ML99c6alJ1Ux7gVzpLQdjuIecHC2o7/pq0VOMUgciOEd/zwxo8O5VALS
	 Z7ZT9aMq0dFM8Sr6ubmiC3ocQauaHIxc/9QZWoEwAwR6Ysku9faw7npimYnjmfDyJO
	 PI8B4j7x7FgDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A996086C;
	Sat, 24 Jan 2026 12:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D7DE358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A6DA81380
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEiRCruZTwGP for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 12:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEFC881369
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFC881369
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 999A0875E6; Sat, 24 Jan 2026 12:19:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 13:12:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 612c27c1918d1a199c0eb4df0a60ad9c72eb1dc6
X-Git-Newrev: 2c643cbfa5dd2dfccf1dac8887cb3515709ad914
X-Patchwork-Hint: ignore
Message-Id: <20260124121945.999A0875E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c643cbfa5dd2dfccf1dac8887cb3515709ad914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 9dc5dd8b6a..0ec391b8b9 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ad851b39afaa1bab121c00a1fcaff641e3640d2c4743a1ca7800d2f403fcf52  tvheadend-0b23983f5dafff006ee83908915193c49deacca5.tar.gz
+sha256  f3c311c2bed4de5b0312286f5b1a0307edf502fa0ed360855eedb044d4247674  tvheadend-5abbcda4d8c82d2d4889452a7056a7bfcd728fc6.tar.gz
 sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index e108a6d23a..76fa7d8cc0 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 0b23983f5dafff006ee83908915193c49deacca5
+TVHEADEND_VERSION = 5abbcda4d8c82d2d4889452a7056a7bfcd728fc6
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
