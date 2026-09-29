Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E6ACA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE3F607D6;
	Tue, 29 Sep 2026 18:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfCG9ZtzKGEw; Tue, 29 Sep 2026 18:38:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D7E83607E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707109;
	b=faf/2jrXZRzHyZXjzNxsTmi0WKYqvlHraVt8FRolbb7LsYtFRNJbUWTErDBd2gZoJBb3
	 /n9u3nI0weocBOKu1Cvu8cjf+SybqaQPea3+qfK6nv+cI4Z4dy0m53HV3Ws8GvIYGqs6Y
	 6GBVbR6Kv3VMJa9I7O5Sc/T7PXgwqP4VGswrWZvSz10XuVV2UoQ/neMLWxjChD0FL1s0U
	 Z2YwWN7SpJXxUNDqe5qa77HvR7K4d4Mu4nk2+rEMXBrFBynRGh1fR7iDPXJ2B1tBOTeCj
	 Eolt/vmg+sXnSjKQ+4XEAMzl0XgLSdwDQdg+qxcG+/DMhP3jnfe1Owk4jouhs3OhRbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	b=FWKP6mh5PQQcnPqoS0yE3bJuK79pmLHRgHnPmdkhZsbXopPL2eiQdbo5IoHJQqi5m9sr
	 yDfXJ6IuJHdbhicw09sCR/mtQ7MizYoTwSFTvqxpAi6jYUpSXkM/NvCw7DFja4o4KxW4x
	 vai0cNCMAb9BLOSL3ZBnQWEwKlNh7pCdJM32R5qCIwMQuUBio5C/eB6um9xbrpMq21bKL
	 m+9upzfbKeOoe3zfPUi2lU7NJm5gfoWNIYDnp4WDz46D025f8ztK43FCSUgsGGnF4aFEI
	 r9rW7nrwr/DgdY+OuP2czsNm/wvee1oEsHWYtERtvMkLulJmZvpyovQ8RU5JaRelnHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707108;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8I3tb/qRag3fmipgOVdpgJ2VIG+5Z8BAwtyQRIQ+yH5wvi4bWgHmUftfJgT0XMuo
	 9UxwkifKigEjI1VUPW3j/+7232wjMPasy9iNoY6wFKIiBnUbY2WrJBtyShXryKH4fv
	 5V47ux7kqQOzgD6vufJwMKlhoD8+ekSrGFC/mhUGSrWjDLsvmvMxP5ZKsJRU/0AMa5
	 EKPsjMcVMTXPru965vSXt0v/7xzkgyg8C5tmQZnPGb2vyfmGqDJmeA+SvLuFvT+/X7
	 BZzDmGMLpbqjy3jguI0Rlx7bxdoU3kjn35A2y7n3ijUXEO2nUHOVDZylmA8RVd68sW
	 zpCheo/Nx5CXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E83607E6;
	Tue, 29 Sep 2026 18:38:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 987513D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F2E80F71
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iD5bIR_-cnIh for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:38:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ACA3280F6C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707106;
 b=lBdqgVezvQF1zwzzoYnBF/fCWBgt+zTGS/iY5lK+fqXVwUhAI5ExoYXd2jEiphyZWSML
 saWT5MCtMzXflX3IKKDJtFoAdiAozhf4gt/oUCMdUqPrNEkja9S3CIkkpA7WDJfxaFKo5
 cLxdzWKPDf2bpuBK53iv96IM1cgeX2odPe0lljEPkaeS4b6xF1z7M1QhayUkuFNMxAQFk
 mWzLMBIFl8KJtR7mrwh5uaX5djZ/I0P3se89sv08dvcIgc50cXK0geOJoBeXEfvPA7OqS
 9hwg5N2mJyJUkDOxQdhLFD7eHhbG/ANE0zoj6IUzF8iPhUStvRgZoZcgMGNL3FAD6rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707106;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 b=nJ/o1J8uQcq/lVXqu48YgwqsJ/lPqylxTcZV0RSLMdeFv+La7ibtw+fsObN7p8fSwvCS
 7v4cChtFl4g7OzbScietsUr35K34h4tVx2+bMyqnuz09CIdU2vQqhIMwbG0ZI7beCdcr0
 MF1TQBuc+BoS5X4hvALtsGMBqOoee4ukotH6p5UDy/OJsa8Xavz0LoFO0bI+Gw5I056vt
 Df09ZxYC0t5fRGgELWu0XlvEp0bSi2UAPoH0gQulv9KfI5MPOY8X4PO/6BB+oVqI7yKdb
 MgwrWJXHCKORpUJh02wlhi4FoEyeBVMuUz1pzdoAWAiBt0LZshehxxk7ww6hNX2rKYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J2Vmhmqi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=J2Vmhmqi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA3280F6C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707021;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=J2Vmhmqi+2gGaSZB63A/46OqLvF2mud1cKKjdh1/sa9uHWw1BFJJDbINx/zXpIgA4
 ONLFAKSXZW9RAvvefhzeD98zIsln+n9V4LWMZKJ7PwCNNSo0DGELA7Urgea+tqXxfI
 iY5JPjDJkQEIBfcKvNHC9KefkdUT+DzEm0sNIHtmBXOLPiBu7BiLdGYalqk/L3xqlP
 SP6jnUhbk9d2pfaonFP8ads6jcIqSPNZlCen/si23yL1l6OZnhlRu+pQfZgd3cAGmm
 +EfC69ZUvpW3YrAOQN0XeLa9JYFjiuO1hmGlac9OxINC6K265jWTLtaILI5LFOpNhH
 hiT2PxnZRWJ6w==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 buje6l3dC/p1PIdpGKQd5WLewjxWB8zav7DdDHogKqLDVGfMDI4Ah9OVVQnlyEY8b+8dsaRfY/R
 ySmPRfNSKCAHzKJcYZuIXbIG1ADyHzECRez1j9map08EnRRI5rJeWmhHLZd4o75EnVR0S34eQ6w
 D3RJzrrpAVhfc0VxoaAqW40Jy8ljrc2al8OwF0AS0t8eRugAUGX4Wmofj0jRYinJJ10lY4+Q08k
 U2ZaVw8isO5/zBM6xxBNc5KznBKRySs6IeUjOU6SoQ9S9pcECQImKYw6wWZu1xvQQ9UqU75/AZw
 TwieE5zNWKfVlZnrX6MiX8EV0yCw6KnMAYDnjmrKLRISNP49UHC7EiPO1mRfOB/V1oPkislmH0g
 ZIM4n19liaQ7LCz79mpsLYfr8rHDzT4mroZunw4aTRFqoP3pDxodsYY7oc5OodVZ8NQzXljjc5F
 9jAhO2s70/9kUgjseNlinjWh17MRzsk/7Cb/i0NNjrCCLYKNrXmA00pNBrKhJa+v9E/H/FngCXS
 Phjyw7b8ShEHLxEErvpsEHHDyj4tL5Vlc0fV/x/J+yUid3f4igVbSVXBJ+NvoNR6iTIlRmMirHJ
 1Z2/sXg=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A557DA4C518D
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgm-000000006Jn-3w3Z
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:59 +0200
Message-ID: <20260929183607.1849293-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 60/66] package/thrift: Fix build with OpenSSL
 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...recated-OpenSSL-API-ASN1_STRING_data.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch

diff --git a/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
new file mode 100644
index 0000000000..279daef4e2
--- /dev/null
+++ b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
@@ -0,0 +1,35 @@
+From d586077a37e14446cf385893608ea9e60a59d083 Mon Sep 17 00:00:00 2001
+From: Brad Smith <brad@comstyle.com>
+Date: Sun, 23 Aug 2026 01:26:50 -0400
+Subject: [PATCH] Replace deprecated OpenSSL API ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/apache/thrift/commit/d586077a37e14446cf385893608ea9e60a59d083
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index bb8dfd13f..48b96ebf7 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -770,7 +770,11 @@ void TSSLSocket::authorize() {
+       if (name == nullptr) {
+         continue;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++      const char* data = (const char*)ASN1_STRING_get0_data(name->d.ia5);
++#else
+       char* data = (char*)ASN1_STRING_data(name->d.ia5);
++#endif
+       int length = ASN1_STRING_length(name->d.ia5);
+       switch (name->type) {
+       case GEN_DNS:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
