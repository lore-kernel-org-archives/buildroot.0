Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1469ACD98E3
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC468457B;
	Mon, 15 Jun 2026 20:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdqouMeHiFrN; Mon, 15 Jun 2026 20:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B678457D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781556353;
	bh=cOI2y3BpwZraPtnn7OYo1EoaNG/8xxFrk6AUxQ7J8a4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Av+zMBqhuW0sYCadxoRRbvhCCgQ8v3yqGW8sUSnwPX312rngShj/VO1vwSN5Rv/iJ
	 Z9nSnf6PQHP0Pc3K2L44Vbr24Cky/9gSPb3xHAot9m0VzTMFH9usc9rOiQldclXxRh
	 LsDmcl9Kbkt7FVm3B3ss95TQ9Xpj3DlgOA2eFDuagvVsOnvpkN6daD24A9utauMqFS
	 FCQo+YYBEDOl6xk7MeqPl8OjcDuzn6bZUHjIYvE4rpkwjSvFmObIFeMlEGUiTX5HAw
	 vO3bxnikPES1Nd9mRbI+PGPZ3Yt99BPWSaC/o4d99fWZCWRm9usK8myuSrbjJ0eDmw
	 TZD4vGK8BlZJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B678457D;
	Mon, 15 Jun 2026 20:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BF992F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7469406A3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beSRc154jT-k for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51CD6408B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51CD6408B7
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7995C7FF06; Mon, 15 Jun 2026 20:45:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:39:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bcb156d33e5c8f39fa6d52154736a3585a5a81c
X-Git-Newrev: 6d9cf49f8a79bb64eb26fbf35cb3e451d13b8d26
X-Patchwork-Hint: ignore
Message-Id: <20260615204527.7995C7FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-zattoo: bump version to
 21.0.7-Omega
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d9cf49f8a79bb64eb26fbf35cb3e451d13b8d26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index ecec000e3d..8b5509d947 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6df1fa29ec3778f591281f57190099bf5a510c293c711ea978497556765352f  kodi-pvr-zattoo-21.0.6-Omega.tar.gz
+sha256  d57efceff2f451cc8864d429abed6c7d808ea5092fddf3ece3f598d4a5e26b1f  kodi-pvr-zattoo-21.0.7-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 2de33b26b5..12d2d5ff09 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.6-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.7-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
