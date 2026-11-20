Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1E606A6AE
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 22:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NW4DnIw2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B98998143B;
	Fri, 20 Nov 2026 22:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syRwoitNm_SX; Fri, 20 Nov 2026 22:15:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA533817A7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795212946;
	b=oeJ84ltJhPdS5Ndyzy8i7zFzbOlmor7Zcs895zPZYcDW1XJmeG41FfzLg6UFaU8iGJGR
	 6NRGNitdD+qk3bTePDPWhJAIaNm7Qa4z8IZ389qtbMle7+AfONxk8Z925px6ZtlA5kwp3
	 j/zXFCZQZ3dFG0sL0m99raM3mshdQ0dDd6vbzcbvg23nuNBfgRRBMn4as4SbpcI2phNEl
	 hRwwr7xknANwzVixlSPKWI3mZy23FGhDG6/eRgljVavVcWbHP3XIx7q7JhSbeFULW0QOp
	 ckgB4ZxOKpe6q+imFW34C6L7bIwnMpJ75w75f60vh9sNtmcGhS0kwrAx+kxgsLoUk2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795212946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7FOJyzbWoBK9CRjbHTITYdR2vjzzbTmCsGyF99YpLNs=;
	b=bpdo7bNrgWKZa3ZGUDnVUQ8vbBLAt9/F31Q1gbTSJvKEnkMV48GsS61RDkgbJCEr66mj
	 lvhOY50c0bjcEQ9y3SavVjC9MzrqM9umnuShifIV8IXLHHWPWb/82ZKn+k/BI60YYPISB
	 mKhgHhcDVqBGomB7/NlH2UWLu1YFYn2RiA4WhXIVYWEupZGXwt43tV5Yc9C6zWEyZQnWD
	 vXrQj4lmyigM2dktrevUhcJYvHkAVmskM4xOmcLnDEeXvV4Xbkoa9J1TPThly7lgIxsjN
	 nCi02yg3ojaVVO3+QHjYieTIqcVDUqnJfKJFER6C4znWcrbhtFTwlOJ42Wi4qEbr4cQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795212946;
	bh=7FOJyzbWoBK9CRjbHTITYdR2vjzzbTmCsGyF99YpLNs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NW4DnIw2zwsp3zTv5l8a4gvnj3HNtOIVwteaTjvzebUbrKFVXCAFq7FYpt0EQkoUF
	 Xdxh9y2Cy5NTrfvNx2VcRzC8J7TGa+SwkOWPssg+nk8f5TLjW2yv+IATTT8+sAXTiG
	 N3CPWFAHbPRrYz0ReB6fgiivTq5nSko790JtE7LwfKRp89UuBQZs6k3oQwM9v4vv+j
	 f61/kP23UxWvM7h5oUs9w+5yriaxsaFwYzH179ewgnWfa+FuATq2/zxQ2QG5IQ+GJk
	 3hP34SrVajsyYQdwUUOZ3z13GoFJxvACZyFvunyY22A0KDvgCegqTuUUZFU8U86MPj
	 OdkfIyPH5yUBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA533817A7;
	Fri, 20 Nov 2026 22:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 053C19C1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF68940208
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v172wL1Mvtky for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 22:15:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6C41540176
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C41540176
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:15:42 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795212940; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:Ts7Gt9iLnaTEumI6MDZfjiRUPAT0
 Rky6/24wio4Jf6NBgC40I1wgXJmdST1JCI062bDz4El4Law0GUGDb/ftJjAhsQhp551ZiWWHJ+Z
 jzpSJPK/1FWZk9L6jjNavLUgY/cnnF97ie06uoXUJY+0vlTh8C4B/P1+G9ElUiW8astqYRtIdPP
 mgOsK+E7H3gMbZRKFn7dScTLfQgwVjDqHKOtCPjIwqnYRLM5QlgS5PrvPmboBrJm4r/MOeBvs8p
 rcUwVPonEgx0hP23+81bTx5Q7+1alv7UkwuZ1o6Ye7uj+YMxORzTFwBIEcMx/fhj5/41DMOFYll
 Kc03fENCZdBucg==;
Message-Instance: m=1; h=sha256: avmpviLarhwln/lv1lBoHGbnmV0bH/eZP55nI8y0rek=:
 fOSlarNVbmmQwLHVgXMRXuqJHNSz+BxYdWBWvhkxYkI=, sha512:
 whCgzg49StVMVUchRWV2Io7hYmdAnufx+AQZtnjPfPmG431f1TkADaJd1a2lDEIPTi8sc6apD+m2h2Nj4IMkTg==:
 SNCVQITwRlXfJWP4Sj1orkmD/Tz2UEKWhQ3hQGoE/prRad6rTJomH1O3M8EbnFKx4g+5gTyizoEFwT7sUwt9dQ==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof9P-1yJKBm3Q1h-00inKy; Fri, 20
 Nov 2026 23:15:39 +0100
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 20 Nov 2026 23:15:31 +0100
Message-ID: <20261120221531.842658-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1J0VL5+dhc814pQ7j/SWI7vRSrhv7XcRi87l//GYIyx33TZu2ig
 JMDZBzNMKJHQyXDQcDYWUUEjHdu7Rs3nkVKAOqkPdj2AiGkGXMB0PDS3CwyeIlAV16cA3jr
 fTo7zBi75uHUESWSecmhmL5bA0EPsGBMrv9EROQZTo+N82UrX8FdnV4dnEc6z6/UgNfqiDZ
 LX8WRNL551zpb6fsnTrQA==
UI-OutboundReport: notjunk:1;M01:P0:sTAVIauMvTA=;GDxuww3im/XIVb2wXj+KZCX3BqL
 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
 8c4ucC
Subject: [Buildroot] [PATCH next 1/1] package/qemu: bump version to 11.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Significant changes:
* {QMP,HMP} monitors can now be created with "-object
  monitor-{qmp,hmp}", "-mon" is deprecated
* glusterfs (deprecated since v9.2) has been removed

Upstream changelog:
https://wiki.qemu.org/ChangeLog/11.1

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 7c7325a6ce..f418c3f488 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6  qemu-11.0.0.tar.xz
+sha256  5a8289c7940dc77d3873c81a6c29ba3afe1446fc9d36e77fa1658cdbecb84b22  qemu-11.1.3.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4f4786532c..35484f62cc 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 11.0.0
+QEMU_VERSION = 11.1.3
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
