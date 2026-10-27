Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74768606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qMveWAU0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F7280DAB;
	Tue, 27 Oct 2026 16:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoRvnyFU3jsu; Tue, 27 Oct 2026 16:04:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 704DC80DAC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117045;
	b=qtu9Y3SB2heVl51k70A0rpxQmZRnpYmwsruFavaLcgpFSFGqk/mUALXy3dz+HYu54G1C
	 hMJndEjrQpVv84bCXd1OEMbwEigP2WOL3lW8AqgaMLiZxA7M5EotOUckG2SbiaTShd+uQ
	 r9KQQk1Mq1bdMGPdnlfbB75IsKlU7rDFqRPIpGhWTPtyBKAezpAkiv886UeXte1aCG6v2
	 vZbBf77vaPqxVv0cI1tGaOocwJirPMtpeJvYdd4jAKwwOIEu5fd9Opf4GhcXHcWu99N1W
	 tJZbLvN1el5fT7kvTLnFnPUNCc0eaNVfaVmBiIJ8PXGESSwA26hzdLg9d+GZMe6hXpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cJBd53oTc+f0zZGJY+Ue3loObiKYHlIY7Yup70LGpYQ=;
	b=pJBH7PAuMMlnBy0AEYtt6gOe/u6bE2KXBgkSpKYIlRjj5rHId8VxFbKydPxGj+1JmvVZ
	 +3zijrKuYiNkAwIZ7zJFZL8cZEtxFMqCeX5AiYvSepV2l2TGM6WHdKMWo4jGsB8HUAHkC
	 zb1rOdCsP9/YZekBoW6UcXP5YrDSrr7cUw6RZGVUdRnLWqi/W8ZNFBhZRRe3WHr/X7cXs
	 TF6McyE1LMb6TcOKgyiDlkUOwKjJu7nJ2Qk1/VYFnXKkYV11nx44KG1c/1ZaDbrgioQ86
	 MUbjfSRLA9QSyaQj4V6zGLEg3rmdM9UO6FjZ3C4vSBkw83xm2RG98GUSjrDX+kHXBuQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117045;
	bh=cJBd53oTc+f0zZGJY+Ue3loObiKYHlIY7Yup70LGpYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qMveWAU03f0ZwMZUt0UHRsfIs6QkYLDpLuTGV/vmkosfVnyXJPCkI8QNEEHZbOX7Z
	 ZqLlGiZDZicdeLilXWrulgyr2DlhTodSh28Z2V8KnAl/maZovoKREqieXW34Sam/ph
	 K37OQHQiQYn1HNminsPM9exZ48y9jDGdlgbiCF8u9BsGuKyeSo8sWHUfrw8h/q4KUy
	 Xc68OmRFvMVG/TJZGEBDSbJSm8G3aezPJ7s5vFVBw4GKa0GpFL1Ltl/ITkmdcFr6XV
	 hJ8vc11ISsUyIuETFj4zYX3ZNhhOV/ygRVfLDmFQ/M30STGm6mnnITWaQbGHvpeg7f
	 A+duf5TWmvp0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 704DC80DAC;
	Tue, 27 Oct 2026 16:04:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0DAC72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97286400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnIwVJwWmuiI for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:04:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D2E9940076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117042;
 b=jLjgZNQ4uYmxYx/KOvlFYm7SGXAIH5gnksw/yoeHXbKdi8nKbCedAamjqhbY1WIjx2qM
 3zpj192UNara/CjfM8oQ40zXVAPWcTinDbH9nueI4rKewUxQ8jezqz61oVBjWg66SUhZg
 Zkn5ikXnwxFOVYzu+hScpx2HJ5/DN8iarlmERXEVMG8kBBjNO2pL9h+JANT98AJO/ZN2e
 2i9/lek3MDZYIjFVf2GPzRovk82at5NbQm0VSJsMkx5Lc6dGAPjha2TQbTtVgIqrRPcX4
 SBTW1j+4PHD79Bq5wOk8OqdIjWg6f07E8jrsk8aIAqwXHiksvqHZEfaDjX06s/S0Hjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117042;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dfs3I9FDr5ZtAZ/lzzs77nzT3KJy2A3m6UzVxpdz9uk=;
 b=Em2RqT6VV/P6lFSF5Za3aFWrx/BjwceRi0O2L25p7M0yFZl/enCx3FIYMdHzM/izBvIY
 XU0+xe0lnXkCpz0I5I29N46uoQ8AVXUtkW2bf+x3L6O+QY+P6K7NdncW4oSYrXnYYNFP1
 4BzTMeCBNjJpXpovVIWEEoFotDcfyV9qjpfeMkGLGLJnG7dbuXJl/bTyxvoZiWnsTiOe9
 +o7acfdi1VQDc8RgtILQtPTgWYfLPuaT+OVRsrqaRzdSKcisIRlXdP6mL287H0B15Yw+L
 FzjQYFUY6wDIlefeG7IHoxy4VW2hA1Rs2LrJugO+F6RHtapEaTA1Zp/+10a3kPQay/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2E9940076
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:04:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DF379D0AD; Tue, 27 Oct 2026 16:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:03:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e49651e266d8bb7742cf8b2f312d9d1638168bb
X-Git-Newrev: 99c3aee78f537afa3ccf5820c68857b2c10e9351
X-Patchwork-Hint: ignore
Message-Id: <20261027160236.4DF379D0AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723bu: bump to 2026-10-27
 version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99c3aee78f537afa3ccf5820c68857b2c10e9351
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version allows to build up to Linux version 7.2 if -Wno-error is
passed to USER_EXTRA_CFLAGS. This is done because starting with gcc 14,
several C diagnostics which were previously warnings are errors by
default. In particular, -Wincompatible-pointer-types was changed to a
permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index e230485226..4b2b71ddb2 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  22d81a21318cdae23ab6a65bed7c24d7cc98e7d1afef7a200804761c72036019  rtl8723bu-ac3d2f564bdf6816f1e3a3384524dc1a966f78a3.tar.gz
+sha256  eaebe07d38931408c8f5dedb3a8c61e251862e0b8859b899d193f9d5cb77d748  rtl8723bu-8292ef94965fb61d3052ff2bf068fcd830e665c1.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index f1c4eda4ed..4175d02d52 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = ac3d2f564bdf6816f1e3a3384524dc1a966f78a3
+RTL8723BU_VERSION = 8292ef94965fb61d3052ff2bf068fcd830e665c1
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 RTL8723BU_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="-Wno-error"
 
 define RTL8723BU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
