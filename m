Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BBCD0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F2C40F5B;
	Wed,  7 Jan 2026 18:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAEt6N54Fa5X; Wed,  7 Jan 2026 18:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7331F40E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808887;
	bh=H1/BuUgG9bA3hSw9M+hKaYqjUCR6Tv/9QMWLVRboYKM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q6/7gRjia4RSKVbjMBic4KXgVqMF6ypikpUB8To/DsmjInI65m1Ptvx6KXgWwRyCl
	 Xmcx1j5hNGniWevPFxyLotvBEuqfYYdvTJymdpaGO8I+Qs3Thn6yFIWgzdY3NllmXz
	 TdVTVVpp+gZzolSffA6+8/X+uwyDN5MbmBLZTlAuB1bChVXfI6OX3SBw9dNgpoalTx
	 34OkCwF9VUGKzA3Ic3YzwcoVbUh8nXTfjJeopzEuuAXGjgyn8/mqN5T4meEi7UJ6Br
	 bp8b5vFPRMwBrWIO9VMV5NH2KAZ5cEMz0n4XkcVR5pdXqqKN6KQrDokMRGClpLI6Bk
	 HkVcGU0VboV8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7331F40E37;
	Wed,  7 Jan 2026 18:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D7525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1D14607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SibrImbHAsAU for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12400607FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12400607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 119B087C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 18:53:14 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 45e06e7e5721334ebf378f4e587fc85acc8c1afb
X-Git-Newrev: cd84d000ce9262f57f412c2b45a48a33029a1c64
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.119B087C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libconfig: bump
 to version 1.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd84d000ce9262f57f412c2b45a48a33029a1c64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

For change log, see:

https://github.com/hyperrealm/libconfig/releases/tag/v1.8.2

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d40462ac54d3d9b9454ae5f76dfe93ba295d787c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libconfig/libconfig.hash | 2 +-
 package/libconfig/libconfig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 2b10dfc125..22f8473fc4 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
+sha256  e59ffb902dd5731d5d4e4fb81d3b989697615feab72dfd7c30618167b91a42ee  libconfig-1.8.2.tar.gz
 sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 3fa2be3563..8bd494081c 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.8.1
+LIBCONFIG_VERSION = 1.8.2
 LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
