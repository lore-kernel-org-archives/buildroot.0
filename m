Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7F9606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SSboLRIu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INPovnWZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D0160A66;
	Fri,  6 Nov 2026 19:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeO3DFttctCH; Fri,  6 Nov 2026 19:16:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E639E608F9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992594;
	b=TVmzVZGhX6IYJZNO5g+oh5i9yxh5vwGnGs+nD3KrovNUpzx7xvV0rX5x1XMAjcOo9BcA
	 PdGonjUwFF90QSweGd/CTQOlDbPryW8fi5JAaqO6tmv5SE/m6lL99nFAhXRJmmeQoKiqz
	 IlD3UmQenYABsdZfnKaXSbrwZVrog0Li4JQ/cBzhHhjPmfd6wCv1xgJyC8t0fj8Ecb6/E
	 jjfPymEhSz3snMi1rpIknboz3Yz7zwb7czIfmQs37QzMb3AzzYR/6JQVdrSvNlo74AmkR
	 /IDtJVGLOd04wjG0KoKPYJEVUxZZ9ZyY1dyBCTax80xt0T+GEKiBkO1/LawS66I3Xcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=trTswAgNUemTGQriFxujacgep8gGEDgQwMCm0Sjfguk=;
	b=qs5hft9y2FdUQlQEkG6nJ8xGPoQctFWlqXp2KlxTubO0NuObyHc6MeEicqYqJHh75kk+
	 eVEgdzwyeYxRflgcdADIakZjmQhrr0szu+a2d1ExuoF6v5HgFVEH9hKbBItvy7qkZBfa2
	 8OGE7SWTrVzI3RpD+nj+mt1UOZLLSfFSZypEiqaIuxsXn+plQ08V/2faQZdvuMmF52DqT
	 neKgtFpkr2PRHCG2irtfe1cMYClCWwHTw7tNGZISry77tGr8O7OQlIj8GX40TmqrmAnOJ
	 lJ1Jw1vlM47WeCZNauXI/3e/CcJCAF2lKZK90aViJoGWuIImqbw8AZgc4wQ17bQtg7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992594;
	bh=trTswAgNUemTGQriFxujacgep8gGEDgQwMCm0Sjfguk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SSboLRIuNYsIFYYaTHD5akB/Y5opm5q8fwM5iTzBVjsvsb9fq76Taj3BDZu1Gk6ua
	 lVtoM9uoax0+dYN/pbbjAQKZ/Qzt6MZa0KuSHhRPnMDmsI6e7Z4poKc3IuwD3IymFp
	 OkQ74oR/Buo512tg+M2e4GmoczAQzd2LUNVmIVu3vcjc7iNogEMujwYpkTMm3X/OLk
	 G0aXbcDgSq4QG8IACkZk2y66r9dA6ukGmYffgMNbhikemOzaevf08ZHJnCFnsad1YS
	 o92Ek68wEFfBwFdAauvUVEi26SPdHgsrxWgEzalUfbYAXoS3NWF5qksJmQPm4Sq5S0
	 BlZ7IbSxmuAzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E639E608F9;
	Fri,  6 Nov 2026 19:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36C304B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33A9E812AB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rsdRVSCCKg8 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 57B1781468
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=INPovnWZ
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57B1781468
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:28 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-845f3fa7f38so408734a34.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992587; x=1794597387; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/AdlJIWinPRMv0DZC2ANwBl+W9SjO+Lp2yrwycfeueQ=;
 b=INPovnWZ46YP5b8KiMkf+eSLy2n+vrkhdFxNBMAhZycikb+KfHgcXLblJgAqc8aHhp
 FvAxdtguZ7z6ZZE2ae8ckUOYyI3Xad+5hEkvWXbiCcw8A3Sts5BjRSQBS0p/DZrJ/a6U
 tEiaCi4DedRqommAwIeoW/xxvW+oBhyb0sB+rbLvX7gv2tNm7CR5TFhps2AUKS8H0WnI
 SMf6Yxp9jFADUniS34LdgglEhQDydpcww3sIk3dIIdVwDBxwihxrAuKuKvG9MzWl4KMw
 g3dpn75lVIFU18k7lYcQ/DmXnRdBlxS2Qy7HTsUBHeC2hJ43rjoo3v58WbSZqxWZxVsp
 XzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992587; x=1794597387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/AdlJIWinPRMv0DZC2ANwBl+W9SjO+Lp2yrwycfeueQ=;
 b=SniSDg8L63Ow/5T5HWM9VEsGKU7Vw3cWwpHUYy1G12h9LHKuezh814szqnsQz6i4Io
 9TUnSilnnILesgTK++LF/xXOByedAznu1MRA+MLrVD2SXJa0AKHc6o6PsJJTgD8NS8/E
 aElwFWqdFPpRa7ytTCrVrMseWMrB4De2y3rjXFQfBNlVrcC09EIc/fGnVbRUuHpaCfqy
 vuiR+4SZ1ik0W3OPsdjNs0+VGwvW2gRHAEQVa1otwnqOEGzDVL1vkSnEWno8ESaLxJgV
 cqEVnFo3f8kWIHrBVmgZWwVbAHAn1BCfCumAjXPJqfm81O15dxsQXzMIMoj2FaZGlyXL
 +4xw==
