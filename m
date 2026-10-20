Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAA0606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 05:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LU9zEy4g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=j1dKN4rb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D444810CD;
	Tue, 20 Oct 2026 05:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umliGQs37p2c; Tue, 20 Oct 2026 05:22:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D1AB810A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792473733;
	b=byT38GW95Ot4pQ0A1wOrfwsp4uGHVW8o7qEqFoV9mvk8OwypBgeQ10w2LvOkyumFYREQ
	 Xt6xRIrIlXaHNhP3icTXsc63hqoMDSp0Jo4QcatgzB/L6e1f3Sfi2yioeeph1UoQptkBW
	 uT0so3bkT+ODfYrrX5N6O04qoRX78inkFBODrCboIVHTnfDBVrTBhSVXPqggyNkm28tnX
	 vfRCUmDIjYdCvtF7CsGR3BACRFdSc3hjV6QZjfQHyaXPBsUUbu0LWDlXObcOPKKqLPFJX
	 3k9UuekAmtFWPZZElmZwMGOqrWE4COaWN8PzozRp/GbNLtU5nqYcM0Ycx7RMfFWEs+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792473733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y8PoDOh38/Dp0N1Bnc6jLz4YaZg/wMbhqZAGpoyo7DE=;
	b=Ln/1uUoesc3MP7Ek8cHb2qCqP55hbTBEkqE/WdBWkYkEqcWw3y4Jb+s95FGgWeMZ+kpL
	 HeAvuVlVNXMbR9e+5QlOZl8yl98vCSSk/c73vYo72ugWF8+RBy9BcRjegbrxcvJ6y4xJN
	 Vw2Y7oGGhcjFCsa/LlgSXBvvOWm8vdWOP+UHWBbQjqHPZ/aQ7/U0T1QF1sHvIsTloVS65
	 umSbKuKi1SgFOSYR9QDO88XWlTJ58eeGZWqjpu8qQjaCsQ0OEEfqxOrGMLggun1agfoXE
	 Dg43JJuwfrrm6RrIDSg19B9jUjSd0GnzUcdyP2KgdGQ03tCDJqtriIVfBUoWJqD731Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792473733;
	bh=y8PoDOh38/Dp0N1Bnc6jLz4YaZg/wMbhqZAGpoyo7DE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LU9zEy4gq0CAtsHoSEsVXoNsWNY8zLBWihBJvf/4Cvr+nOjcnT+XoXk6RwPFHL982
	 5LFQR6aCtspetLHYYKJ6CIOhhJaxY9wjzmz+3Ijq9JxshlQQL6tl4+nrV4IxcTj7Z1
	 mj+YNpqfptXTkmHjIsXyCkVG14AOkzKjPTYNSEnoyvQaW1Jc4ss8ZVN1LgIzU7A/32
	 z/hoQqFCLLR7vlTIftcetguWSSxNS2akfbM4VxbAeCxm3Fu1TYG22tHQhyhbSAEBiS
	 M9nCtigZvqGwIduvXNewn7ge5hdKE3SBpaHDGDXPvg2Irt03P4uj4MWuww9hSH34om
	 H8im6pO06vmIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D1AB810A2;
	Tue, 20 Oct 2026 05:22:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2061279
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 05:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B77874080C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 05:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id med5sK5ArgV9 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 05:22:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5FACD40804
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792473730;
 b=UMPaYSYug5/YhC+S/0ZHys9YHj8cAU1+sx6eithsyhnhULCgRnkt8pyEw2ydLYlA3h26
 Mz9WQwfu3GVxvRBjtjibaA5HmTgsCxuXJXi67/LLdsUF9sSAtMkB+4yK1b6TobKcC5sK+
 ehleZbVpzqjFfbl1uvHFipgU3pouf0Ym83UHmQvH2Ip57vy188KoC+qQNMTbveQ/TXPsn
 aDPqDi5AWtu7bPVu3wUoCYGMLvFAOTDc0i5uVTvMpZ1ecvAw5iDmGJ1A3inGKNYkKYV9D
 x3XB5lIsa8HH6Rpk5uy6VnEvgwJ632S4tZU13K59AZrfi9ag7i1Bj+cjSiSdDyAnGhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792473730;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oZhNHL9+8UwKgh3knWLcdG6ZW/qANWQyOJRKmFsTTQw=;
 b=I/luGzbSuU2fL5mDgaSX+4DzXjUOtRYFhsSUtdqZIgp/apk4EtSpgMo/EXXH8CH75Y9y
 sMQrDtoxDgzZqcmSf5+ecjPyaQtSQLATv9gwpUJ8C/UQnKQ2kS9FFHxAOXmedVqn2/GDh
 FYjAUh8oUVGt0tjkAtbZJrv3vW7qus6E2H4CstS4qk1D8u7RYqpJMccnSGlerhJeRjOPf
 JiKxehyge9aAFFz/BXq8Au4BqI5Ur56HgA0ZmsTvoHnuVTg6Dk22ZEg3ALRBysqThrD1u
 nlgG2CyREZFys5ildzPLfiUcEDBF96Mi7vzOIvWipn1pW7d/EZmkR2Ex51+jO8C+jBw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=j1dKN4rb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=j1dKN4rb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FACD40804
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 05:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792473725;
 bh=oZhNHL9+8UwKgh3knWLcdG6ZW/qANWQyOJRKmFsTTQw=;
 h=From:To:Subject:Date:From;
 b=j1dKN4rbevyF1liXNPhA7k3mYKsI4kJ/5HqBQBxd2h2wdi7Iih6ptQp5r/K/eWcql
 mrYa82wUrG8x9LK3GFwo2+Xz8gg0/vAHaOtRLSLExfGCBPZaLklWelvZJTCrg6tZXs
 q7BXe5J4kDBglIU2dlrEGBzysViKDhqPvkRPPsm10zauzOEKBuaC8arfnosdw0885P
 ypLY4Yx7M8XfZrgwl2neab+eAv5334g3Furh8mwDNT/iSKu0h9IiqcRrZC3llYvtQz
 yTj/xweCo/NId+tHMsZsW/HSp1tJWWll3qD/ZhBid2GrkkxpJkEgBBn2OHKPvksS3I
 zoEw6fXQ4a/VA==
