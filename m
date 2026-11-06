Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED09606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wr7h7vDO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8hlD0l4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F71812E8;
	Fri,  6 Nov 2026 19:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utB39BiYgz21; Fri,  6 Nov 2026 19:15:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83ABF812F1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992557;
	b=TkjY/uHPb8zRxiXtvgwlqxtIOsVWaFWWjy3O5FD5Iiu1s4aMtIVNFdZv6XsQekD+lmgV
	 6i/2JtAfEVcMoYCxHvOOuPj+7u4rHd2bfcZHJsSs52QH926VKVBQ4+ZQGlw1crqKkDfMI
	 5hFWeOl4ylPGBcZELy8/i25XEXShXyUbEmGcwIulcD6lToaMTGRSa1a6sYoxrh9JxVEb0
	 lyljJkNk3b7VeIHCemG50x8U/yvOSq90NnLs6O8uQ/EA20qBqXijvT2Pkx1RuAnpXoyU6
	 NddGCyG5rtGVRZg2+ws/JhFjwVOv3w4oUXC+ZYs7YfJhZHEX0mDrLgeGCQgfFwy66Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xJUqogrNp4UDbMdwxnL791OHq096S6jeXiHT+nRSnt8=;
	b=CFIXpCqz3foOge7vrKpWZKHNCKNbagW+8pBOxoo5qIuyx8ZPB/6XeJTUUkfhbhHUCiOP
	 Z3xML02NvO8FKl6uK/KxJnK3XwW5LKOF+CLjGo6zjhejuK5EJtmdxhs7Ip/V217WTpVD2
	 aqOQ0dc+MmMXzjxx6RBp1Zfhr57wloHMujTMdQeEfmicttVqDAu1tDeKT7sJ8ZA9kafa8
	 M2u82WgUQ4KFCJHi7Ddso+YTLvePDycx4SbCh4TWhUTk0QRjEQtBA1e+/JEYi+BZSi5U9
	 OGkYbPLOGiIs4slASYz93XA4JeEPrj2AxWalMkM94qwF4C0IPrfidzHl+CXJfNtj+Gg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8hlD0l4;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992557;
	bh=xJUqogrNp4UDbMdwxnL791OHq096S6jeXiHT+nRSnt8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Wr7h7vDO4YyHM0fWNlH6lPLMsCeZd6SbaNkd2N0st3kGdobrx8EPsbI00kc2AVC2B
	 g7FEaCwG5McqhRBOC7S6kyw3vz69I4v5TIbqIgtOTgtPAul3wToxP9IXo1llseXMUY
	 RAiPMCl0cuFy7UwKCfN5+DEXXMuvF+2tbEhd/kwTvDbtUOe6LILmBTQNKPh5bnLEGr
	 72av66rGCmq5L015ZmArjilgnhshIKOMpdGCMxfta6Ub1DVLIMdck1ecKFmIMyjJrU
	 EO66jq3u62lgNInrNWAeAN7DgkMF4NTSyRw2TIddTc4SxDPT+ASBtj87B6aN7uz4Oz
	 aA8f3RFd9koHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83ABF812F1;
	Fri,  6 Nov 2026 19:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C4F0362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20894812D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6LWHwANJY-D for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F5ED812DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=b8hlD0l4
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F5ED812DA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:53 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-843a4ca671eso453638a34.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992553; x=1794597353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HLZC0kcjFTmoBmCZqPUwVyiwtZNj6WQXwfD2FwZjxcw=;
 b=b8hlD0l4TrHeVEfuaM1HMoSG/7G5Nm+J4G7S8ZW2sSTVxkYLlWQti5ZU/vZ7kDy2Ph
 krD7wwfAjINi8U1rAtr1cx+Yerf/JhuDrxst9dECxomdJZ6zVH1eUSaqvEqdGQ+LhVJY
 Oq/uxiw8XhFKSW5fKPCffudm390WtAPQJGK2rAYnuI3o0NMXDPN3PaaxQ0mvpmK0PEBf
 GlkGysSr9A3+NcphmkEG/kaMgWNUohUUc72u/S9hNC2zfb+VJi7GIwBLrg3G4vAhGK7S
 gXA5RXJNblWWXn3IyHEVPQECdcc0eTn2JQ1y8KBc+nOpaFQ1fWdfYajcC9d0GTF66sdl
 PaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992553; x=1794597353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HLZC0kcjFTmoBmCZqPUwVyiwtZNj6WQXwfD2FwZjxcw=;
 b=z66sHRwFAYchu2m9FnRAPET4/rE0tcEQmRHk/nuqh/GdkQLxCsAEkGTWMwVdCfUJN/
 LkEzUoFQ6K55HxGu6gWHeuoxq7nD19hetwv5YUXOY+dSxVjDjZa9o0+b1/GiRpcJjM/r
 7WO88BBL17ZJ1fqRbdbaT7Qpc3noc03yD4sZECeyw5d3fsybgjlTxU9M9Tu2HHEwklQb
 pxWEt7J/ldPyrwZacto4v+avcoCXmvALoHoEOZzN5N0ZtS1/ZiQ49rV9+zpn3tRuMbcB
 BFI1Q2Kmuhl4tLJQjhdHD8GYYr7lDFQD/jOKIDJIG0g+RUgG7nRfSJrrFMtQ+epHWsEQ
 JRlQ==
