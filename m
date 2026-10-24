Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E82F606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jLxFLXu7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B87813B7;
	Sat, 24 Oct 2026 17:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sA-FG1Dv339E; Sat, 24 Oct 2026 17:08:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E96B981583
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792861720;
	b=PK+bvn+hi6vGjW+8D/Dxvoj0FlMyGeeU7pP+dXnCr3wDeoQ44mWARjYyFVPgeFFl7F0v
	 X8q2wnYIFbOxtBB57xZMbjdmmB3CRFaWFcWo2U6ACqjVhOxlPZjrW+MVe2EzkF/oNFufh
	 88mxyy14rgYcSCMCxE1TUu63UhQBKXPTM8l3vu0d7HN79/85tsrUTye+vgB5zR3c6xP36
	 qA4MDaYEGDcghCbQuak3hiPcwWHM39iZzTrWd/sSuMdM4aUlFpImgzZEq9pPHAPDNkKbO
	 TylZjlhcrSQAZENYevcD92SdpkSHLMWwyfXzzXNmNQTtAeXEJJ+4NUcl4/cO1AHp0qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792861720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6bX9lplb9QMeDkfCM73tgFMP0oWH0W9A9ckapRRYqW4=;
	b=Rb0xqfbsnSbG9dCnct5Mim4fxBw3dhJ6+lqIVXFZiwyt+MK8nUY1Kg5s/+h8k9//weed
	 s54XLjd9XJ0emgKEPZbTLvymjBD5YBIJ/A+SFftNiilNpaD0Aj/AunVElmGaMmIskLe1t
	 e5HzQG07D9fHxISnLNSahWdAvAdKCZbTJKLmlXJiWLosKOBTLNojxMqVzxMt6y6Bovc5X
	 wbTKezR3ZUXU5mVFJTYuPQgVchhQvozkbLDOmNDrDIvQ9a236h2FBCBLvCvl6eTHHJeyf
	 JbcIAV2hqep2qwVwSm2zzVcSDANY0beMT+umBxbt72fOgzP2TLtOuUdFxKVg4D5EP8A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792861720;
	bh=6bX9lplb9QMeDkfCM73tgFMP0oWH0W9A9ckapRRYqW4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=jLxFLXu7ZizNuR0CZMC3rnj5HY6GJc+RMJfnZ4UZ8hSVCBxRq4TMViLY/wZpghhq3
	 whSfNJyF264wMnC0bB3kUFkwf3AFsfbVOEQTTamrEN1gmoa7XxIeL1c9ZMyr+jCZKB
	 NRyzSGlkDfF67htkpjkOlgZ97s+dzID2EzpIr4cOA6BJutzDGxoPYxbgcp+A82WJUB
	 kUi7wpIQNMd7NBbaEfTL0H56u9gFrysdzh24TwyzB7uyMty+nkMoT25ijainEa3Dfg
	 0Ghl2dnB6dza0GVYQa0q++IXGwusdK03soqLaff/qVJqKKgwN4maT86zYlpP87sWxw
	 cc8OMxabl/0uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E96B981583;
	Sat, 24 Oct 2026 17:08:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3665E3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BB934006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhRfpbRXUwin for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D995E40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792861717;
 b=dAfoC4OtyCZN95Fb4SS5qLqwXWPhVz4MCLnp62P49zEp3L7G8fFoKfIDgR09so1dMWgU
 dRxSsGyIWANvVA71ZTTYEmyW7CBVM9uXwDBfeYcj1dXF3kIAX4AS5B0Yk6N6Pu8tpbyIh
 IoS/RhuIxA/uBN8ULlWto9FgxuOG43S+I46MIHjayKFlDp+JGwYfaN4a/tFGqvcJwsQ5b
 uzL3dv1rF8ZrwwnbszUadKyjGLveJ4oS2XNJWg7I5CILFcsSLQ3Iem99ydWuj6RTnjjbT
 GP34zeqIAsxeUzcuN9Vs4CnLAA9ewJkdhVTjAAhFRr413pkCosHm0HfVYVW2gtM6gOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792861717;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=AhmHtRwf7YmkDDkXwiV5WWNXR/7dtMwZ25Z/mQhnvVU=;
 b=M01zz4U2S2Oc/5xCnQBzOr9pp2z5wkXIFsBkqScuwLBT8DBbMkVu7jKp7qS/39c+haNk
 +u/A90FdM47RIMEEA8ioRbxwKkoCitS7IElwNjRznvQBca9qQaL0oqxjCGjSglHNUnY16
 /QyyeYVGeOhQydg8DkE23+EJ3Uu7dLXIe0DXvas3zK0INyqT9JPNvP5laPqhN4jZOLYCp
 PSaojOUxUghRd3LVUppxe8IW3V3/HdZ2srNZRiNoeIvKBfFdoQozUzQGxBKtbYKz4XV46
 HSgIyP55pje9iZ2TxdTIQSxnX5VAjCiE/sw7I7+E67XxKl2/EeX9GeOSS6EruS9G5QA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="P/svkbYp"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D995E40049
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78611B97A6AB; Sat, 24 Oct 2026 19:08:31 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:08:30 +0200
Message-ID: <20261024170830.543982-1-arnout@rnout.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <c3ab76847e4dd0d716ea7cbaeeb5e8fa@free.fr>
References: <c3ab76847e4dd0d716ea7cbaeeb5e8fa@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [RFC] Makefile: do defconfig with /dev/null instead of
 .defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@rnout.be>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For `make defconfig`, we use a .defconfig file. This is inherited from
