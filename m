Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF9C606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bX01mN+x;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Py4/oXoS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD586608DC;
	Fri,  6 Nov 2026 19:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mf8xFCcmMoL; Fri,  6 Nov 2026 19:16:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA22660A52
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992588;
	b=Wv8iDu0bexRZyaO0A1hulB9xGqTKL4UoPF2Xv2k+SsO90MLv+s5NUd9KIbpXSBZsj3nE
	 bNpfMlLtL4OOnQdmm7PGvPh2RdK6jf2NWixpx23LZbSyRPl0fMse/cg7ijZX1zkTYR9gm
	 u9TFcI+eMYbINUKFdfVGmEsK8NdQHAP72coxR9oCpIAFHHmHqW7cWU1qDKVw7jzpG5AQV
	 WkYNwrOKDldgcBA8+kbjLPhIigL13iXiPOrQ4K9W5fyGeXPWqADgUWuSpVBjgPfQNpt+A
	 ies1JvYAXpbPGbFtWtf2JWO7cmLHkgBL1T0r2YXWWn4EZd1vEbgmSAfpbmThXsUa4sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992588;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mo3ZW17nkka/MnBuIzVK0BsjoPufTBnDEK4cwmaPyis=;
	b=H95FuB6yV8k+K6UVQ5yRJJ60IZbhgkrOhAbQtbv7izKF2Z+2Yq7tC3DLVoR59s4BRzcJ
	 NI416IHRVRufn68Taqs3gxhboQcajn7XLFGU020x50CRQAXt9PVw9LvFr0wzMPBI9mmni
	 iCu5kqRRSV5v9w6I7TFxK+zVzV+9MVKycWjGCkeoY+drRBP0koIqINRzcGmUCvrP66YXF
	 hX576i15aFPkeA9sd0byirpbGCcvQiJOg/6fLbR067417CehXK+eG7gUl633TZ4zdCyX2
	 9LpKXnqTyHQl7rFywmwXhx2DIXH80hl6P9uMZeRdNOWLsd9VOQNsn2Rs3cbSUHNSLCA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992588;
	bh=mo3ZW17nkka/MnBuIzVK0BsjoPufTBnDEK4cwmaPyis=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bX01mN+xIN6/eIFUaUmPQBifN8l5VRJMkRBesBG4sI0RuvqgyKfgMW5OzwbtBdl7d
	 HivPH/l+YYNIGjVf8Kkl7P4Y69dPwXXtab8/Wcf2cIUp6Hof4HiAvp0LRaUHpj/+fg
	 7fBWqlqmTCVRJwLgTrteu39uw/L5CofWh96C3Ggpjk1SHP2QYqPbeiUn9L/nqiSH36
	 4VA3Jl9zW/1ul43OKb1o3zAd4TFqehetfDESznq4G2NEYgK7JMsHpyMYKCguRrL7s+
	 vUihOV/utuifkzCLGym9DIcFgHLMC2wPYJEMf1YA9Xs8lXeGUV61SlX072eeym8AVo
	 XLR9gVRmAx5bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA22660A52;
	Fri,  6 Nov 2026 19:16:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 137BA4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE071400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLzkaoMshtCb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0E048403D8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Py4/oXoS
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E048403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:22 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-843cf077f10so1407082a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992582; x=1794597382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=h3uMMsmrFrsH6156dZ/3Jek7OCJ120omefjJ5dl8JCk=;
 b=Py4/oXoSZNRVRR5koqXodJ7awnUD2nWG/XUfNvwwr65yt1HPP1AuthxCXzXhrgY2Oq
 BWlgMYDYk3kPMASlEZ3sTCBkobg4LRweojs2Xe7in3cfEfTqQbeqn5zdQPT1wcN4kIM9
 nDAMvnqlAa2EdgFr8yENxNrx7CqWbdrxMQSNlFfJLHnOaqFayF/tkycXuOLRHL7b/3GT
 sYj3EfJzVahO9NmzpGdTL5N9lAU/R5VFETa6NCTgRRTkyDoaS2Wd2CBLvgJcUNFdYdzj
 mhQ7kakTzfNdo2hidXfG6nAhgRV3+dumkat3GE+zBZgkhvl0fNB/LnR5VHHUWtjE4gvx
 Budw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992582; x=1794597382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h3uMMsmrFrsH6156dZ/3Jek7OCJ120omefjJ5dl8JCk=;
 b=yR7Si9hSAhDad1ScB8XeNiYb5JCHcUzHVf2MPtVVlPq4ef3nWSG6K9eaLEjBbF+oYN
 j7NdMSV0gvQWLZtQNfZrblzEHcq2gD1H9ZwJy2vV15QSR21mVD+1kI44Q7htB+g6iehp
 ITxkSLTtZ9D73DpC1vV6Q97y9/d9iklYIyWtUazGJoI5mZTSLWGlkXgRKIXHwTcqsqUq
 dRD9d1o72tg1cLr4QJ51vgCzV7sHQZIqihoNZ7pOqCjXYIMNMsiGvfWW9uDkUJSuNYmy
 0e+SF5olEK+/eoIrrxu09hPqD5SJVV01AClN1xDrZzbjhnzgu/fBWRzoZLJjSg+DV7XK
 UXLQ==
