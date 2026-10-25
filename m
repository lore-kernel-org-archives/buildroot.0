Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NdGNcBuG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB36605F9;
	Sun, 25 Oct 2026 20:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W37B0OrUwf8g; Sun, 25 Oct 2026 20:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD6EB60619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961840;
	b=FzuasCfEG3yiNbrQO5aHypWOIHwfHWDhII+FaFa9G9fjZ7fX7kbSwacqn+tNi8r9VnWA
	 uWG0P8yoQfze0lhLvizbg94stgAtkcOiQcbSxMWU2TaCoowevBqMBsMc+oxl0yxiQHKiG
	 Q8TqvThTGfHUj9gicl+ozaBzQbfY5Of0X7EI3DCAhBnsILugcjJFnkMNJfRRp3pRgBBIj
	 wCs/H29kDldyu1TnW+6o2ZRPyE6OkIf8s5dQY8V52Tac3O7KNg+Q+aA3l/cd629F1qvrr
	 81H871xUASFFcRbgO3uoW9CyFKhNo75xnd0PG811hVRa1D7upLr+XDQQ7+8HGnGKExA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/sfUbgSU7nmE1W4TfxwXYdgbgfPLMj2vYLklib7pq70=;
	b=r2g5zI4ZnU0y3g4gKLte9GTDg/xqGoafsX7Eb3PHDR7h2zP5ZH/MQ95QIDcV9syXyOxp
	 8fDm3AjMD4TG/a8COfe+SRCLvZpMka8D/AFYQEm5SAw/XuB97VIyfPyha67QLNQT2FYBt
	 aD7bqXlIquySdOmb8dZT9j7AJqn0TDA0QuiN3m2P88XqBGdZIwsfocCQA3ei+jY2pBNmA
	 DDbeZH/BD4makSPfSn77KWBNd9jGWElUV4FWEcmX/0e4DGNwRd/LTM9kMq+RyPiVLvaSl
	 wPFTcPw/UTOB01iIs/qCpTFnBw0BCzr38xdvwwoIcdzR1wiErE7gQkjLKZHezT2V5fQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961840;
	bh=/sfUbgSU7nmE1W4TfxwXYdgbgfPLMj2vYLklib7pq70=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NdGNcBuGJAkp9ooNM5UcdPE9i6Due+tAbpgGrjRrdle6iuZp3rvXTAXU3LXAHbSWh
	 t/Qk1+gHDSrhEN4emGdWGb2aW+f1HWfEI8rkM6juwtJJ5m91UIxqBZh2CaBr374L9V
	 WWXH7OoswPcvk6XaUVR3JIbzLFk3LaAvQ6VJ5nBt5sGbhhXIxztuavFvqSXWcXeeRd
	 afBpnx8pYDmPd8BMVaO8iITTXWkd2Fj7mPmQfKWouAuEeVLv4gSV6fTj2LU6uZ/zMP
	 m/Kdx1Lq/PRkoU3arYCXVopuicWoxaOpHkEY7f+GJgV5w78AmfCCNsYYb3WRMAtJeU
	 oNpnARYss7mfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD6EB60619;
	Sun, 25 Oct 2026 20:57:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D8114D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4360580DC3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApSXzlHJXHZc for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:57:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8794780DBB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961838;
 b=lsDOGu+f60uGL2etHmRvX+frk5YIZXEZco0rzd/4RWC5ibQclEs7jNxzp9R7UVRi4FrF
 Yn/k+1/lMqMHb+sQm1s6UJEcZwyDDksLVlOCK9Of5ajqXv5vII5ssKIs8M1fuero3iPDU
 PI71WQs/d8Y6AsPW2VVz5kE7kgnccRnDgDeXzzVGHZmGpFJE54pEILkHRhiQXzqEccPfZ
 FW0dc74eswFwbEzvxuJm911k36226QAcVZ7LEGgNczEIm+iA2n5ymhiLf0ZGFpF2tN3qp
 9JNCtMJ6cdBQj0gyb65Onp9KsiSQJAzB+LQbTc1mBBcN8C+WlTZdqFnRKkaK19xwTkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dksl3wDMISxWVVriX+2iDfeL1iUNEErHUoxqZWUIFSE=;
 b=mpBi6bbJ8lt4oIqB1lRZnDYkOHgcvOhi8nYhWHnSTm4RCR/L+lXFwoCUQ/kSpBMBVZlF
 yB5aXhWQdJddMPt2pMPrsqelk1RDpiMDmaQABoiv6PxwKqzW7SPJT4L5oYDAqKox2iYCv
 GUDiAa6M2FiFM2vtlJCsiIONpxiwEKQACZI87AqF4rvsSxkn0q6nA10d+WQhJoGUOjOOy
 OyYLGPDueJyBURz0+ZwOnPdaLSBcbfuelPW2pSETOqmK776UtGbMQgH00Epaqj44ZbzWX
 jWns8x5lv6JHQNfADzq3XjIDrn6UC07b+ucYXBzMurnUCCYCjHJRBZKSt4T1pL85mjA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8794780DBB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:57:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD7D89CEAD; Sun, 25 Oct 2026 20:55:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:57:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f74cfc46c1346a481e6742f8d94cf5d6784e64f
