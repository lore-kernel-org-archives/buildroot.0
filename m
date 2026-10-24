Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE7606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YRhZJvCU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=NyU90lyQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF161406F0;
	Sat, 24 Oct 2026 19:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qir93mxhixo0; Sat, 24 Oct 2026 19:31:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D8462406C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792870273;
	b=TFb9ANQ2vo4RvRg2LSh5zRc/vBV6dJdVxbyQKmO+D0j6R+NOqTenffTbcbpgZFwqRTd8
	 e9Dcm2IvJqjiD17Kl/0LKo/ODR8PntuADHKahvfKQ4qGWRVecEH+m0OKR1Ps+r7k1g+pR
	 I7Leh3h1pMpvVXuS22XZwN88DAnmCW3oza6FQvZKyCaSeKoDFFAbsTM/7DecjsdYcdh/C
	 woS1uQT+ciR+FCLV+ZpCr3Bo8N2nodL0V5S2QychEuovoFz2I5bm3oKXqkST+ghkfLP9K
	 D9Eic2BIQgemDNiRanRinlxijdZcQL2r1H91sAOe9S1wfaGKMANO9GSNb1dEkKHlujw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792870273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=obZ84oion1x3TFDUyTLwPjumydMQn0kExmxkgObqU/U=;
	b=IGGWk2cawQxuFo2d4wsNO0s4cckSMlDqwCmhrrajNoVIcYqHDWN2EmEEDuXTIr01UNT0
	 8fLRNI4aTqbM/HV5Oa3K/a8IQzhPkE5l+IMhr7TdvjkmCVX1QWpcBbcih/b01Q5BsRviL
	 ZG6YAIwh5Xs6WVeKZbn0Q2wqLFMivtgXJs1ZTgfaWb/ejxUyuac0P6SbdPu4fSru3nIlA
	 QC1P/JzX0imkik7MbGVymkKLUCanvvjQekkLLju9+kKYoUezdPc0RiQ1dB/RD1wC8eABy
	 xuIrhGFcHx0Q9XK5lm7sFGXz3lC6mbNRamch87wmtRUpuaDp65tROJ0zVeQQCWy04DA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=NyU90lyQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792870272;
	bh=obZ84oion1x3TFDUyTLwPjumydMQn0kExmxkgObqU/U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YRhZJvCU5JGspJY79VS74WeeYsj+52uGHMEzukXjZxThBlJCYDPUwQhQFMaN3B3aq
	 XVlJlnFTWZFyPqsE3X3fRA3A0WU7UQcninKmCXYfE5fZXykzuYk9/+MGQYwBzNIyba
	 YqA5sTwj9lFhEq9mzVMUSeYcbdn7d7JYAdJer3KwWwjrTlaAbLX2KkZnrS0pURVYYh
	 XB3ODtE3aLVp34zEIKWF7dd2ICDt8NoDeUkYtcuq6Cmq6252vja0gDBVvlY6w+QycG
	 YlSdh7X278UDAx3F/1WwJVMspxULASmSArpDEzDxG5OofuFBVY5uKEXMd1Qef5EvQM
	 V9did2xrgtNLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8462406C3;
	Sat, 24 Oct 2026 19:31:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9683B380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6D4406C3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbUiImZwGROH for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:31:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C6F0403F9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792870270;
 b=iUhztL5QSJae6mXXvaGrQljuqgOPzU+bbJTTc/lvhGx24pLvS/CpTByz9BJ1J2h8wlLa
 5zDBMsaBdwv4rx9pDbIr7VyGciWhIu4Ou/6j8MVIAXqKz4KtlM1O4HaJIUeUo85rSa4cv
 B78RIABP6joACBg3R2gv/noK0fowHywdQD0+D9Ln31Hqwbt86w32svU6eFJF/tCo29hAw
 sYhdZtc+L0UYsoxlLYXqifjnoi9/h/S6XCHuZjSyWVI+T/kQTLT/p350qgcgKQJbSsRiP
 htolZ4H1xtgQ4AhofqXYwrr4td5XI8ruE4niiqN/OBvU1xhGhXPnm8ZvBBLeiwLwLWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792870270;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6K7JlbVgoIJrOpFLlkUEB3zqfxyt3vAn7RvizayjF+c=;
 b=Y9VYQ7oera1x1B0UZleHn2SotwBgIW5mEiZg2W5KGjqLgjgg40EX9nMC+gnbRtMqKdWU
 mm8DIUxNAyeqfLw8ds2FttrR/X2H+SEphpukRDIqq6lRosrNSYp/b/mlWltLWVDUz7uZr
 FTPKjwzzcplRZ3gl5ZoZZoKFAOF9K61OB84tOte1oVuBjmnVDO/K7QpvcEho4ER6oeh1G
 jFMpdF3uh5Xdd9/mORG4X8b0Y5aW0ythGL4jREo+fanpt1+qbdryyzIMTISep5Pr+Nh7D
 P0K4PpikKmmDjUlwFEyTglBh1ROu9VDaIdgznwn8VtEQ4NI0WBKpY46p5eOH3qGpZxg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NyU90lyQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NyU90lyQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C6F0403F9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792870268;
 bh=6K7JlbVgoIJrOpFLlkUEB3zqfxyt3vAn7RvizayjF+c=;
 h=From:To:Subject:Date:From;
 b=NyU90lyQF5T+H9gNB20ubsc4X2RDSCkKLWJ/XuSc4dNJuE3VowfuFZcPwliJgzQAI
 jyKbc0Wdrn9wDGELHQYCcrL/kwx01KIk8WVmxMT3KByO1Zb0NocXGLQ+c72tp3xmoO
 iJqdPVAcDDHg1KQi8tjYIncqieRkefjE0D4bDxa099pRZnfRBkygKy7YsFh5tPetmn
 uC6nBRCnu1h69AJLH1Aif0YeggsQSbmIPrGhOzC4Y/cTTh2mUpv15VNzQGpLCoF41M
 X35ounrO2D5Brx7xc8ZjpciuBRAtQkgcZKq8XIJ4T6I0mChdUnz7wvRMJcDe/uJ0KK
 r7pHFIGDeUCKw==
