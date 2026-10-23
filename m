Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E55E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fjgN8iif;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I8bXAWIz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B29481570;
	Fri, 23 Oct 2026 18:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqF3zlUbEwrh; Fri, 23 Oct 2026 18:18:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 238C381547
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779511;
	b=TmHoRvcuB0qT90WvKBP4HR8TVVXxSjeAkiy5xkUKIbneVZY+KACzFA9s622Vtr+heaHT
	 f+DvWTwoHhiBk/yfxDLglHpq1blydN/JhWjBvAoLC9fzBGTI2WiOb/gsUZUiLxtSeZaXm
	 q2rGQUu1SDYhwjVtBMkIrSu2AV+8/xvn2YS614LP8sxYqiA60nHSOv8EUwL3KhumcfhCD
	 M/8SV4Y1WMgtvSxjhY0f2fHNrVddGQU3XOzcdjqDIfkBPigEPlvo7/nmeph98aKbw2tNl
	 Vfo0DNvEzMYGTJQwjseqYvZNZ5W+MJaP9/LLm2RWSUWURfm/EBE6JUEYyGPZY8gkRQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779511;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OqXltJQBn5kzTsEaB6OV7zR4+iLL78Rkcd6McOaAh4U=;
	b=I4JWv9RL0CBFFqOS6YXlFEz3rUXgR20+IdKwVXu1q1LtjDUqX3DxMNlmzTw0nRryDH4X
	 gkaBjVhHlI70dFQ+UywYZXUgsXs+IA/LyYLw0TqIb765AQ12YZvwPXvBGKlEpmsFArvSq
	 truRztRXilcXoB9autx+ZHLTWJ6XeLzMpaj0KZbsLd+6CKSDwmR7BS+GsQh0Is/56/Wri
	 A6rf0FMWfs5oCKjWlOjkjG8jIt/37WlmtehQ0/uM4b5t2IDI7fGoRDMGtu664VTqr6/PO
	 6dwVdhbx7qDH5mR0aAIZ4gFZCwgIuJoz1JTIRo1Tv+VUy29i2sOXmIERy7SZ3a0s++Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779511;
	bh=OqXltJQBn5kzTsEaB6OV7zR4+iLL78Rkcd6McOaAh4U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fjgN8iifWMStZAO9ufIoIfaeS/RlBPWC7EbfJDKssLJpTNbM5Un0o7tWnDzk6mXr4
	 4BKBbp8z9NsJOfymK6E707dkeq0Jhm8/M0fcsJzLC6PcYMWX22yQHoym26fvgjVaYN
	 5TjuFN14LrLcras86gHGxa+E6H12ncboiUjlVDi1tw4CGraYPhaOY4vUodTstoSApM
	 DsYWfPQRhAFTEHOTqfVMiwW56j8MGo4r/cqAMRIDoeVQ5Awa2FHICVBye03/qRwowD
	 rLs5m+fuZ6VnnrfLriVAnEAolmvcLukj/JqQObiBO5LPcJxLZWuWsgDc9H804MpMlD
	 r8YiH6c5WfmHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238C381547;
	Fri, 23 Oct 2026 18:18:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0E6E235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86EC640061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvUXAv3yGDIN for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8B39E40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779506;
 b=EFLolkABKJCTdS17WRMUVWGPtg3+IpsJ2VnrwJ7YOFvPs4LRfE7dlhbmPlLHaFjOr5P6
 xsXQ6wf/NcIC08ownQOv4ncDpU+Igy1CGLJVCuEI8HZWXPZypiq98n1jKOiu9mQIEfrhk
 ArD1m2hzX6fiV4n3Vvn2DGazgVtYSf+Bf26E7HDGqQN2HhX9xgTDRZGHU8dPe1+duf4XX
 T0yCYNo85VAj67NVeA2N0zcpPfDy8rvucsMi0EkJU6g8xov8+VRFT3JgEL4FIykzks9L+
 3eI4+Erjsr/K2UtBgPMZi0Ru/VTqitlCVgQF2iuJ/R7Y0TTvfk9VJfQDBb/fxa2PA1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779506;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yIAhzZWGkAHM248Bpq8Wh0AxKq7zTCTzZBKW8lpNxms=;
 b=I4+nfQPcLugKHz1amD3HYei7Ou7MAoaUw0+2Vhn9CIJ5LrEEaae5G8XDZMZllIx04RrO
 DpPID4xolM76Xtwlb6+aIxf4zcqtGi/zrYm6rNJWMvBSnq4h4UhOQdzRa7P31avtZSh/2
 8/dnI//Di0pUkEZm6+GLlQ645hDz5PryGs3ZncUNR24ooysHmmdRAZ/2BS/ZSJtTlPf8f
 dInghzAu3AUw9ICcMIEb1s1MkfsSz450BUiyhbqlw0CC06I6jKypCHzZ75o0Wkups2gHU
 zelwY3KPb3NCXw0juZ75XHoh7t50jtml/aRs6k/f1XPX2j2+0A4t5UrAKiAsTC9lmbw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=I8bXAWIz; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=I8bXAWIz
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B39E40059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:25 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6d7e06dbcccso623344eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779505; x=1793384305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yIAhzZWGkAHM248Bpq8Wh0AxKq7zTCTzZBKW8lpNxms=;
 b=I8bXAWIzd0eKdUORLoGn7yzCRHQ5tRsa5gNR8K0nxLuBqUbZNGNVuIkjjrxdfiJHit
 KJFBeg17aligQ7uZsCisjgn/0vhK/F4o8N8DC/gr9eriW8BXQnYc/oU+wAOa6aD1/zB9
 FLV+b3892Ckd6p0bmFAnh6q/XZd+ziD5UM842dkbkGHVmeDK55UlGq8lrpizihDbBD5D
 To2sgm+e68u3mDD5ZGl3FtotsWSLddh7JNWx6ZzZ2XcK2JE2ZfEyCQP/lrpXqUv/Y4py
 jkOnfbeCgbUlSQyupbvxG2Om6Wx3Hg3ZzTso3uCoYh7dPbYg19E5QhQ7oGJX2ttlW8Vh
 TYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779505; x=1793384305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yIAhzZWGkAHM248Bpq8Wh0AxKq7zTCTzZBKW8lpNxms=;
 b=UKpKC/4JMXxrYOrVYZyIT4GDOUfAdfJ1g15dQ5CCyK/yIYZOFkGbtJ2OH186dldRU6
 oM0510paM4oF+Nv7kbnn7oczeJ0pur8fXO6TxG766gx12K0LU2Lx1d5pXCl8N8d7q41F
 oLC1IlHkLKnW3pv/z+yhPJL7/2r6unfESyAjKhidowCrA/9PZ0S7BG0NFwXqwZT0N3gR
 TmUUcBwXDGSakChj/Cmnokg0qaZ5KhJwXKqST8H1udfbx5nZeShkHc9hLJ0urTEGcV2m
 VjkOXc6kReuUm96lnUPoWg+P2iuNu36vwyxHqKCE9ODJndE0so8NjZNRZzoGCcmZ77Dh
 HvSw==