X-KAS-Sym: v3:f51bdf72230551df:MIrcfYPXBe7ajkr7q7ZabW9muo9HMX6pRUMvCXrnXmSvl
 ilBn/bqMK15CEuDG05P+JUCFnQyaCl3jzT0KiimMpK1Kej9w6mnIRVoRFGLppnhTQUzumbFVi2Z
 1LuH7fJ8QVO1Xz07wjWSmOoGDEzFLm/2qK75KcFg2SsG2cW5DrfLUOrnUjzSof+0AcWM/L7hB9V
 VsczxorGokvqUWkymlr7/lxcv5BXPK1Nb1qmWi/PcTxz+/T4SYdhNz3/zJS2AtkFDEI37fSyKPf
 Fq0WqPCWBrblww5Q1VPZ+2hmWNpVKMvTAiBNO50tZM0a8GJd9otkY7D5HsDz2+G4u2OUQj3w==:
 fMDOGJ1uJclVnjQkKGCYQdPO+VUys1OWhvAqkp2hhTyAOKfCgRLwszA5DAJMKuQTIoT3Sur4KoR
 fupprFPQfhGG321oZlPnZGrsXLOk5d2JuYKpaiL0xQ8+UaLI1fhiyIY5sbt5QHOm8GORk5KLCtz
 flRDfA/uWBTgvNk83xlJbpD2+I4xpPn0s/1LUVKH13V06JV/LztfV9mitvwQe+lVcZS8M0K8a53
 VFjrxvPShXub7jKL0SmTK4sIOop5X4NZ1+56D2kUHUqt2JmVo/mPinKydm5MllnsR3Qz5Kg1x1P
 f5gK5/WNZwnvV2OfnVI1w17dRqb/8ycBKQ0DnWMCyiYpngHZZ19vfdkvkZJfw2dLcmuRQakkIdN
 hVB1aIrLDzyKbgw5DQvpNONcv24nQR8rjMHRdMFXTd9rftRQLNozXGn8TIBQtuWHSbiNGYtPIKv
 RvS0+PvReyUu4VR0tn2BxHLniyjhBk3hFdlSTYyxwVrtblqJz+rB/cURz9gMBUtaP9YPDXBOfLf
 8s22X2bMwVY5EQwAq1Ky3tLhTnkGoDInnglVaE2DjC49IMXDxcE4+dEz8M2g0e2IVnBtisjHJ62
Received: from fli4l.lan.fli4l (p54a1bacd.dip0.t-ipconnect.de [84.161.186.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76C50A4C5E0A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:22:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40500)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJ2IX-000000002ci-0sUs
 for buildroot@buildroot.org; Tue, 20 Oct 2026 05:22:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 07:22:04 +0200
Message-ID: <20261020052205.4504-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.4.0
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 03f85c2888..cf228a2062 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76f41c06cefc91d57e0b7d366b7a91b8420ec77939326491795f9fb26afca7e7  intel-media-26.3.5.tar.gz
+sha256  ff70ecafe7f5efe02009b723d640a05dcce5016eaf0a6df60c2276df0deff101  intel-media-26.4.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 8cf39a24ec..1367d3a59b 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.5
+INTEL_MEDIADRIVER_VERSION = 26.4.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
