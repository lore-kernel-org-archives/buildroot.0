Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C0160A5BD4
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IdhwaYoI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXIfIs+J
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4B5606B0;
	Fri, 30 Oct 2026 11:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jeglf48c_rU6; Fri, 30 Oct 2026 11:53:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B11576061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361203;
	b=GJNl6XzVxQGKJEjpwGfNeW9jwt5KYS41bWvacnNWKfxeDvC42eH0ozTaeX2gboFQCvEj
	 qXU5FihBawyyuYv+ASFyOvwNRkH4u9QkX4EtmM16/DD3TEWb2OP2MbOTBsZWb5FH68297
	 EPuU+Qc7Z4bQVIzGR8+XrW6q4pNGpgMAVvR8k/bfN3S7cl6uxNaPXwXaMy13+8+o2GAws
	 YcQZ6k8juQQBco+3C5Coq7KXvtxvYtBOzTo7oOnHYv7h1E6fqzUqk0rcpswFN5iTGY26y
	 krTVA8WXVmDn3SHjydsLxrx55O3nlp93dWcfXuRbLtD1xG9iVBfJljNGH/DvDc2cw2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=g3NfGieM986g2YjoWUQtVrfn3CyuY3AVc1Pjf5lj/Tg=;
	b=qf5/sLRvxFGrIf2Ic9W12dw/gxyNASiDS2vmjNaphSX/gi2pW9+PWJzXXCc8+8Kv0XBI
	 4FvZea9gqdmK0ExR2W1L+1pXOmlk31DRWBg8Tq+i7YW8rp61ehy2Tt5H2hygKA4ZSKF9C
	 mCUhvP/m5m9l8WFof52vZCcqdkiGBHKRLZ02EWE8yEccjCFvHRuhVyMaDQJxXQxyCJwlN
	 8rS+ku2NE3N3m3EoZ45NikWXvr1JADEbRx6alIlUpcWrHA0O2o9T7pubX8z+IEAG31jFg
	 0PGgQdfQ+dSqQcZa3y00qwWB+GfOgqvn4kRd+wYX4VlLpSXtdKQgvNDSOY6Fm5sje6Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361203;
	bh=g3NfGieM986g2YjoWUQtVrfn3CyuY3AVc1Pjf5lj/Tg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IdhwaYoIaYx4jPpwSI+pxV82YqWiZg/I58UGSo2Ns/FJ4qmreB9Irag1/L1Ergh1h
	 CvKVcl3iVw5hXtKuWFsmkiv2BO9whTpfksl1aYgcuH2xLNT6IwaOv64cKfr6YF8EBl
	 RcO2o9iJtJt71v1HuDgYMYQpzebC8DeIWHxJOeb5V0T3mQhlUPHQafuN2tap9g6Xkb
	 Tow0q7mVglG3KKOtWJL/dZHBpXCYnT+0e7+hidA7tUfz9jPWo64dom8mLpNLwr5Y3Q
	 xwzzWiTwH9HLwJDoJ/LcfGD66LgNHA6sWTDSlnBLyVogaSvMtMZRa96ilPZr45rr87
	 nUmqwNIMymi/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B11576061C;
	Fri, 30 Oct 2026 11:53:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 416734BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2776140276
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1xJkqSQripq for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:53:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 273A040243
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793361201;
 b=IxlVVgVZNsbWmBLf4rtIAJs6fJ86UPcao7MSaHTIgUp8/2USgS7FgJYhSWSPpbFHLDPp
 1MA7K9kcPuFc1egzUxer3WFld6A2JZ5LvyYvzn3HI5d24CfygBn30xUCcXxIOuG8++e9A
 I0Aj+DQ0eQREWzjHiBmAcEatGgEPIlr+/0ssoY/Yx1rXkifx9GqZkaufPVHYWBHWf4l2g
 Qcdl+VgaKABIPA1b32bT8g5AwQvICv1JDcQrrB8oDbRiTJC9ij9ESwmekSek7nYDmBAo/
 +QYEZ/eSBSmSrKxpD7LoDVQ66mvD0vuHLLQr9Gwjy4V7l0in/UJzyOeDeRse400tl+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361201;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=dNF0HxHdOh0uE2hPrFCBkk2OBcuGsPTjdtn0ScTpwE4=;
 b=m103JdCD8Aw7I7WHRtAP2aGFu4COmcdaVoNtFNg2VFNaJgyNwwRxxk8I6yf76WFOG7vH
 EC9n7mbxJoMWc/VJzEvbIe6rryVdOBTP00aysWW5V2zdBbLD84G29Q+8ti7AXz/20C3/D
 teiJxHxRxhQrU1rGSwho8Y0NQj4NVCBP+d4onaq5SDy59lykdXvIiXCFThRtqbu3tlKe0
 yAjsKcMHRz9AfNx0BTnFSNF5uSfo2fuuiXrtFUKNE8JpjZa09lDe+sXTGk+VZZ2xGoyL7
 WF76qQNqhRFZ0uUS6mjE2emt+/XLI2g9uSRUa9xes71+dvqLDCDjxa2IY6RLgOY6fuA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=GXIfIs+J; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=GXIfIs+J
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 273A040243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:53:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so6040055e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793361198; x=1793965998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dNF0HxHdOh0uE2hPrFCBkk2OBcuGsPTjdtn0ScTpwE4=;
 b=GXIfIs+J6uyH3FVFyr7Zt9R1/koWpF66CVor6nYyI0cTFuQIknW03DmP256QpREhdF
 Jj/Al5CsHapCZwYR4JviOVMPDhVygt8cvBJEPcnI7x44oEuXcjTvhD5earHe9UwVbnja
 Fil/lg3JZsI3r9vuQLrgmdum2qyvqsKhIRu4za3p/MqjhZ9Q+HpjQ+DPSDqwD9lVGeJq
 sG6P8RvsIec/d0f8vzFTyYlkI9a2QlKawxYB6vL9okdNiy8SXXiM2P8w3WBgpVYxpZMc
 7veyPwURThZfpg19cRKaKJLlKVrzNj87f8ORZG16bWh9aM1TDS+7pjLzsZr9ZoUhsiQ7
 /oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793361198; x=1793965998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dNF0HxHdOh0uE2hPrFCBkk2OBcuGsPTjdtn0ScTpwE4=;
 b=T4ztCIUzo5woSX1chyl+F1eeeoA13aRKfgjvyWxM0Xtttlgm85lWzXsvCm8SWzVmhG
 JZsqbvofSrEIh3eYF+GrOG8V74R31JTXovd2uFepi2/KRhreMATHpkCzTfQwZ1IDbSJw
 sju9PMZnAy0u8+Ol/p+j47OlSQ4FJ+kV/XM8Pa/rxNRBODHQihHXohPODaMWm/59cBCF
 LFmTTR7JFJ5KGOxk9wrNIkyJQFeFrQOt29lGYKX7YYS7y9MWj4d3zGgFiI3fxJvFD6FG
 Mxto+8QbsEN2Fg/fMb+fwfD/tZhvSH7Dc41NGlCm1iaTrfTUSzyd622tiT2x8ZuSUciB
 9bmg==
