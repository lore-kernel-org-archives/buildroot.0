Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1E606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GkiUoqWI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC00980C81;
	Mon, 23 Nov 2026 09:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FH6Sa8DCNz_0; Mon, 23 Nov 2026 09:54:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE84C80DC9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427658;
	b=KQfnmK8IBs2wVN4HhoEz/RDlO+OX4DeGrIg+IGVe4h8Q8su0gFRU/vQERqGhOv3DvTZ9
	 YXz3FMXLiQUw4PhjqZVM6YvMvny/mP66Nwj/bbAeuZIdBdMu/qFvQ7W2q4AsqZwHDSrwu
	 ksSDEGDVEAPwZV984VuJ/ltW1FlirkeQ3YRvg/L5C8VF1P5lbOheDRW1BRxc3UnB80lz1
	 P0Os8+XuffVrOntdt7UaEYgZELfcpFxJtYsytRvn8S1GVUlXQZ/d9ER7huS8CrKPA9djC
	 H7mdKx39IlLJ+nDHN2voKqCxEAAuIYCIsKCA9A6/tCrTlpYj1W4D5ieVvdK2EbfITeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427658;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CDY/t1Lu6GcZhBQndA8b+xnDRPahtO83Q3LLucjNNNI=;
	b=GnaddOePc2GMYIqzuatAn1jSDK7I2CBAVtnuuSF4ry3dQpdtGnGkYgnL1BNYSF3AMxsU
	 ARY/3QC+FklYFkm6NxjWvK/vP2H+mc6VDRRvdJqEkwnHGSOT2JHJBXNTGiT6cZMseBPC1
	 mLWsrsr5cY/J5bgv3TyzfSl0r26oLLvVMeosCWqewn79qe1Y9tDLyMyreG0RsCryyoGrn
	 BMOFt6IT/EokKo3unDqKoF2dVYMHlpV8rCXLhd2j9lIpUps6tje6O1SNMfx6dQlrPxzpP
	 jJYrLjjonS0f99wufpANNkNQegEEuYVrDYK5h3fh1Tap+zchFXjli9izyY2cWROPfUQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427658;
	bh=CDY/t1Lu6GcZhBQndA8b+xnDRPahtO83Q3LLucjNNNI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GkiUoqWIhbEEn0Rf3h90juAal94YjO23nlkjyw+SQUAPTL/n1E5m0OsqI8XfnPpLY
	 KVQIfS6r2VOKWu4AQCjaMAAPEbxugFnEWmHRMw0vIFYnz5C+r4zFlv6U73r9nAzEYX
	 sHjgoo07EjhIhVpxmuBVbknJDvP9/SeRG3FMPsI2YEwgoxBFI7RDge3HMF0HV6Lx7s
	 hSbZvJMPLw9LM80JF1nlVydF45k2yXIhyrTRTIbfzkT+ers0XBNZ5cXf8+J/6i5Fnw
	 1zzRfqkz/XZHxIC39EC5Uu00nOLLKfP0HjfvWyqTHfON30OJEiY017sRvwzpvn+fmS
	 42NWuPKlvzjjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE84C80DC9;
	Mon, 23 Nov 2026 09:54:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D37BC1AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A3D401BE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C310Q6lXJQO6 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D22DB4005D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=209.85.128.45
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D22DB4005D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so38241335e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427644; x=1796032444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Zq5hBpRo3C3K5lfJCv2T0nf36fNhE/32WVgBx3jg1lw=;
 b=kVMoachUClKSIk/NlAc+IJHY+DRhT5yHfXoqhElmaOHiJFPYbi3hgpspXGf8qzOTg2
 oBaPz1z7d+jejG93Nf3+7qCMOQftkn6iU/zD1JaY4MqELs+olPMgEKB7orVG81JP6A8Q
 xtV9p7KAFH3rHsscIWdbv897jLE6SqGdSlCIqfgwI5xusMCDRJWwkcE9fKnnIE4zTKp/
 r0a+NhcCbrS+cKNGDD+4aHfUeHNhAV3CGQvfgiplvdWVU5+BXw3liLWilYlsBTSSmgM6
 xr/8mbIFdpXSVTffMYyDS1oles/pPJbz1TVmtOCCuNqUK3xMW4irQ+V4ftVlDugHdUXR
 mR0w==