X-Git-Newrev: 86240fa45d11e3388968520b4a35f0a40954c132
X-Patchwork-Hint: ignore
Message-Id: <20261025205552.DD7D89CEAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: change default target
 architecture to AArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit switches the default target architecture in arch/Config.in
from i686 to AArch64. AArch64 is now one of the most common
architecture on embedded Linux systems. The default CPU for this
architecture remains the Cortex-A53 (Armv8.0).

While at it, this commit also refreshes the .defconfig to:
- align to this new default,
- remove stale options (BR2_alpha, BR2_cris, BR2_ia64)
- add the missing options

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Acked-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .defconfig     | 60 +++++++++++++++++++++++-----------------------------------
 arch/Config.in |  2 +-
 2 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/.defconfig b/.defconfig
index d25c62e104..56785b2bc3 100644
--- a/.defconfig
+++ b/.defconfig
@@ -1,50 +1,38 @@
 #
-# Automatically generated make config: don't edit
-# Mon Feb 18 09:11:56 2008
+# Automatically generated file; DO NOT EDIT.
+# Buildroot 2026.08 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
-# BR2_alpha is not set
+
+#
+# Target options
+#
+# BR2_arcle is not set
 # BR2_arm is not set
 # BR2_armeb is not set
-# BR2_cris is not set
-# BR2_ia64 is not set
-BR2_i386=y
+BR2_aarch64=y
+# BR2_aarch64_be is not set
+# BR2_hppa is not set
+# BR2_i386 is not set
+# BR2_loongarch64 is not set
 # BR2_m68k is not set
+# BR2_microblazeel is not set
+# BR2_microblazebe is not set
 # BR2_mips is not set
 # BR2_mipsel is not set
+# BR2_mips64 is not set
+# BR2_mips64el is not set
+# BR2_or1k is not set
 # BR2_powerpc is not set
+# BR2_powerpc64 is not set
+# BR2_powerpc64le is not set
+# BR2_riscv is not set
+# BR2_s390x is not set
 # BR2_sh is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
 # BR2_x86_64 is not set
-# BR2_x86_i486 is not set
-# BR2_x86_i586 is not set
-BR2_x86_i686=y
-# BR2_x86_pentiumpro is not set
-# BR2_x86_pentium_mmx is not set
-# BR2_x86_pentium_m is not set
-# BR2_x86_pentium2 is not set
-# BR2_x86_pentium3 is not set
-# BR2_x86_pentium4 is not set
-# BR2_x86_prescott is not set
-# BR2_x86_nocona is not set
-# BR2_x86_core2 is not set
-# BR2_x86_k6 is not set
-# BR2_x86_k6_2 is not set
-# BR2_x86_athlon is not set
-# BR2_x86_athlon_4 is not set
-# BR2_x86_opteron is not set
-# BR2_x86_opteron_sse3 is not set
-# BR2_x86_barcelona is not set
-# BR2_x86_geode is not set
-# BR2_x86_c3 is not set
-# BR2_x86_winchip_c6 is not set
-# BR2_x86_winchip2 is not set
-BR2_ARCH="i686"
+# BR2_xtensa is not set
+BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=y
+BR2_ARCH="aarch64"
 BR2_ENDIAN="LITTLE"
-BR2_GCC_TARGET_TUNE="i686"
-BR2_GCC_TARGET_ARCH="i686"
-
-#
-# Target options
-#
diff --git a/arch/Config.in b/arch/Config.in
index 7bfa174b5f..0f1697597e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -17,7 +17,7 @@ config BR2_ARCH_HAS_FDPIC_SUPPORT
 
 choice
 	prompt "Target Architecture"
-	default BR2_i386
+	default BR2_aarch64
 	help
 	  Select the target architecture family to build for.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
