Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F5606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bDHyXK58;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Wr0L7aKZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FCC404F5;
	Tue, 10 Nov 2026 10:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvfccOReRfl7; Tue, 10 Nov 2026 10:56:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F0754053C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794308190;
	b=d7VbQwKll8KnLubydseOW7w7VU/KZWagJAH6/KMx0w1gBHvqZKrErtk69lzXkzlYx4go
	 sxma595yjlwHaVb1cXPR5LyCGTZVzUH9sIa2m8aL16juR+jaNcww4n76Yx1IwzPRKrC18
	 lElBFhj3QAECMvmITr2bpFF+dm47+TZFFq9QseC5KlKWQC7seTMTS9mF/q8KX6JuCLDxi
	 YvwFrmdEVQ6AZz1gcqoECJbVv9FHHxEhFqJ/wi5zfQ0cSKjjV6SEQR6sekTJfUAhjH9kE
	 aNFjg8Rpb9MT8hSmycg5uTxUptzCK3jdHjdIQjhJvQJxh70T75L5vclITAzKnzECIXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794308190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CUG840EmAH42C07cab+VEUJWey2HnyzUV7DdCokLfHU=;
	b=qYPJVK5btuUjEnuv9mrnyo4RxFY2L8ZUhKgRTgm8cjrCmsl2B8MAuerj6L/r7rMNOrqM
	 lYJ18C4HFvaGiI+IdiVniepwqnXNCmBBIdNF/XIGbU+gXKOPGaRwfqL2RWeMso5Go+Zaa
	 T1aHlF5KrIwRSQ12DOtOZwkDVeiJftUmY3KfHlvQZGVxqCiYG0x1JAmD3DHeBWxhWGiXa
	 gTbQn6qt+VJkVpN22L/q7I6RsFGcQk1Ux4oPW3USkbuPwJAScPMrBfF5P7FQVVz5xTPtb
	 sx5oEx2KhQPHmLDSGoNui3xdCCaXGCVaAGG9U8axU1boAlxosypconhYx3FSOpHLCng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794308190;
	bh=CUG840EmAH42C07cab+VEUJWey2HnyzUV7DdCokLfHU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bDHyXK586v3//oc/kHQpmvXQkMBWgOE0JvfrEz+1uwe9Mu8j/y6CuoMWZKhtGBayv
	 vNzU2zlxYkUQpfk2EiJ3ZAUochBXZgBfuQPWPDkj4fc0REHCZ0qFRK/oTMMlMQ1GE0
	 LmIwROi2Jm4Y/TORevEu2Qol2sKjyxK+jjEKgVux5FuViEYS8g+B7MYiQjY1JaN7W6
	 Y8P7zrzsO6RpPNuh+Nr1uOAuzvSFcKvZAO16+H6cX0tWX4igg4eYERgBY6hEtwPkZx
	 5I7Pw5uQ5GeEuoKep1pXHTMWRAbwuRzKXCpqrGLI6uqZ4SFIS6LdRBrFUKHCHKiYk2
	 O05Pz/TKP+eLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0754053C;
	Tue, 10 Nov 2026 10:56:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE593731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 10:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3FC140346
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 10:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQUrZXmN2W7J for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 10:56:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C6CD34008A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Wr0L7aKZ
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6CD34008A
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 10:56:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c445c95d553so253123366b.1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794308185; x=1794912985; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hxLe4GzYU1A/s4KDDhvrpZXDeF7rayrX1XtSvEpidf8=;
 b=Wr0L7aKZ4RedLQ7alIVCnCsVOrFCj0JOaPOuI1a0oQK9qlRZyHNE5wDNJ8+rksF3Ms
 ewX6xXMPJz57L5cawSelSE9L6CIdb3Xn5ibgYqXs8iNS4KaFlWTrhGbwY1v68NmHAYo1
 RAZ5y0EmJIoIK/F/L5Ze5cpxxV88FBUgujXsrxKDE3Z3MLRn5w9H+XiowbvHWw5GVZuT
 /siV3JS1Mj4kpGNTugLqpZMnsy8xxt22UVxa2eJKvhoPbihRVwiKPJhZkkpDu0zU6vGo
 /69a8xkO7rkJEMYyJRb2WKV/G/ZfgkzNZjYYCaaPDWLVV5EhuW+vINg95huKmg5F+aJ3
 L5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794308185; x=1794912985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hxLe4GzYU1A/s4KDDhvrpZXDeF7rayrX1XtSvEpidf8=;
 b=03NiTZK8SRO6JPZfU/j7/E6fGfzl6Y7m965Dt8Tt/Q+grCwsXyldtAK4ExtQ7rLo8y
 Yb6r5cT227F5TzQjKQOSTdojWxv5iLMkNFPzxuX+AAnRh4QwtHAWth/luUodrR6XimUp
 ydKlZjdZJaS+lFJCykuQ2skxnF4P7jisnoilhFIrN7RLYVehl74O8ogGjsyakrfHoPiX
 BS7pIfO47TqTtOjnRjunWPPdW5brbqxJIea5E49hNW5W9Iv31zWhVZDZ4y9n8emVhmZL
 a0AxORRhvQZmzZb0jEdHJ1mI95EbolarCLZNRJ2M/MI7p3eVp+N2U/tIStSSGFmljN0h
 1tuQ==
