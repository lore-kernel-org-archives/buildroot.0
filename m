Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73B606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gUjYmma5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4spaJBt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6909260793;
	Sat, 31 Oct 2026 17:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyyHBjnDeZOS; Sat, 31 Oct 2026 17:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 30B45607C8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467288;
	b=dXl+xU0b874/07CuNhRJszv3z9r7UqvUxexQHTiErlNx9Kfumu2lyKyIgnsQUVofQR3I
	 ebelrE7+uUT18WBNDZYUtXTNM2ROTpnOK5qeA9SMFJvp65kb4fvjiHQv36TChMmM+a4BF
	 rUP23KtYsf60pIXDf7TdXtnZd4ZZHkeFSpd2+vJ/KAm3HdnvJqZBQZT1Urn3SGixp8cUO
	 jKXMu8tqC4t0c9HFqqegEMgQJDDbdZTurr3kWkd6PNTs5eP0O7cCRzRfehKr11D7VEhN3
	 6KvZ9SSaVpvdGu/2H0Yiy+vsWjvkJSN81ZfWZeuc4O2iFw0i0Qj9z2bKXreRK8+9T4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nf4uHRA5BIfF8OF5qYZvbLynU1MjH9PH2wfxkb8c/JU=;
	b=nJKUZcfAxIhCGebeJN2rdwSADja82v5HiuA2C2SDCK0pTHFqYnV3ntuC1VRe+WIOyBDP
	 hZKpqB5Uxkg+987URrJilMxr/0hsQnUvgmzPIJHjIXFRLG4Og6DYYIsM1gCiEBru4vNbg
	 o2VHOh4eYHTFsqjDh/L2a96NA+4H7iI8o3Ge+p7z0/GJ3e/Wpvw/gdEKfXhpZcm0zcUNW
	 aBodpE099/4YrFeBFVH9ak617pk7yf5sTHiTWSdN/YLVU/dnXR/9DDsxCAQdYONptwM6R
	 G9LAFHuWPg8ENFwy6rMlPRNNZ9h/vrHxWbrZrf0pGhZWBnm0BnleIOLy14ShXbaEurA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467288;
	bh=nf4uHRA5BIfF8OF5qYZvbLynU1MjH9PH2wfxkb8c/JU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gUjYmma5z7GVgIHlG9uuhWXtOizWpW98x4F3rlMxPKOXMcUwqyWk02TwtDo29/dcT
	 JZJI3AWXN27a3H2pjSIfuUpqNUkdVrWpAvPPO4GKdwKAp02IWm649oSsb5p2pBn/hL
	 ExkFUE3Jl9lEDdr6lBXL01TV9EYmtavJRVSwgxGlYLUy+lrylYxDEIDyStfo+gjpSN
	 +BHDRp++nkG47/FY8rEAagCUak07WBwfq+E1AN39q14WU0nCN+pPTR2tYRYgZqBj5Y
	 lT8G+m6cuAOXsJXrUtYrvZI0wo3wqOUvpM0kBz+KdYioOnCXZkFiwkE2aYVUUcGTNE
	 kvfHnDIr0Bdqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B45607C8;
	Sat, 31 Oct 2026 17:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9D14E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CCC780B89
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOx8rd66CVwu for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:21:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3728480DE6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467267;
 b=QTaxBW5C7bf0NpFhAltJrYKNQEWBjJ61N3mA9iEsts3Kwxrzr92/zFv+UYNdvThaWraq
 R7V7SViN22MVYRZ+C6QLmNnKv//RlNbq6E8sSk5w+cGzCyzDTSqRI3CtJT/NdjimXbUvJ
 SddinIoq4XvegBJo6rVZMJ5p+Rr3Essu63jaqvT4HZVvEnTSCXFsU/mE3PZ0ARzv9oUaK
 LIWZKDNlazyUtIjfyO38VNxxP5Sq85r5VoXntLsKHRosQZT+O1WKiOAFcfMZ3S8RAn1+e
 6NFUicsmQNoJ/SYDsguPFXAM+YGg8t5bKK5y0zg/cK7JmBrONyMmLaI6rQmDPS9wrww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467267;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=rLwtkWTN+L81j0cwr2SsPPd9TJmR7fkSuzWmSnK7lMk=;
 b=YD4lgEHBnRCZlX7LPm/DrMNVdfWmLmqA1PHMtP5dHU8U7lzCwt09vG+PVYRiSMxG6T8q
 ahCvfZQyUpmFNzzcnhlI1ORWkh+0SIuvAd3AQ8zUIoILIJ9+BPNxejtIflAZnxqzNxlPm
 YWF2BRz9avn/qzVqkrT/dIgMsxXSExy0kFep3capyIosdCTwR9LakfLzAhz0oui4fktAz
 QGWa8SUVjPl1PtQpnenYlEUcKf4718PEzcS0ULFPy7SUFHZIx8hvtOSEhr6qLO0v0Kf62
 Mwv0olSQPrB4m0Ev1tKbGwQL+vgxkyfibhQ9GDd8owZxcEC/tZNvmxYKRVfeC19WIfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=p4spaJBt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=p4spaJBt
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3728480DE6
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:06 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-8451a619da7so1307969a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467266; x=1794072066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rLwtkWTN+L81j0cwr2SsPPd9TJmR7fkSuzWmSnK7lMk=;
 b=p4spaJBtb6EGZnrKkkULWKfdgDdMBx/VyqbAzYo1FZhFpqEkSwnpo3LIXz/kbBhk8x
 2jfqkIdI0NHQFMIBLyA4dHWEiAXqHuZjEXi74JtE37Px9cTS5I/O6R+BTzGGO6JbaZpb
 7d7DLz0DuRwflUtjR+gjWhBp9GRjbd7CJpciCt3XrmrMj/jaHeFsgsvo79QGpU/XTMk3
 cgLnVJSpadfzKUFnB07eCL8n8ffQJ/+lNP5w0s7KzR4Sv96eDUgaThF4lMcd5YIeDxum
 MIV82gE8Epf9gPuoquEax9m1vzVaaDA9zFrtENeEOf41z0SgUPrnmofacfQpaCsrWxH4
 mUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467266; x=1794072066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rLwtkWTN+L81j0cwr2SsPPd9TJmR7fkSuzWmSnK7lMk=;
 b=jZ1A+duW6HEUw5LaFna/sepkkmOMN9Y0otUefODXXEWu+UXsKtqB03vwtEmrttLRfE
 XpbRntbJe3lEP3EVCkfPYIkht/CsOZpjc6yzlclQrmPTICHcPCnKa6FvlSY9IkFwcK9C
 lj3ym8vT4A7YN6oKmF9plGWzW57C+3bD6qb3wX00XtxTylG1Zt9iUzHRsqtOVK92IvZQ
 61T7as3UO/zktx32yw2H0ll+D1AkxyhtKgC4qD4nrLlSlC5tflJUs9jMdBGLlI02DjW3
 qPj12TXYjC7hrmcZFh67+i54W0wVBPGl5ebXfDrXBTxz7yIJTVENAMAYEJVA/4xiE0td
 UamA==
