Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9C5606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M/1lBIug
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A77406C5;
	Tue, 27 Oct 2026 19:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unpa8rlp6Vu7; Tue, 27 Oct 2026 19:49:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80FA340692
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130547;
	b=M6c6fc0q3icm+w1QWyiMFqjK1jpElBuWyCt3guaug2IlitbU5sAO5hhDLCkZbst1l0nx
	 QKgS8WEcSdWF3ar/FgD9gLYbvbT1PO/9fVot9ivvLTmTo5fHFvhBf91A2y1ouMqMgU8fD
	 a+5E7nMoWK+X6SgAR7hoV+jjxjNrMssUq5qC20h9cL5bCvOrTxehIj5KdaMNfIRLUGkrW
	 v1sSZR+jHRF/hjCattGr+bJzjCBo9p2IeuH1pwOxmBC5FEEcbiUbKhhUZuuq001yRqdCI
	 pJk2YTbp7tPLDbbRT1h5SEgHonNOEUTfUlhPkddJTwaV8f+yH8Bq65qul+TrOT+u54g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8C34RvEfQ4tHUBn2HSIYTFw+Ql/Zs9PzUbSuIrHkLLY=;
	b=G1drrud7Y2Q735o+3PIROw5BK6U3OokAaO3JYsvDVWGRrbwgh8TlqZFr4h46pr5yGM0L
	 vaDty56EvtlSSd93FhFEsITfCTZglPTfHtOFLYZLNhA0SvGxdLgWoSPHiAsn3nb1Ye72c
	 ByEU8vvdsanF5hlxecIRMA177Z0iDAfAizBoIiLgx2m7lQJcOPLxjRpk9qMFR1v/HKFJ9
	 ZyBOHJpUG1JY9t9joDpXqfKv/591ARjz37Ps276IQGiYe/MQQu5rLOTDEq76IsfbYPj1x
	 glgu18i9WSeHEj1bmyVrb+GnnrqX97uIJKS8lfmOAOCGGLhpfdzd7i3S6AjvyI6e3rg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130547;
	bh=8C34RvEfQ4tHUBn2HSIYTFw+Ql/Zs9PzUbSuIrHkLLY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=M/1lBIugCy3rGeXloAMwRzg+v/BumSbJbY6mh6nPinLKFc2k4Hn8U5ZpJW9MeMX4h
	 0sedurE4v61zutIJANXERFI8dlsmzhLVt95jf2tQkdjz6KN4IH4syoPkAo52JExCAv
	 mVflBjsaIy+WzI64VOY3Zphb5DyEIamMQZOm0zvQSR/DYDBX11SrCE5UW1xBbaIerc
	 UBlV+8ycLWTxdzSOy5MBTLUCIADqo1TpWugwQHSDAntCQ3xIzmqv1zV/WVFXSCMDGE
	 zadQ3nQjnsrYPTnPvw0JG6oyRe7azMKr/8J8eMYomJvYdjog1mOXa2i7JBdDK50NDj
	 jHCd+tXagXztQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80FA340692;
	Tue, 27 Oct 2026 19:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37BCE529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 294EC80C9C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bK1XNrOKlLW9 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:49:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E4B180B89
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130545;
 b=pe7U1qUa2gmyuqKrU//AOQ+g/TovSQT/3Qqubi1ghTDWBt8pIYHXcU0E2vRTfByl5NJh
 tV4wCzr7/ryxRHKYcu9QumeG87odEnmdeoftB2//sBO/ptCzDE6gY0XQHBj193Tt60HSw
 wAie3ke/CZ9dpP+1iHUCdW0dYUVobUIMOk6lCCcVz+OfzHXq/EgFAj4MSiJA0//dwyLY2
 /iHeg07+P3a6gwO1x38vrdbG3pNEKsXqP4+f8YK/Na3f1AhXSQAG9tY8nr5z1sqvxI8+6
 PxoZc9ojEvdnPI4rzXtkpYV/7uOq4vTWaC7kch8zQ1wxKGfAmJZp4f6AXzMggDwL9+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130545;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=qc7uzf+0VkOYPH3IQHcOdoKYrYBcJsZ+FomsFhTJYuQ=;
 b=W9Goa/dDcoXPk/y77iofGpYmD8LlYOuRIOtTmI+qE9vMNcn916g08h1u8ah7hc90KD+b
 y674WrQHs9YG2fsFC9K9tCBUNiD/Xv3FsCXh4Av6nUWWAl/Lc7h44ajma1vc6vsn/0dFo
 k8vvwgYE9g1D7RIzCNbeQofbFoPk8EQitdiDAYV7ne5kLV4U3dKrBX74ChuPsbeZ1vmpo
 VEPV+7tB+HsNYEv1ISi6eFTawt519NCyzOn/GIZ6Bk2o+ZLrIAzob0dyGrSd9n9OVQWq2
 dpPj2xDPc7vm3taZ3gCyLYyZr+h9kjPM5PNam4O2HFWjriUgXdoimwtJ5CgW+/n6Sjw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=PTf2gER5; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E4B180B89
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:49:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwbz-1xExfA0IK9-006Xw9; Tue, 27
 Oct 2026 20:49:01 +0100
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Oct 2026 20:48:59 +0100
Message-ID: <20261027194859.2166161-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:s7Iv/0iyRBesLpM5f7idzMOGZ7LURRsooUW2en1eG5/nOijrMkl
 18YWhC6I93Y2KUgb0Z5AKlX/OVAzOtO5BjUQazZBpPcY8wZ52xGJbQcAQJoRBxLj0A91QDG
 ox3M20S6QenpdXNhvzRfw30+GwFZ4P4fhu/5Vjl8KA+7xwPvRRVW5q6d0wZiHXHDJjlWr1N
 etgDa6xWzkAvvyQGadWtA==
UI-OutboundReport: notjunk:1;M01:P0:bxcGTnYFE3E=;X6uAfrH0SB1Fdx3c9NyvFDBBF3g
 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
 s7MEIoFvQ/J01g+fTw==
Subject: [Buildroot] [PATCH v1] package/libressl: bump version to 4.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 4.4.0 (for details see [1])

[1] https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.4.0-relnotes.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index b64df284fc..e3978baa63 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  57c8b2f8c6f9505587abaeddab003ea243d615edb7ed71957968121fc6316bd6  libressl-4.3.4.tar.gz
+sha256  7d02522ad5070b9adb32eb253ecabce181184a3750cf65abac0675ee908687c1  libressl-4.4.0.tar.gz
 # Locally computed
 sha256  9853507b8821c3f277aa60bf554eade41441ef06b2df538d247183ad28789b7f  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 6d6de78213..82de944fa5 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 4.3.4
+LIBRESSL_VERSION = 4.4.0
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
