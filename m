Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A81606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pph11P5+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZVUp1UAD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE40406CF;
	Sat, 24 Oct 2026 19:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDxDYXXz9a4P; Sat, 24 Oct 2026 19:53:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 589A0406B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792871580;
	b=HZGnds2af4QzEsY++LKU/0MgAJiJ9dBL47VKVg2XXTAtMaJEFRGK4OiEcXYaft9ln+xt
	 +Vl4jERhnaWP7+PSSLlw//+kA8mnolpEkuAzTakFc6YYgw3aBY71pI4KC7oYX3+/1OaV0
	 /ztWTOIwl0RojgoMDOQV3LEcEd90JEYeCxj8rQtB5FEGgLxp/PS1p5RN50QA1aA/0OipY
	 TbGUuUJcO04WC9C2aKkcvJSD1ntnmKXJoVwWWxkQEskbSwS4Dl/iKtZxx/YC6CncCmV4g
	 91dgRPJnaQSuuRpwoz8EvXXA3E7FLpMv62yOM7bx/tXVrVjPY9/0wItTLgT5Ev/gYLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792871580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AGHUlLkmkYoDtajBVGuGvtdJp8+qVktNiDECjyLDkPI=;
	b=TUgjh3tHDLknc14mRCMvEfquYS8z81IcAFs1v6oecgrd6VO1ShZFXkSTlpouAEHMiMHp
	 IM1W9+8o+MZn68bgh+c0UwIKwkJkJUSAvCYwTHj8pw58IUkTawYcw9EVuNMAxOxyLnTTk
	 1MJDDHwTnt4Dgfou0+Glq1Ahz+FR3dYfILfbuc6pTLWszmFy3+D4OvxterXJOcbw8IuB3
	 zJsDGp0oXPRN72wQ4OlSF7t5vlLY1YBF5TjN4nKPNJet5IQyRQSR84YkMnS1HfxIuFHz6
	 JrNY9keHz6LNkvvdjSOuScHyuz4q5wEGZwlygXELRuHEMEjzi+6AFNShd30BaW7iFcQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792871580;
	bh=AGHUlLkmkYoDtajBVGuGvtdJp8+qVktNiDECjyLDkPI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pph11P5+4klead1OX1kZSmjibDcgnK57Mh54eGIRNAaxmkq4Ja4DyFjV2eKz5FXyJ
	 O6nLXPwzPB0Ea0iU+eZyx6maUjJO9KM7G8un7Rcigi/qdzHWntznrD3bARteU+QT8J
	 q7RFYbwveKj9+oSgwH5MTxR0ub8DYZzfLKT2gK6dxe37qgqZ36nfiJOio0mBfsH9Yr
	 aYMJoQaAvAsC7nYAQtgduv4xIZPEqry/RvbulBKYkFohTclw4Grb8zc5vaHGwLkAEB
	 Z6U33jonMq3Xy2sK6QiEg+pbel7IeCgRR72ZK/MXIhj1wZAfVddDYRuoO0rDNl6S+B
	 asyWyO8+WK2SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589A0406B3;
	Sat, 24 Oct 2026 19:53:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B0D43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8D9F40079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Slw0Y60I8Zke for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:52:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 96939400AB
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792871577;
 b=FOKvnQvpxJDtUF5s6h4qtrU0klYqg6PVqNDQzGGEqDmeUJZHr4kXd8GZveAEsYfP+g51
 XuJEAdZvomulnRFp+mGb7NQmTZyUmfq/deyrqPtofXNmmVU1FaNe+Y+EHN5S/U2AmHuJ1
 7e7Gq3Sv1+lWHBOlT5HaO2ztlBHZ79EIuluka9d+M/xOBrhL9m8Ox+B0lqDLjUK8OWQlX
 /m/3hX+Oj4rYHXxZJiH37jL6qinp8R1zYpXURiQul90iBWAN9xx79LwAs7f7LDIk+HM+j
 +AlYDygBoauUEc0pwq4oaG/Uz16YtnfidKgbNUGKRwSa+CW0hTGyONCLJRlEnFmTHqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792871577;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6vN6amST7c26Tt/yHMbZ7ER/J3eFFoqUmCkT23aar+w=;
 b=exEy2zYiuXRODcIat75VjFslwtpmRSHttMH1diARyBHA9czg/nuHL4rwEYi1Nw74hhzU
 CA5a5l+NMFbg/dTbOtIfVPTFpsYf7U1r6ucTSILxNWJf+swWbIZ0fwf+vP7Sm5sgn2+GV
 dXeXUxRMfKe1t2D3fjGO0kEBwXNVXqA/x7fa6XiLsBV0H/rkmj4nt7583McOCYo0/zJoE
 iAQtBHZbgFlrY0BF59KhGFSO5AXZ3KMVAm4SB68u9nr3A/HAdjkY5a2RUO+QCf2Zf6IZ+
 s48dBjC/umbeD+/dwPc01dn7enUSc+CmUtqCad4QH06DEal9+mnkIHmo4bPr5XTLJug==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZVUp1UAD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZVUp1UAD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96939400AB
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792871575;
 bh=6vN6amST7c26Tt/yHMbZ7ER/J3eFFoqUmCkT23aar+w=;
 h=From:To:Cc:Subject:Date:From;
 b=ZVUp1UADqmHfo3jM2q6gP8Z5FP242uWsKg9QAWeU8WcGcFqVTr4jRP7+6U8nD0eck
 GnhhQHMsYuMc5zbMOTvLmkwQE2optL5/LSDguikJBkLka5HD/DF3qMPGlPn17tF6Il
 bt0UlpQVv6qu0uX9DSXThTT5E/7SjKBeDRE/RevPVCdiscdJzaHXJHOqtNY5uYSVHo
 ovp9T4p990Bx/LhOcvCuUfuhlNUPm1wRc+6s9j36njjgpIJs+Yc61M4lB7+g1pQIY4
 97Fs7L+1aLd0fYgm/pZKR2Hz4aCpC/yFLpb6PM45ChT4kJRj8VemxYVLSw3pyGkFOf
 Eqq1YpXwyQIsQ==