X-Gm-Message-State: APuU4Z9fE+lgbMJ0jLPHqN+cF0jB8FzDRO9D5z62bLLkxB80F8NYNXyO
 JcJhl127T3iTFkRWOkYDQeA3jQ+pLAiFLtAJ4SJAdUv/oeaPIIhpaeghDZ98fA==
X-Gm-Gg: AYBFou307G8Lxz67YBhPF/T8u9oaBiml+z9Xgh1bOn73Qr7mAgP5SJc1m3Cx63AGcBN
 7A2KgkYfv+0ff7sx3l+jd79LikWO71FxJI6fnNDv+mmifQmh9F+BJwlnPrPbYMnwatluldMq6Oo
 jKlPAoh1lNdNrrkiKKOP1TS4UlcTiiSOfWz4r82I/9KWxxCpeApNjRnmJKq45aGjruk/DiIsYwB
 OPPIfSwss6G1Hk3KIh4Oce/AveLUxwUt+P/ILfPehIDXSIyJs9N5Kg6YxY8JuW+zyTZOu/vGaMk
 I4FfDe+m8L/rbGBIvPXGIr0DPwXGAxwWk2YKKpIEm4S99xOvhxZ0K0lkP1w5M/ficpWI2UE0xOZ
 2lZnQYzIesRYUMYX/KAnZAT2Iw+5As68OekMP88dD+yteu4+cZEZIK+at2UmmDzs1+x4KXPv/v1
 VGDdE6yAZ23hO4/mei2NIv2zYMooLM9jnb38kcVT6d1Q0S3uqkdbvvehX7zK/QBBztoKmY6Y3jy
 n0wOuvhPUlWnDIXxCqh0w6UBEyyB5wvZKBXMSzPk8svyI9mydBCMhGmRl4Gg1WHCmgqRY3qZVsR
 HkE4r9lxormGCDiy65GaPVCXuJxK8eLQYOgZ1o+NKLi/+LX8pS4T012NPWGXuQt+lM4qqQBWgo/
 T0hVnGOksMyka6Nms07MkrQUzO47ugWBuf/hktT/3JDHMCXWmO37N0xSavIVnsujClCWAIkyqBB
 0p25WdO1gJZamvl+0znFWPDbQ31bLA1glGl+najbBZ/I4A9hu0QTKbK7qLyOEf9Q0vDNqZgXLhb
 g==
X-Received: by 2002:a05:6830:4490:b0:81f:af5f:84ba with SMTP id
 46e09a7af769-85f1cff2076mr3112143a34.16.1793992581660; 
 Fri, 06 Nov 2026 11:16:21 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:48 -0700
Message-ID: <20261106191536.2120153-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pylibftdi: bump to version 0.25.0
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
 Christian Kellermann <christian.kellermann@solectrix.de>
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
 package/python-pylibftdi/python-pylibftdi.hash | 4 ++--
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 5b2104bf9c..25c3fda081 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  9ed7dcb7eb5b3f4136ef06cd6fa48cd1  pylibftdi-0.24.2.tar.gz
-sha256  c892e71178055490b90db488a0195cb5815b1554061c4f31f13c318806d532e0  pylibftdi-0.24.2.tar.gz
+md5  ee365f6fd1b07cac7497e431a1b0092b  pylibftdi-0.25.0.tar.gz
+sha256  011361fdd9efdc52d8d3feda3a7917683f1368e7fb5c59ad550efd6519b03f99  pylibftdi-0.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a85d0bd07d1efe2c7b24be985d3d9bfd4e9492f5e003e366acd4f99fe95128f7  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 2e77069bd6..3c8a69a711 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.24.2
+PYTHON_PYLIBFTDI_VERSION = 0.25.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/26/d9/23e892c9a1d08a0e01623164cb84ee6334aa1c33dafd0f4cecf763513a31
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/12/5b/ddac3684466db288c7c2113fb2eaa89f663e088159123084e5b9ce3efcd6
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