X-Gm-Message-State: APuU4Z+xhOIkqaIkHJHoa1Eo4tmsLtjGGcN3b7IlPP9Mxaa1QijhPN+e
 FLU0dQu7sKcz07vMDp/Z2x9ORH92sSkTFUB7lRCoE/IRN6vuGxcoaQHPISHHhQ==
X-Gm-Gg: AYBFou3ZnAgbFf1N56W5qJh8KvI+2sLnJpYKOegKOUHYrCQ+uNgyvq/++/MMeE4seV4
 rQjh5c9S2pz7GqW3m3+5Ia10KxRFRrHOOBkINefoVOZivQZL2Yh08Txb5Hl2xjqde0WHsuES549
 nZDhRvY6BWKtr5Vo70jFvokDYxHM1eJUu2FSHA+LPqW2InqSXZ3ZiW+mMkLr41h5mEPHGE3wVsY
 RWaLgTtKyaFXftMR6y7LhgxOgYE46arHtvrmPproQoB8WeyXx4KktWd+wkbwg7+E48FlAG2+59H
 d+BN6NK0WShGuGnEAjF0tnZa+ZtGKSJ/izF7bCtkq0MGV8ZToK5qoKHrQ04gKEvaYDfTkfkLdK+
 6xKCk3iVXRRs95pO/s+cY7GFEhp3SYNgX4h6TLyuVs8L+4KZMPE9JUIG6VQj0oMSCrxfh2l0zgV
 0n/N6ZOBRsFIFKKHz5mjrnqRST0XpKUGzilfOJobJLSpcoJiJaL6oiwWEArrQEmil4r2jo7id4E
 4E0s5nIo7WmNKLYXal1MiTOqapCPy1iSK5i0UhkwTFeHAmdKTgmfGjWgy9zX0SRYRwg8BBpNniH
 u99ZswNGzRAkmUbZaUcNnadDB7UVe+3FedMFASI8VPMh0gLbCpc+D2bd+1A1fgp2XX2N+RVy5Ph
 afuX2+9IUYguTcZTzFCpMQPqhdXwe0VjksToHcnVmKAhOp9iCfsOeRGVj9jK2X0nhskYijKAOOB
 E1MVgIWKI+ewX/11MkAqY21vMuH4VVz8RrU39grtZ94q/36T2ghd5POtiBa1efsjbPDu+r3Rd+Q
 Q==
X-Received: by 2002:a05:6830:314d:b0:81b:864b:7f02 with SMTP id
 46e09a7af769-85f1cd737d4mr4203962a34.2.1793992552722; 
 Fri, 06 Nov 2026 11:15:52 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:30 -0700
Message-ID: <20261106191536.2120153-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-botocore: bump to version
 1.43.125
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
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index bb6a31f622..d20aa95557 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  2a0f0c5b960417f5942dee41def3e83d  botocore-1.43.123.tar.gz
-sha256  80948cb9b1cdf1a1a25809089a42e3a1bc4af0258d198222db6e97dcc660dd0c  botocore-1.43.123.tar.gz
+md5  392d367ca819b236ef0a9b03d621234d  botocore-1.43.125.tar.gz
+sha256  e3ae5ebbfa8033015958a9cb16cef67a0592902ca8afb46ef06e8ae77475183f  botocore-1.43.125.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index de4d459434..eff60f9a6c 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.123
+PYTHON_BOTOCORE_VERSION = 1.43.125
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/e0/de/011fc2a47fb066c47064b122498d2fd21f55bc90ea514acbddc37ca0f8c1
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/ad/57/6d638614c940c73a750b8a4203989b3edbde5ff7f83cd9031e65cb97d69b
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