X-KAS-Sym: v3:f51bdf72230551df:LeAQDhOZ1+2ikTUoEi4XGJkQ/1RsldAnNoHtMl3bTtpa1
 QgRdRdE/7tGnEaFOAdpDbPMF/st29yIzmPop0e4lw4HlCJ4Z1I5xCOY4eSSMRjhkc9EOQsJP2hn
 88fD/gpnAW7gBNYhyQPGbeTJ17pQVnyHOt40t93aySsgjkceVjlHHmlT+8O34nVWedBCUrRQibH
 PhX9lR6x6PNR8JwLugdvEWlWcotyxrgyx0/pz3e+HDXX8M/YwhEjSqT9fkGxXhmulGbTc8hGMnS
 qMNyOHHC+ql7tS5zz1C3YNMZ6aRQtTQUCNKFXiz6SFN3okdKvfKrHxFJhQlvejRGJSHmgKug==:
 l6aFyG6f9NvNwlkOUjIqYMVyZPQ8guRYZPS+gce/tZmnl0NYZBCqJzQrxVmTsg6ARbXWF8RLOEW
 ljbUjC6nySVL33M1WfwQYFoO1BJHsE9BrOHQcN3nnkGwpvP5tGku1r+AU1Fw3ReUt3KIxoT8czT
 Q/Uh7sxPrrV4dO4s4DW16fzdHApdLVhMkKu3d5uFRmmVrDFXRhalExqKjvKEf9OzL/OXnfnM+H9
 kQCjz9R+AZnERxl7xIaNist/TRdZmY5/j4azjnCiu0xRx8KePP06j7D2+cA0e6nmmuhDQ+WoBa4
 fkd6OH8HI2+uy0OChZvjUqMni/q5CLnG38u3SaNLrNgpv1LG909i2eGNtUSTNCYvDhWEuFhzEwK
 TxIbVa7uCJnTGSvwXXffe1I/PYvcRHxQU/r58o2TnkppNyPdPfATlZhUVa4mPZSzdqdyvs13Eyh
 wmTRL/QHmrMwaXVt5yzjtwFOYInMM7ov5JaCiLw740lRIDOf5XcrnFyJqA8ak44rKC9pG9XRFZZ
 R/j3gsUM5Dr48UZ3XhQWICuJspqcWKrulxlkulRhl+7igwrDlGJpPMsA+F+g+Uu/ox0gIQCh6hX
 l9wJCYXaXIqLsIzCkTwmPWRon/yB9hYaO2OTYxbrQbF947U=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3584AA4C2F19
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46866)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKhSO-000000006kF-0WGh
 for buildroot@buildroot.org; Sat, 24 Oct 2026 19:31:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 21:31:07 +0200
Message-ID: <20261024193107.3293445-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.25.1
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

https://www.samba.org/samba/history/samba-4.25.1.html

Fixes CVE-2026-109411.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3c08adc27216286fb2b4c26ac498488f00fd1937

with the same exceptions as seen with the bump to 4.24.7:
https://patchwork.buildroot.org/project/buildroot/patch/20260910203818.2550925-1-bernd@kuhls.net/

This bump does not introduce new build errors.

 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 10d881b093..5b4e95639f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.25.0.tar.asc
-sha256  2e2cb7296833b35b8f7a7fb76045e0c57adc0c2cd03264b37df5d58e40f28437  samba-4.25.0.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.25.1.tar.asc
+sha256  7f367545bca69aa96897628f82f0f04d4b66b3bcb36cb978b9bb952c4b4c428d  samba-4.25.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 1fd73b2bb6..a1f056b0be 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.25.0
+SAMBA4_VERSION = 4.25.1
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