the kernel, which has a different defconfig for each architecture. The
kernel defconfig passes ARCH on the command line rather than in Kconfig,
and defaults are very different for different architectures. In
Buildroot, we don't have that, instead we have a .defconfig file which
only has the default architecture. And it's not actually a defconfig,
it's a very old full .config where only the first part is kept.

Since we have architecture-independent defaults, and any architecture
specific things are expressed with "depend on" and an occasional
"default ... if ...", we don't need this infrastructure at all. We can
simply make .defconfig an empty file - the BR2_arch choice has a default
and that's all we need. And we don't even need an empty file, we have
/dev/null to do that job.

Use /dev/null for the "defconfig" target if no DEFCONFIG is given.
Remove the now unnecessary .defconfig.

Note that this also makes one hunk of
support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch redundant.
Let's not do the effort of removing it now, we can remove it if it
causes issues when updating the kconfig infrastructure.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .defconfig | 50 --------------------------------------------------
 Makefile   |  2 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 .defconfig

diff --git a/.defconfig b/.defconfig
deleted file mode 100644
index d25c62e104..0000000000
--- a/.defconfig
+++ /dev/null
@@ -1,50 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Mon Feb 18 09:11:56 2008
-#
-BR2_HAVE_DOT_CONFIG=y
-# BR2_alpha is not set
-# BR2_arm is not set
-# BR2_armeb is not set
-# BR2_cris is not set
-# BR2_ia64 is not set
-BR2_i386=y
-# BR2_m68k is not set
-# BR2_mips is not set
-# BR2_mipsel is not set
-# BR2_powerpc is not set
-# BR2_sh is not set
-# BR2_sparc is not set
-# BR2_sparc64 is not set
-# BR2_x86_64 is not set
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
-BR2_ENDIAN="LITTLE"
-BR2_GCC_TARGET_TUNE="i686"
-BR2_GCC_TARGET_ARCH="i686"
-
-#
-# Target options
-#
diff --git a/Makefile b/Makefile
index 9b62da3e40..aa3826b5b4 100644
--- a/Makefile
+++ b/Makefile
@@ -1037,7 +1037,7 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
 	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(or $(DEFCONFIG),/dev/null) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
 	@defconfig=$(or \
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