X-Gm-Message-State: APuU4Z9uTfLxN9AwFx1+lKZISvRvNSaz+c4DzYlQYlo3+FUzzPM917Jw
 PxVi0jkXz4bHu4/vDr0TBPKv0SILy8ytXHp50Xx3AHBHFokoJI3Jpe1o2v+evQ==
X-Gm-Gg: AYBFou0p4yAOa8YmsC9DMRYh0aWILYehiwl9g/jHJpgr5PCl0EmNHDQIi97fypnBsQU
 uNjdf9/cdw3NxDk+zcqIH+oTyiiYDmkbaiMj/yFHMMOFPEdRI0lvxv/QRe0Mq7092gVFcwxMh0z
 QUFK0GggrTrBXVeuuFJZSTP9UYgCNQ1WfkvScGYCVDUiNfphvHGZIkwGw61atY93GnnaikScfqE
 qFsJQiLHS+s07bRywho8PNY3JV5fpo+Vn+8jIbJixljzL84cS0j5Va20MhxUi3nzzC/9uNdfvVK
 OHIYt7Xi3TMvlhtr/ew15UVhMhHbmJAx7AmPHDTK/AnL1X9rBnc6TKPi2rDnnPBx5hVla4tcZ46
 ip7HcbHKXoHzF++CCueo5Ak09n0rpoSH8lLLb7rhcdc27W3KSgbNFCZMwJzR3VIYn/a6kMgbSxL
 XOrVaRAar5PxaD6L0Y0GmNo2eN0f3VxL1uOjiDqh5Z80Q0zJsZP6qfi4nTzf8+Zf615zN6wJ2ca
 F3HHExei9CxqxB4Rqyi9aaz67MTR33fDU+STlCjcDIWXDbBQ/3HAe1frI12TMAsFRjzVf9Wu+c0
 DuBVoM2PT/b6I/2/srixMVswaj//O8ww88CTkanSuWBPT4IJlNmiTeVtFNicKjQoJ2YYGRdKAuL
 k9qp4zSPoRsw/l8IWhNfkdfNFUsdrMZ2myp6374iMmlN8q+pg5Qih6ytS2hlJ8lXD2dkOEhzrKd
 O9OwD+GbOdrpMK+ixoy6m9aQs8BHizWFgQmRDa6eSz0WAFQlZF7OZoo3V4OzWl15NhitzIlAHpp
 V1sIZHpdVqcVFUsp5AJ43s=
X-Received: by 2002:a05:6830:438d:b0:829:9992:2106 with SMTP id
 46e09a7af769-85f1cfb66f3mr3178814a34.22.1793992586883; 
 Fri, 06 Nov 2026 11:16:26 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:51 -0700
Message-ID: <20261106191536.2120153-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sentry-sdk: bump to version
 2.74.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index ee77b2d028..7599d5cef2 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  b904b4e99adb7227d3b9026e71bba3cc  sentry_sdk-2.73.0.tar.gz
-sha256  4a2ab97b16e4693c325ab361c7bbbb346dbc7d0bc0150922d795a25bac8d5280  sentry_sdk-2.73.0.tar.gz
+md5  0507ff6aaef7fee4d00929df3eee3462  sentry_sdk-2.74.0.tar.gz
+sha256  dd91d75aacaef636006b579ac3ddb2fdbc9dce35f00f4b353b6b1b110c6b256a  sentry_sdk-2.74.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index e15f847060..1a442b1cdf 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.73.0
+PYTHON_SENTRY_SDK_VERSION = 2.74.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/c5/3b/1e47acf2456781c26e12007379ecc154bf310b8f64d40390d78b791d55c3
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/8e/7f/1b16ab4aee53cc5db976bac12e6df5d562aae3880965200cef812e7121d9
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
