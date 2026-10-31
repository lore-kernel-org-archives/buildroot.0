Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63B606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gucLU3Y3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B63S62UM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A886B607E7;
	Sat, 31 Oct 2026 17:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCh4r3465EH2; Sat, 31 Oct 2026 17:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C51A607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467254;
	b=hK6Ig15X58qtWTi6Yv9D9/9m4LjW/EPT5G/0LClqP/VcXg+LP45V8onmK3MQRwSAyI/U
	 SqGXDzpansf+fI0UNEy9xZOoOIGzFkjElJxqijGkxCI+Gr4P5cEFA0KvOZb4UhnDg7C9H
	 HkJphavce19w6r6fbOA/7obXzOzyAb0AsdSapKXEO811/M2Y0qbUgxxG8wQwu1JiPuxY3
	 Yg6v9s2tUDAg4exGvQGc2S0aki/+/M0bV/u3qrSnbSEJF+VvkfX3LY2EQvBfRi1/+iAUD
	 CPEPEtyXtpnkDMRMywOA61vFa5LJNwclQUI0VkgE3FhzMY/ZXSpB9ba8ydW0MlKXxww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467254;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PwzmpKIQAHO2tz4N01MvzG91L19j8zcBMyDe8zZ35zM=;
	b=NuFHdNIHySYjuVliIp1o6I/K0Dn8Y3Hnv9luCklMVfSWLbC3+0zJIBZqER6azfXP50dQ
	 ctEbCRGPz7C6Z+W+rHb/M+BbgOZY57rhZtl5NwAF8bIC28mU/1UA5THhqUjgqoh0ypTyf
	 JzJ2ORe5gou49lnTL6802zh5SE08nhxen3PfQB0AvGizX1QOpeLywZTe2E6zkiRo6J6Ke
	 GNGLjmZXnTadqLEZm+WMNx3XYgLIVuH/zNV7mNajsDKIorVTNg40TMR3DSHKgub+yUDpM
	 0CNULMlMrzxIKcpZYSz3h9MSZD/kGlMZjHWSl23Njq37xHwKEkBk5jXcppizx0MAbAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467254;
	bh=PwzmpKIQAHO2tz4N01MvzG91L19j8zcBMyDe8zZ35zM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gucLU3Y3EI8RaCJmBbY2dQQA1t41FQ+13700Rq+P4j2hj8+2NflSvKxjqU0PReO2d
	 HuBebI38deVKsFfqDFgQvLjxuI7vaMjzS9Js/aWBm7Oq71T5xcnNwmYC7HeDabHtqW
	 dPLdxfDKUKmILTHYsV3pvYUa2YryPy5qRLIE77pwXtRjhmR20NdqjiCM1Z5UJD4ui2
	 oCve8u+TbSu9Gq5L9vgW90KCdDeOadxDBDVwvmg57WM2h6NK7j9hElW4wWWuWBmv0+
	 gdYhviMBDnZ1fMya1Hj305shWnRGFyY241/mBqIJrh4EkxVZitslQxhP4Xa5e795Em
	 j+1N0Lh3jc4Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C51A607FF;
	Sat, 31 Oct 2026 17:20:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C63E14E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A55A180DE6
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thjpV5FZxDmt for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1CF9880C85
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467243;
 b=lBwawVahdNjX0QZfPBGUNMd1Gdwrwd1fk9xuEWgKhs+Wwrmxm3B7c4s5EvgSrMeqggKh
 wZABIpOLgIcxfh0XpZRjOviIjKG7SXOSEXcYCIZEV7dhT8mR+bvFrih8acXRwvqV5r12y
 Yh9nH/XXG84/quUdKo/WmdnPnA0eufJAZ24M7jJPzjNJq4QzpOBZt5MWRnWTE45UOzJcc
 weJtea7ubBmJhwAJkCQS6e96xOHPB9Vd897zR1Z3MahW70PFlNE5T0zRvQ5mrRJl5d3qO
 LsLoFWEoDVAnBofEg4MlKCXvJUOmTZr5jRXCV69OnKAtWKHEUTPVVasqku1UG0Hih9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467243;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/gLXD46vl2jvaMlPasxG335r71hgnxhlBBUdKtpq1IA=;
 b=drLmKjrOY3YH6EB3GZIvBvpEVDHhBWLqS4mtUB2QAlZYIkEupictXlpERU2sNuZpnk55
 7qdUboeWKXDqEY/LedMqEpczEFtggmfB3dAB2E5Ci7WwUzhufxDOPLvvYc0tMY9fEPNHe
 DmUt/2HlIrDpBZYntQlpHcQkmyRwqXPJ5wUV6ixumz7WQktIP2tHfoBF808pFVsI1USP9
 iYNL6h8h5dk1XxE8IbORLmrDCwS+uMfMcJlvhPZCsu0ncfXHF2xBq4/QUESwdK1P+KKVr
 +sEE7bwuQiP5UY+HYm833/CWDPMuywulOJCmmbcyV/rynJC3Ov2AqgBJrBBfNe8Lzug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=B63S62UM; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=B63S62UM
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CF9880C85
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:42 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-85ac281604dso1015143a34.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467242; x=1794072042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/gLXD46vl2jvaMlPasxG335r71hgnxhlBBUdKtpq1IA=;
 b=B63S62UMU+JoNHkIvGNliREFm4ttpgAPLVxXIzgwy7dycAqRUYoGajOB2M852Pxcbt
 wf7egIw1Yu5KZE+KROH2LxcafKcMO6eutY1tsAWPY2AK2+ncDNqm13ScnBpRqXQy2I/7
 UwWS+C2pYF8UDBYtzucfFn/VuYTgu8m4fNNMG7wj8mGHMSZYU/B8pI4K8BMUegYlI4yI
 2xmj2Tu/6GSD5okm5wGYZMjFcZEcPR9UjDy8jPKgic/yjMDb7mBpGxSLYZnygenvm/Aa
 WVm7Fxd0Ehf3cLWtaQc/xgApnqsgUr+ga2Ghvwsxolty4KZJidiKWUHaZYRKgezMMn/S
 cW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467242; x=1794072042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/gLXD46vl2jvaMlPasxG335r71hgnxhlBBUdKtpq1IA=;
 b=FX1J5kTA8Qvc8XV0FasbwLd995A6nMQJy5Jjk0hBMjxAGgQwsphAd4ResO9Ag5iEwo
 /3/+I8iNVxGW3BlS4ACYSMyc/rv/xqmJ/J1SkM5GJGZP1FTQjHVXt8fLvBE5uZOIYIvc
 OmXWgbt1NF6Lorqi7yP/TtkvNAORFVdWtVeOAl32l72q2oJQFVCYjYEq2KHKggzh7v43
 NtZCF9DcUZORD8cRQUdxThHDIO8JvrA+QRQZ+u0QyZG0OSWUSo/Atboi2c+LA5Ee18M6
 H5pJkKiGG6wrEMdeab+XWViKrrosa+cAQBf3Tc/DRYUSs1EsDMkPS9Vc18+4AObW3wBu
 Zp7Q==
