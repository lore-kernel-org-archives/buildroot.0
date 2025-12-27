Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A09E9271A
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 18:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B37F404EB;
	Sat, 27 Dec 2025 18:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36joVnZHOoku; Sat, 27 Dec 2025 18:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98173404FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766860900;
	bh=8Cz9/AHdlBSGI/YJgScGOrzCeqpr9DBl5OHQ+TU4TiQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eQBnxRxF57IWzvPaFpAyY3Qb5mgmNyyqcEajK0UPsIVw2YgdZQXyBwDHJdrtT1oLv
	 bwDttIkuzh34nG3fETonpgK6H+vuqyCoSUWzKcydfWD/Od6ZMjWB8rEidmkmT4W74g
	 8tvGrQmM7XWCCqNTMwQg/e0E1i1c5QzmPHJLlfvaoEjfe1ByDUQfNKxHSUGnCusR7u
	 zQJWfvSpS4zPs2QZkFzM77uYUZF8UPwB1SVy4QrPYFOvXcrleGmyORl+MplGYsD5n3
	 CBg6iCutVF6unAbZIaL7tRCyMvoPttx3BZeXM1YwJ3KwKtQuvvaeDBqJ2U2Z2huO3b
	 wowXY+onmAcOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98173404FF;
	Sat, 27 Dec 2025 18:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 413F4D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E88404FF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-iVjlmPfPFW for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 18:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14D8F404EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D8F404EB
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:41:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05121877D6; Sat, 27 Dec 2025 18:41:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 19:21:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a9e80a8c9a0c9aecd8ec7a91b0d780a3aaa32cb
X-Git-Newrev: e859686460a30af0868d68810645c2208562039f
X-Patchwork-Hint: ignore
Message-Id: <20251227184138.05121877D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: bump version to
 1.2.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e859686460a30af0868d68810645c2208562039f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-utils
https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index fd03588294..ee47d43ab9 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741  alsa-utils-1.2.14.tar.bz2
+sha256  5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327  alsa-utils-1.2.15.1.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 64da2201bf..9af2d0136e 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.14
+ALSA_UTILS_VERSION = 1.2.15.1
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