X-Gm-Message-State: APuU4Z/F2Iz/tA4mBniMJrIFndh2aEj4CP7QC1COi91WGwEU6lzjQ4KY
 Agu/0lyzm8qeAsqhxo87V1raZdOTLdSAoDgpplHxUdOrDo+WiLCZ+xa3AlXsWE+Q
X-Gm-Gg: AZFdTZcaDMVlE02CGE/xAQiJeI3YSDd35OVGH9LvgxXNnwXflN1lL3W9NWvITHQ+1ah
 UFrIgqczu37yu/suHjOvibrHzLUr3okbVlMymmxY2Yr7m/SUGEilJVDjoFEW8FFYco68FpZs7/3
 wBws9NV7ZtEbGPHJ7urjwVsmKZ2n4PVas2BG2DGN/N9FfRzZ82GNauveC5b4QnMiWOTEwYGooG2
 iRn5t3n+ZbiCIEA+qmCoXSqHxwF48KtkZYi/W2liYM4GjLPz4zgyBIYPsA1+at0L9g/X8y2PDqB
 AoXUwkHGa6wX+3kU2XTvDHOAinYaFofqphuRYTJ13AkBpZugPoYLCKWZBL5ClubD/YJGVCkHDcn
 PxYXNXZlAnTStHP0Nroj9TeIz1WbxQDynHJAnItissZOn+PrcCUf1zoLfF89tbv6zPtaWm8W0Pk
 ZC4rBKz/s9Rdg1dFF23giKDE++WTwLvDn7iN6Akj8IcDvTu72XFxqjTUXdZsyrWXfcN52gWD9QW
 17M2lATs9xvul3Fp4Kuqyo9gqNfhNaSYdroarwMvutyf8M9yxMg1clYljJCaly7qhthHVY6S6Z/
 jtDsenw5JNA/m2231gJE2aYGxry0cx3BreIm01SHv4HdVLU6N4IMoiNYysPO4ASQF4MqiFih0Nz
 3395zlYm7yddBHt/I1JfNzU+ssWFdUl0FBvdFrC+l8TfukP4iJNKZ8Tcwlmqnuy52MFCXJ1dDQ1
 0YN9G2Imr8dg==
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id
 5b1f17b1804b1-4bb88805c26mr199583275e9.8.1795427643711; 
 Mon, 23 Nov 2026 01:54:03 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:54:03 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:39 +0100
Message-ID: <20261123095339.1566394-11-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 11/11] package/yq: bump to version 4.54.3
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

Release:
https://github.com/mikefarah/yq/releases/tag/v4.54.3

Update the Buildroot Go-vendored source archive hash.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/yq/yq.hash | 2 +-
 package/yq/yq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/yq/yq.hash b/package/yq/yq.hash
index bc9dccad81d..8ab20d67ef1 100644
--- a/package/yq/yq.hash
+++ b/package/yq/yq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39296b55e33962ef838cd8a1bc0e9850e775de4cc3843bf15f099324069d2632  yq-4.45.2-go2.tar.gz
+sha256  b743c99e06ebece47144af3cb5db861c1716ad1de8198270bd1eb701de2e6fb2  yq-4.54.3-go2.tar.gz
 sha256  697db34dabb21562fe84487a2ccd031fbd45382b89c2cbdec8ef31682c486040  LICENSE
diff --git a/package/yq/yq.mk b/package/yq/yq.mk
index b42b8e652c8..593a56b5e62 100644
--- a/package/yq/yq.mk
+++ b/package/yq/yq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YQ_VERSION = 4.45.2
+YQ_VERSION = 4.54.3
 YQ_SITE = $(call github,mikefarah,yq,v$(YQ_VERSION))
 YQ_LICENSE = MIT
 YQ_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
