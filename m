Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBDBFED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB6C428E6;
	Fri, 24 Apr 2026 16:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPHR9zA42KYl; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF2D74295B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047941;
	bh=cdvnD1eKXlIzejSWT8idQ1UwD+C+CifCWAurzC989sw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rdSOUdJB/IwKX9C9CRfle/OJOH41kB14PpS7ckbjEigjYXLAdzjZG+ZvQ/ZOjCASY
	 3fjI/WpuOoUy/HBl4CLYYKU5nKa50mWk4vVmzvIz24A6xoSDaSB5PDsLYshOEkNcIE
	 aAwn2zvY/KNnWwg5gop+MrQPQBSIHLaaRlU4UlM0LSVvT1xBVH5BHPUJazuLPvU6p7
	 Pi8GGDJtSwfpvuPtc0/GRST4HvG+sexQjzPiNhmIMtX2+YgHBVQjgdr4ZDOAhDqbBS
	 urz5eO35o8yOl8epDjrYEGilPoDdLFTir+/h5XoEf9lpvTppRYpRnIyb3q/mt9Ocdl
	 Y43D3Hnqiekvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF2D74295B;
	Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79B6D206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C3DF42961
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ob4tMFKYH3bP for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 864DC428FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 864DC428FA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E5C382AE9; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d7f6575d2663d8b69ec39a20b1f1f23db9a60b18
X-Git-Newrev: 952d2c4fd9a4d8f3bcc46a54a67dda3abb60ce1d
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.3E5C382AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/strongswan:
 remove unneeded wolfSSL fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/952d2c4fd9a4d8f3bcc46a54a67dda3abb60ce1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_STRONGSWAN=y
BR2_PACKAGE_STRONGSWAN_WOLFSSL=y

applied after 'git reset 10a70b1af67cf79986c2e401f7a54aa850ea82d6 --hard'

replicates the build error
http://autobuild.buildroot.net/results/278b3f74c48c858ae368d59069752adb69c05246

which was fixed in 2024 by
https://gitlab.com/buildroot.org/buildroot/-/commit/89d512729cfa5b2ef5c5165492789ba4441add19

Note: The git tree was reset to the commit right before the fix.

Instead of using the fix mentioned above the build error is also fixed
when the buildroot commit 6c183754342e6bb73aeab3c8731789c73fcae4ad is
cherry-picked onto 10a70b1af67cf79986c2e401f7a54aa850ea82d6.

This means the build error mentioned above is really fixed by enabling
BR2_PACKAGE_WOLFSSL_ALL. Therefore we can remove the content of commit
89d512729cfa5b2ef5c5165492789ba4441add19.

This commit also prevents a build error in strongswan

wolfssl_rsa_private_key.c: In function 'create_empty':
wolfssl_rsa_private_key.c:450:18: error: 'RsaKey' has no member named 'rng'
  450 |         this->rsa.rng = &this->rng;

caused by the upcoming bump of wolfSSL from 5.7.2 to 5.9.1 due to
upstream commit
https://github.com/wolfSSL/wolfssl/commit/cd88a8ae88bac13019689c087755d826145811bb
which was first included in wolfSSL 5.9.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5d6378db9dd83d46808cba4538a7412f71f88089)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/strongswan/strongswan.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 4185e13288..b79ab83c42 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -85,11 +85,6 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MARIADB),mariadb)
 endif
 
-# https://github.com/strongswan/strongswan/issues/2410
-ifeq ($(BR2_PACKAGE_STRONGSWAN_WOLFSSL),y)
-STRONGSWAN_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DWC_NO_RNG"
-endif
-
 # disable connmark/forecast until net/if.h vs. linux/if.h conflict resolved
 # problem exist since linux 4.5 header changes
 STRONGSWAN_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