X-KAS-Sym: v3:f51bdf72230551df:RK2RAa5/4bJEhbv5A3JafT09qiPiwfab5QkjhIr22h9YB
 IQzXr1xxjLjEEXivPySXwX3wm1ZMd7Luu5s4+Y0sbJpeIt6MtZYXUDm4J9ol2f04yHsU96FCAGm
 GYE4mwDDlvyr94C9zFHinb8HR8jxHpY20sj4vz4YcFaDKmWLCDxioljoprDFsT/GnHFN+/kzfeb
 EMDiyIhmkCgl3VWn+0MMj5+0f5Xv1CPUglCRxduGsUPhRD18YtYBj0cw8bXU9q4kynNPHOxqMvt
 CxXim+GeKsymb8fXx2juZsBwlLobBJKOThQd7tkL5yoDwicq0MUxcwCdI+t8NwsHMUPkiT4w==:
 d0xL+CoD3triGsj+Yk3K2VZUayakR6zyuvluk0uJHF8gDRUgj2TuViYfFO6TyktcoCXuccA0NZx
 mJexT3b2088PnYj9EB763UIF6Uy8sYG6k5prO/GcXrvH7Sgq7GQ/3SdE9jgUqS8zSgX+kYWCTc2
 ajeYJgBZLKx0fjPcr5oKoQcdD5Ukr1V1f7Lu923OCuIJeDft2DaqjK62ITZmk9CKtTUhEKVRzQA
 2Sm7WzuulDd/08sfos8r4fjQ1sQMYCtcl3sbuAbAF8FYNiEMwSiVfipnXODbIu9WFMCXT/gByhx
 NStZWqQkSDyjx954f2RG1AxBb+iz6FXXh7zxRnSDymUtRGZxFj2PZEjjaO30tAYe02TqWmr6Axa
 2caj9Rlr4EsWTkGmNs9/fTk1TVcto+ZSuHzAsR09n5oOzqFS2NVVQA1g/ikWOZuTwLcNVq7Hguq
 rWiLfkPrH9Rob1EO5+PlUC2aWdOXZEIfRG2ltP9tUGm2hySaN3ZRSEx9alzVf6JNfZZBVIYmYhT
 kXNd99impIpki6HoLgYil43q/B6s3VLgqgzFMNwXlsa/vB+FXBnyxR108AROtXKbjljefTxqNX9
 qBBoZpglomMCUJcIrO4blQOF9W8XuUKV17dVvv9CswUVyowjCfpAINSzpi1jE42L7VKCVE0/ACs
 4tT7XaGVdhSUXTC3EB8JQYFCc
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33404A4C6963;
 Sat, 24 Oct 2026 21:52:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54802)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKhnT-0000000025h-0aNE;
 Sat, 24 Oct 2026 19:52:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat, 24 Oct 2026 21:52:54 +0200
Message-ID: <20261024195254.3299917-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump version
 to 3.8.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/libarchive/libarchive/releases/tag/v3.8.10
"Libarchive 3.8.10 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/683e8c7946cc42fe0054f26c840d7e9ff3d4fc56

 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index acd4b9ef22..cd5943ebb2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.10
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
-sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.10.tar.xz.asc
+sha256  56cad765459d5ee25a3b761f90c47d99379d28297fbfb72d908880d6b875fb96  libarchive-3.8.10.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 88dbf2a48e..75cc034f6d 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.9
+LIBARCHIVE_VERSION = 3.8.10
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