X-Gm-Message-State: AFq9FYLJTjwMMDCh0ureQ+gGKw2hp1KJyq35TvLHKmIZODLakyOPmcYA
 gK1KfjEGEVMFhIe/vP+ULhRiL7Xqx3/Rn0wY6XjCGEribTNJp3mQ4YkNUqJTbA==
X-Gm-Gg: AYBFou0fT4vKPVlzQiKIwCAG7vj4LoRRVY4UVr7mAffhDXiqdUUzEbfxWDURqqRKDDB
 u0ry4ff1ZwnQX63M37UY/W02cZbbyQDzfwNpyn8DJG5RqU67TLa1FIXporR2jB8ZFPTRo10NfDW
 6tIID9fsTjwkjMs5mp/KPFYYil7JWUb9bySoNRfgW//YxAwDPGCF9xD1JVDOFmnmRvIMh9109ka
 X7uZeHXOWimhcHUl+IJz/fdGOkNqF5+uZlhASEirxwKq48k3I+UPqzVcjmUZJNEQAMb6hTm78A7
 YEoW+9qCMp4BwamK5+Ej5/bKmM1emdAr83m9mGG6BjQUoR7Kjy5WGgR9E6aTaa5o+qmW6PDudXn
 KLD26EfNkdRCnYotCKpTQoyBqiwzMeD5s7GAEE+rMP6qt/R9MRrmh5Kc9kDPIWoUyvkYKW3ToQv
 aaJcxgnklkdFpEzUFcr4O+GHiBkG9k4u8BKWL+ZbzIFH2Da63DuB2/nxc8l9Vqot13OiWpK/RUG
 zWlZ28QvXHK+olFlyHGusmvrAWBWtXwshW2aBxy7LM7MK7GmvbiHJmCOzE8HZxy5V/Pf1W8AjGd
 LchTMXaFom596+QYp6W7xqsVUJSXqcVzBhAMre53mt8XeeQc6DtJr+igda3FjU00Fvj98+Na3aw
 cRU49sv64zD0bHdIvYCIFwzNC4JBjI/0bo7eBQNlDrD6uwvpEdDFKnSAJhKve88oY7QzgFMlLNY
 UT166tIKSmzaiiSdqMuEghLNIrilcRIcyHIhG3JShv1lhHehsD2JpPd9j+etVQTp151fhWs9gW0
 g==
X-Received: by 2002:a05:6820:570a:20b0:70c:8247:fc8e with SMTP id
 006d021491bc7-714f2989a2fmr2063822eaf.21.1793467265733; 
 Sat, 31 Oct 2026 10:21:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:21:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:55 -0600
Message-ID: <20261031172019.2683287-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-xlsxwriter: bump to version 3.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
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
 package/python-xlsxwriter/python-xlsxwriter.hash | 4 ++--
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 663b09f426..2a396846c6 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  f715b29253890540a5892fed5b2aecb9  xlsxwriter-3.3.0.tar.gz
-sha256  0a6bf2e4dcec8b29dd9b86d1e622132134c48bb6fd10f925fdfb229f0447199a  xlsxwriter-3.3.0.tar.gz
+md5  5ff0e214918865da98e084153c2a5d1b  xlsxwriter-3.3.1.tar.gz
+sha256  0867761912cceac76f97ffa76eeda18c623ae9217f601be8512f55b1af4bdb6e  xlsxwriter-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  79cd3a88b65ecd9996f4bbfb7f3adf0a75df366aa1d3bbb7fe150b9e43d5b4c7  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index d6f841a219..6f92aa7b77 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.3.0
+PYTHON_XLSXWRITER_VERSION = 3.3.1
 PYTHON_XLSXWRITER_SOURCE = xlsxwriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/93/f2/98b45e52bc0330256bd4bb039cc44b28f838ad85602ce4f358f355d501bb
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/9c/fb/31bdbf3737222d92ef7d2db4d50089b2253dbbb63ceb6d20a4447f6b7ed0
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