X-Gm-Message-State: APuU4Z+WK3FQMMx+A2GpJec7c9ORDjAVYoXlVYqOMiAFYqicLl7FROoH
 Q/VSW/GHQxhlStbDQAiuioNmEeOJt0kPoMswM87u++9EhMcPTl59gfiBJsDcqg==
X-Gm-Gg: AYBFou0KRTEZY5/YOoEdfo+M8RFk5Q6T4zPrexud4V0FCvYR1VXIVXJuSHzB0ZNt3tn
 FE8nCtEiir8XP0A3qUUdhQDn47k4ul5gg0ankvr2+xzoTy9aGAP7EdM7nNFiqPPmh2pFl+VdyUF
 TfqkyGb8LJKhDhSC0BC3vEZnosjSfiXglqKp6xzRq5oXc5LswVxvHXLraVuICKTeTG5wr/A0xz4
 ZQs75kxb6W62T9YZFohfobfOfbPSOZDile+eOz8oiWjOFUGkn5rr0u587/gOvQoSs/Gc07064s/
 Xjat/7Fv8nJISAlvIAiVtjBNAUYVhTuji+4uPkWY+N6PkpuCavBhMcxDUL4Xhcdxm7BgOnHTnXp
 6Lq2+QrKAv1LDwuBr3jcnDd2Q6hSBBvAreYuDHhmNtHBIdLWUAd5wtzC2in2nhoS7NZNMEZ9reP
 /EhXiXfBhHbjL2/1cA0mYCciFgiRKbyXQqG0dwjcj7I5z7yX8b60g+5gxdkgrw3hrUOpApOUn34
 QSSD+WGwkKT/JBJXv5lBwPsNN0Q8FHatYmCdwJ6huPktz9tgxUmdYLj7QnDOXGN+OJMALcS2erT
 j3gMmzZg/wsZs9uSPOD/jl6/MSur2j2I0XX7TeWS6aC0e6IuMwW0WmCUrUMQsdE3KHk7MJSoxVk
 daiisoGAHWMLWAqTXmdvpTicqe4C/0w==
X-Received: by 2002:a17:906:7947:b0:c31:c767:adfb with SMTP id
 a640c23a62f3a-c5048c75ecamr189881266b.0.1794308184846; 
 Tue, 10 Nov 2026 02:56:24 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b75790caffsm933532a12.32.2026.11.10.02.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 02:56:24 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Nov 2026 11:56:23 +0100
Message-Id: <20261110105623.702862-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libaec: security bump to version 1.1.8
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes several memory safety issues in the decoder and the SZIP
compatibility layer, among them heap buffer overflows in
SZ_BufftoBuffCompress with negative parameters and when decoding is
resumed after AEC_DATA_ERROR, and an out-of-bounds read for very long
fundamental sequences. No CVE has been assigned.

For more details, see the changelog:
https://github.com/Deutsches-Klimarechenzentrum/libaec/blob/v1.1.8/CHANGELOG.md

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libaec/libaec.hash | 2 +-
 package/libaec/libaec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libaec/libaec.hash b/package/libaec/libaec.hash
index cf4984447f..70e02d2a35 100644
--- a/package/libaec/libaec.hash
+++ b/package/libaec/libaec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cc7b93be9002e25a88b45d6b8d5f6120756cb5e1000613f91d803ce0beba24d9  libaec-1.1.7.tar.gz
+sha256  660dc7cef65e1749a773439e39b25a7a6cee8f4c6d9739409dea037fac8ff4c7  libaec-1.1.8.tar.gz
 sha256  9fdabba96fbc46af0ca018f86329f1e06e873b25801732001128d5afca265e36  LICENSE.txt
diff --git a/package/libaec/libaec.mk b/package/libaec/libaec.mk
index d631230be6..e27ec72b18 100644
--- a/package/libaec/libaec.mk
+++ b/package/libaec/libaec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAEC_VERSION = 1.1.7
+LIBAEC_VERSION = 1.1.8
 LIBAEC_SITE = https://github.com/Deutsches-Klimarechenzentrum/libaec/releases/download/v$(LIBAEC_VERSION)
 LIBAEC_LICENSE = BSD-2-Clause
 LIBAEC_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
