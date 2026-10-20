Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B52606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wr4obUkT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC479810D7;
	Tue, 20 Oct 2026 20:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2tcTaAj_wa1; Tue, 20 Oct 2026 20:26:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E24780FE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792528017;
	b=QSnOVt0w9rSZ0xDZraOp87NZbV7cBnAFyI+y28mDs7rirIydVEW5Gg2bDTjEC5kDLlIj
	 6dBKkQziq7jYwEl0+ZVsC890eIOin29WYKGGd79pg0aoLO8biMwkdDcXdHb4lVmcHWBTA
	 aVz2wJf8h2Sc2h/bUgVaLyDbTSGnTJ6n7IK1PzcwOKICa8RBfU8tFhMfAvELRVGliMVFr
	 S805Y0Lmy5rKT7GIsbOmpL44gjtNDYWCOPGZMXjvjpf5946xzV7hqqJXuP5GC3+wqHhT2
	 L4wrNDf2JhneCbyjkAtBCnD3fD0tS8oSgnJf5RAiirc6qv7S4ndyztXE9sJebho83WA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792528017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CU/EMEEIiX4hGX60p+n2buMaJwpt2ggpBe1w76nhaOY=;
	b=CJh4gWSBSRwphxmVqFYwMSvOm3/u7D6+30aAx3yM3rNFNlCOBMpp1h3sLbGhVe/rjd3l
	 meGDuMpfZwGXS2jIiyvU/F+iAovHnRdjd8V8lMlT5klH3KMu6qq5ASJAfbludqTyuZVi3
	 wrahLD0k2lwzhn/t/UA57HUrk0S00Uw8a91O/nZ3+a8CXjRkyYv5w5kGw0u6ix9rB4B8v
	 jyyinJ7KJbpmgf0lc/QBTLOJ6zf9Z5tBOwwP+oppFIjJfTYaBVxMJ/l+Pyllh4rP5EDSs
	 O1SUweqlsgjj5JSCGi7pV0ctbaHfpAFiT5A+aoqVXnDO0R6GawAZO7pmeye3xU9R/fg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792528017;
	bh=CU/EMEEIiX4hGX60p+n2buMaJwpt2ggpBe1w76nhaOY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Wr4obUkT563eGqG50A/OsSaOdfq2wfYEK4RKO3CxXK3y/HNjUnDk/8rJMnnGNlPli
	 pBOuXq0c3/aytslbGLy07yIkPsw7XPc9mv9Oz639/t+AH1Vuf47sFBJ4QC+gWuZXDw
	 sBwHW57+kERpYsj9CLGsr72vLfdTcUNXKok4fdQAUOOBq/qnrR7ml1VH2J/ZhdixOS
	 37fw+rENlI0FKVxB/iAyFO+pTS9O855fhMmoYlHr13lijkNm2aWZZn72EYQ6GheuFY
	 T2WFqNlpEhV2R+izeHuBfruxtHg1SsLyd6sm8Lt+DRWyIiYEdQWthDQ6aApJ/qXtw9
	 Mzmph3A/Yga4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E24780FE8;
	Tue, 20 Oct 2026 20:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B2A5255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2123A40112
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVeVs7jTVhQ4 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:26:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6B0D44006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792528015;
 b=oVdu91lTgr6c9Hvut3V42CWeu57cuov52CBBuoyYaVbh0syzOcf9HYk8CRPAjAeaNdfk
 1RT9SKe3U01Cyh7lWi0cWXIJXstsg3vuyPFn3NEPtu4ztgcsVGjFrKE/0NjZPWT0O6sk7
 TfgYcquHKNa+xKkrB0rPi5TZiejEypWXz+87sakCrIZFJJMy84UI7rx6KnmmsA2XHVDhq
 RkJBptgLR7cuxwyRTB/yaCAhOlilzAzV1/BDLgW4NZSYwzjsrvjVsVDKoUSRQCH8mdLQU
 nhVtfvvqBbCajt+zeBzgr8k4/GsViOeGxFwvuIpgZyPFAplat9Ml6YP7/lYZlqFK91w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792528015;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LE+j7VVK8f2LcO2aEJD/rsjoqi0Z0y9hJPCTRz4RFsE=;
 b=DTBiGqPrCaRPhR7NI5Zlzn3NSvvbWmJfx4BYEtJMjP/uc5NewmiJx9CX/yvNvr9tzUZa
 CFpj9Qvox7vQYd7PSU6SbREcIIk1PsISjWWw7gCI9R0IU+ZZm2jK5uoWH2O2Pc4MhCauJ
 3xST9DPh1t/MDauL7M4ZuxpxEFG/v0UH1dElhSOYL0Bn+6PHYd4/cx8rBXPapTz+8ufnk
 +1JLncJFpX+jo3P6znq7vTZMhQhA2d9tpT81qqIutq01w6ghppmYmZY9nu2Xcx3nAhbor
 X4Tzm721cHhDBVBEeONhEw49bZWycahTpVZvPXZntqcOEnzVBlLCatkXJBrlpbrMWow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GfCWRb6O; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B0D44006F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:26:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 27720614B6;
 Tue, 20 Oct 2026 22:26:49 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 20 Oct 2026 22:26:36 +0200
Message-ID: <20261020202639.1094960-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] Revert "Config.in,
 Makefile: add BR2_HIDE_SECONDARY_TARGET_OPTIONS"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit 4642f903cd613bc52f9bb8ea94c4d0ab18464c92.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in | 4 ----
 Makefile  | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/Config.in b/Config.in
index ac58c685d1..09806f5cb4 100644
--- a/Config.in
+++ b/Config.in
@@ -15,10 +15,6 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
-config BR2_HIDE_SECONDARY_TARGET_OPTIONS
-	bool
-	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
-
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
diff --git a/Makefile b/Makefile
index 490f1d419d..9b62da3e40 100644
--- a/Makefile
+++ b/Makefile
@@ -258,13 +258,6 @@ export LANG = C
 export LC_ALL = C
 endif
 
-# we set a default value here to avoid a Kconfig warning about unset
-# environment varilable. This option is passed as an environment
-# variable to be controlled by autobuilders. The purpose is to test
-# less frequently some uncommon configurations which tend to generate
-# more build failures.
-export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
-
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