X-Gm-Message-State: AFq9FYIZAgcAZ07w7SB6cN4tDSRxu89neLXYPnI4Sp8CRqGixiGBa75S
 Cl82L6+TmJPtNAYpz1tNjmEPAminpP7eUu80vDwrLMsXXjFIHS8qQp0u9XmsRQ==
X-Gm-Gg: AYBFou25tj9F7uv0COzICzIfh+N0u7GjUSefm4pAXlFKXMt458n9j5kHVKn/mjOlM5V
 lPjGPK5Hnks077drKbocb6vsDBeQSETlXN5FpuTFh2GFGMW+W9tSLaOxPkmUPNB2eKNb5N7HufF
 68bN2l87F8vd9ITdXXPkp4r/lPawyxYQxhuFx5UugkX6VTsFG0L4JCXfI7WqsZ910LH9KlTnbwu
 Msmc1zlksSzsqLET8WinQRig8fQhJrHF0c+RoZKSozaxYZogPEKr9JvLfOR+3XBnrORxbSQuU51
 nkjRqtAX8KwjUYgpYNmUSwDCrVrdib7Sg73HMf0uRFKN0227++QwOyzNJe3tYZTAR+4dFer1IBq
 444j3ZFv47g5NgeZaad9RSnQdfrvCN9IAqkZHhkmqteH2Ze3ZfGBHR4ZBdryZ5KVfnN3/xfBv12
 ORQEH/dYczIgGrZUKtunuVMpqvs3hSeQKrvCshAzPCyE686cIyKfaHVN/YW5ZQNsz6aYEkUq3mj
 updsuqC7BO8zdohvjbvDv50HvVHxufawm4qmYd0DzOaPh9bFp7FnkDByqZdTTC8Qtk7KjVH0jwg
 NvoLjXs8ydbvdiKz6TXz5yiqisl2qZaLdSlWI26jwbv2v07r2UnyA2Ok+CHGbTeGgIs2Bh3LBxX
 H0dr1QIPFOk2WVpOu3zxJiEm6x4vjWhnbNnwTNWGMhRWLHkFx0KsbTy78M88ukbRk6CBgah+OZe
 kht2Vggs9ACDyAlpDXDFyb86c=
X-Received: by 2002:a05:6820:1355:b0:6dd:d8be:118c with SMTP id
 006d021491bc7-70b88af97fcmr2304418eaf.78.1792779504866; 
 Fri, 23 Oct 2026 11:18:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:21 -0600
Message-ID: <20261023181818.920329-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-boto3: bump to version 1.43.118
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index af7ebbfe74..61960a619f 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  9a5cb05d8aa6985ffff5be9c5f711bd9  boto3-1.43.114.tar.gz
-sha256  be704857751564a5cf69c5bbaadbfa01c22806409815c73563db42fbffe583a2  boto3-1.43.114.tar.gz
+md5  d4ef8a8162f55f930817bd9496801491  boto3-1.43.118.tar.gz
+sha256  c0620f799e0f0c222ba42c337b65cdbcd3da38a3121187f634d8926cbbb28a9c  boto3-1.43.118.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 7a8ea4b329..36ba647d2a 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.114
+PYTHON_BOTO3_VERSION = 1.43.118
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/e2/8c/f6f884dc947789317e73ed6fce85e18580d22e9f90e48d67c2367b02667e
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/96/8b/5694c8433b5202f34a82def4edee274f7df1eba2919c66d9d389d2202ec8
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