X-Gm-Message-State: AFq9FYIRI3G0a+FPIMzR2qP99kTJnISA0wWsYuCFiotYZOkMgTjVlPTW
 nB+jyZyk9pIotTs8/+SuXDnmBan8KuNw2YZJl87s84W6D/RQYYCSdIy00GW1Mw==
X-Gm-Gg: AYBFou0NQznseSppRtlZzejoGAW9u29RtLmAqLXHuZLpurGfEhU3FVHH/vjA01BFeog
 sjzEfklU+XgOVEL9z+m9eQ4qENgSPxPhtfeJhJNHeh7eQB2mkmq8G0anEJ8WZ51+69u7tDZjyTs
 ufkES15a5wTBTCwnj/AF5YbC1gvqdu9oU+OMsNNqjiwdY+zLsJtm9uho1PP69y2fb3v9KAtTpEy
 d2rvmfNtDHAyTOUH/QLlYp4Tt39c7FM/NKZgzCkeQ/gLs7inM3vmAvQXqp10Y6CEcDugAkIKZux
 ZY97+xXliIoMtQY9TfIp6px360gEKXYuKDqLmX50VCoOBELNJmmTY7tAgJDiYaDO5dKirhnByOc
 a+aA9kKDCrdDn6XFD5QeQGvmnyIIwJPTZeo2zjmahLbxizbA6ttV9NOwMKpw1hb1LxAj9ibzogX
 V9mA0mVr02ZbUpTIY6PmBKYQcaqUZactnRyeAUN/WwVBJtRyIkwLacm1tJtyHIpoDhPzsUTmh1e
 ZZLyfPp+a/esC6eh+j9lSe3bo2mPS/xkMuPR4hnrLZO8aiiquWEGv4IIxOCZCU2JW5JzXkv5wL5
 ISkSbs0ExYQvG/s6mrO7hZwSwiCHgenXYB25XMOihzBH3tJTCgy6aw==
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id
 5b1f17b1804b1-4ac185bd243mr44455535e9.17.1793361198437; 
 Fri, 30 Oct 2026 04:53:18 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9a3b1sm2985020f8f.44.2026.10.30.04.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:53:18 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 12:53:13 +0100
Message-Id: <20261030115313.3112716-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-web2py: bump to version 3.3.3
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/web2py/web2py/releases/tag/v3.3.3

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index b100a1fec8..fd16d50cc9 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
+sha256  68efbfdc26a1b5a2d20bbfec9de522e7fb88d36b73ab7dac24011ae3d51b3380  python-web2py-v3.3.3-git4.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 68847a2385..27777e3430 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION_UPSTREAM = 3.1.1
+PYTHON_WEB2PY_VERSION_UPSTREAM = 3.3.3
 PYTHON_WEB2PY_VERSION = v$(PYTHON_WEB2PY_VERSION_UPSTREAM)
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