X-Gm-Message-State: AFq9FYLe8OFZMuusEeg5brYmE/im01VKbnrz4PvDIUThcRiULUhM2/Qc
 VJFP9OZpBP/9c0IO/fXgc/AMHtDxzZoQwiKIoMpX9JCDtyaCI+zPnAH5DfDa1A==
X-Gm-Gg: AYBFou2O/oJSULK8TgOgB6BiS8rCZh0/3bbmOrs+3sCscH7wQ9C6qeXnS8lFE2NFxE2
 xLcJBYU8LEIJdQaciA5NDBKNTMCXjllFP41ZPPR5DudID7pzyzRqlmC8s1LvAxbDANKeaQLLcQG
 A9zWhQntD5j+q9vkHazXOiOr6ELV89U82fq1LtY3s2BGeS889czYTL76OWIZ5oIJ7pV2U41IBto
 ykW+CfCvsy0izPEOKSbC8piwNTIlqY+4IPrIjqxjnRKWkhJVVwyYIRUdFWPtSaT89FRE2bfjzV7
 IoyLooivORCrl7VqGh6WAG9e6Exgu25N4SqceJo4R0CFmryV6smoNEkARkQApxaCINEADWU1bjk
 eEEKFX+DvY1YcSdfiz4RFuRGr5rTPNb9g03pxrQFyg72kWQiEJbwS6mOivLIttLiaaDdRhfIK3E
 +S16sXWSaDLNmfu1q4ToFeIbRc7Lxe/Rig3bNE3MgfhcVWLoLnn8BgBMAe7hCv8IirH7YU7d8ig
 ydte0FOzvwNOWP+HOeoGDFhRN7R+Mb4stH92dADtu7kiQaYBkOc9GMQAf6rHsFyY3iuTdopdx7D
 IFuo5gfuJOHjClb30NiSBUN7E03F/iQiFJ+9L8/c1r6l2MzdtsolyVyfkpboschZoEtrm9/+/WO
 GUTj9MtdEBgPbL4XLL7Oquj6ZWM1N+1iGpFWnlQIl2jdYF/deLgcA1F/0fULoPajxxtEEoqPo7C
 vgEH7gl+0Ewj9tSIt4Lkkg6sVTffFPO7pk/KcTuww8BBS+BeDsTo7btHC6nU5cEcb/vL9I3UNSL
 exqjGlHU3H+4n+Qzhb1+1s=
X-Received: by 2002:a05:6830:440f:b0:812:4cc7:4afe with SMTP id
 46e09a7af769-85d3649a93fmr4190968a34.17.1793467241639; 
 Sat, 31 Oct 2026 10:20:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:41 -0600
Message-ID: <20261031172019.2683287-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-msgpack: bump to version 1.2.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
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
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 1669af796d..90b0c28a90 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  80009973366d78b6dff0e03ca0a6dfc2  msgpack-1.2.3.tar.gz
-sha256  32edb81a2b5eb7cd7c9d941b2bfbbb082fd2cd09e0e725930316af6b708db186  msgpack-1.2.3.tar.gz
+md5  210cba728d84b9681f277a8ede152c7f  msgpack-1.2.4.tar.gz
+sha256  475c44e12f2a5de766a8448783f149c9b33f3f49b88953c6cd739a77d93c732c  msgpack-1.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 92e7cf3b17..1ca2448949 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.2.3
+PYTHON_MSGPACK_VERSION = 1.2.4
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/0a/e7/bb605a7bab2d8425a64b3fa762b39dc1bf1c7e3f11ba6fb5413d6db0ff8c
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/cc/52/1ec7ead2c7528bf3d1db73e886fa4df10f9e6f0eb7854a448b7090cfcef7
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
