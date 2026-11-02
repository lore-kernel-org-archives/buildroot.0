Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09450606A32F
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XQZuJlum;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fvy9gc1F
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 795D54068E;
	Mon,  2 Nov 2026 18:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twV6RlYd0AVh; Mon,  2 Nov 2026 18:14:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35EE740661
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793643245;
	b=g7nT+Cf/wXk0EiGa2gA8EDADmlIHbbTo2o607KPoY6lJ6ZLHZHAvDS6q7G/t7Qlhi7Bd
	 htvOrF1G0Qb4bjpdYcfq3Vt9BxxWhNK8zqitt+LMjkKWVavbvbpvYIAZ6uIEQEbJvbAsp
	 EztXQk7IKdT2gcW2eyN12v5umVjSBLRHXTc4076gbA5/Dom/OlcznyGsB8hwcKl+j/8z8
	 PaUu2xlH5Ej8EeBex2D7Q+EkkK3H7L/IKTq/O2aHB0FVuhSdd10HigQOgY5GUuJNqbWaV
	 BLjB1XnZV8j8LtAoIXuJcIQdAJmxP5TRoKQtcqL3ZfgQWpueQq2dD/h88DSDmLGrORQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793643245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jcBKtKPm1Xy/QIXU3m1dbgGifPM2y14rbxPGwF3Ps7s=;
	b=ZOFKXxJCKB6/5tKFzSjJEvvq6tyEGW2BF+H8yQDdrl6GtE3jovOdyURZJl06h1F3UYc2
	 4I6tuG2zdBQz4FnDlKTSCH1VcxydZoHHcAMW/MhcNdJJh1JpfhdYhvRV25dcyCaE7Bk3E
	 eTUdHiB7x/uMqcUIyEku0RNvQlZFk0OPtBaxytcdwbblHxuKI3/LZIx0n8HJXcqBkaHl+
	 +84Yj9jQSaB8wvz9kt9usOn24rq0R+H1njQJkguXWoUVwuklw2aHvmMaloLXSyWtrqVUV
	 hZneOOcPwyU8TquG71rOGaOqR5yEns4iW4dSUdBa/CPY/5Q3mPtjirU0D/q9A8Bmm2w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793643245;
	bh=jcBKtKPm1Xy/QIXU3m1dbgGifPM2y14rbxPGwF3Ps7s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XQZuJlumDLtfStMRc1wZFjdx2WVlXtweacSKb5dmB71IsXt9RWFvQLncfL2T476Gb
	 +C2vhk1nTpsIOgwbcTli+Ejm6A7H5l05OpFdsp7Ho5pJ5XHqzT7LepmfaPi2D/NERr
	 SYGQwWeMzdAN2afviKORbdelaqhsQ9N/lPKjjQ7DBRYbsiluZ5CXkVlbSTJSYOEORZ
	 UJa5atCA7GMkKEMvU2wCIAJvZMp4qFV/8p6g0YeusstgLkaHnSAUi++BauU5b3uJbt
	 42WiOLjFv3ehRc+2vhVobCS/dS2wFGt/F5PwC2fVTyS8OAROc88GdVH0u7qHGkAPYk
	 WlzALkFgWGfQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35EE740661;
	Mon,  2 Nov 2026 18:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8650E120
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C0816060B
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyTXYk1H1Iwm for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 18:13:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B5BF60601
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793643237;
 b=RWXqyH6LHnCQgFfIJ9ybrg4OLYG2mQhcBIZhqR1EBBYdkKgfOBMxDwSNzwmH5YJky3Yl
 wYAepHDdubt793WHevToiQmmmESoSZwranD8zZTtwnxjvlAdX4UWA7QzyuPD8zbx+2fcg
 pvSXoLSEXdaJmC8Dl1XvNumL2MuNmGOmNdw1QRGrPjSShDPGJROhDpNsUK0W/q/9h7D3O
 YLn/34qO8ZhsPdpuSdQDcQYSxr1ftqSAPktwrRosYW1p2rXepDuCngvgXlXEoDFKJb4GH
 8BBKhwrZFcuNjiGkkkbP7Fbhqfqv7EkYZJ1zwMUGnET+H8fhn3uL/BR/QsxJ98jOOUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793643237;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=pb8Jb4yXgGO1DbT231RWZHODjlVn7jinXZNA2TMCoEI=;
 b=DvDny46MoRByH+ZRasH52adYK9XdGXJH41o+DEIpT34y8SMTn0LlviBipJjdTMuGNy4J
 Wkp6BudC5c3L7xgFQLzNeazN9ddKrKPVtMbi8LeJwOXv3GmbGTRU6fndJpIyc/0zh6Z4S
 NfTTxwxEcMXYCTyxMoxauU+ba0vnqaEaOOZfkuoRCnchBIzlwNuFNLWEvOD1Xww0pljIE
 kyhFwczw1ijZKje406OuJUGpILwo7hBc1FIpciaweINvGd5cY/tOiG9lokfA+V8fPVs9t
 ot0jAswTeZJ1JkMxeo7fqMzS9c+MCLLshYTKSnL4B8ry+Fdv+34imPDQ7Mkvdjy3dSA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Fvy9gc1F; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Fvy9gc1F
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B5BF60601
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:57 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-5641f26ce05so1452640b6e.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 10:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793643236; x=1794248036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pb8Jb4yXgGO1DbT231RWZHODjlVn7jinXZNA2TMCoEI=;
 b=Fvy9gc1FkXGHsua1kSXEgIPAxAzkZEqRHMWSPTkecygXsTA0bYCK3jLcVv6SBNQPov
 vOnetUBbqM+TsSIIqXPlzOLgWaoH+sz0s60Kfm3RNFJWdDBoTJsSoA+YNnAZBsxxKqO0
 ZqvQWQbRXGMeJ7MAvMKcFPnk84rdlznFG5stAcrZOu/o3Fp7EWU39xzWylv3zBFgNRBW
 khVQr3ke50FKY4RhVSPiEV2lJEBnPuAL7F0I453cBqQDv4cM7oXeduVzQMERuk0s9LSu
 zqaMBY87gTIdI5q/wvaLlpsBQUotlWOuNVpiYxQr6rMFLZF8vFUYBDl4zf34vMi4xA0N
 6NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793643236; x=1794248036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pb8Jb4yXgGO1DbT231RWZHODjlVn7jinXZNA2TMCoEI=;
 b=MHsPH+EW31OwxxHphGr7+h9ZEOQI9Wueg/ada4qBth2rWeJaL1KGBbvkpZ0ocNh/Yc
 F//LKyK2dcwr+kGcZbl3F/kFw8vqOpT0DJhiPBJ1u+b1aZZfsF3EMYlgXrMGvmCFXkF1
 GjaSPhsmSDZ7kRDabKpfUlNJGQaixtRl+tiIm5d2lrg/0rrfWNImaXHKiy87I52s0FDs
 bboYAL+pstd2SfwbMRV6MLh7qp/RKPVL7HtSmUxOTdMH+7ciOT8T3HJW5wjwsu21tiD7
 WJfVWeRtNm5gPDCn2ezeGAo1mDicG7YklresRIghWrzr9/l765t5v3u6+SKreA44Gpzh
 uoqg==
X-Gm-Message-State: AFq9FYIitCRbKy21bl33Vl3jOC73tf1eXSytBL95GWhGv13onuFGTbLj
 4l3WKhd7ZZQo1kDiIIx3N6X2vpWl9VRtQISitS55iENzgBLFwHX80NvtTbJf8w==
X-Gm-Gg: AYBFou2SVoP7WLBjP8KOP5OuSkDo+op0XGmoGDeuXFIwat8t9w8jB+cw7m79zSsSN09
 FPNQuJ+HS1GZF5fhTPyBLAE+ooszUYHz7mP/lvS+2j2NsJvkjgO7w5E+fYdYlWoZE95ShVhDdm6
 DZ3C6spobeuga+UIBk9XkuZzrHVNUKsNkDON1MGtzEPnJme/AyiUgE2ucp2BGnIgINmf5Rr4fgJ
 OU5kFgk1ajUQ5jiotZjVjJUcJ6aP86BmDuXeZJc0KG8MzxjPAJ8Qh0Aoo9spH2iic4tfNZeOH1m
 lMQnlnFWW2VH2WSNUwxZOuVWWZAY66gtIsbDcm8m37i5pTVrLzS0rqQOrgAurNtq0s37MkIFXip
 tAnGOvr4nVFXzqmKmNHiUJd1GJA1/voVtfYhDw7a04l/jancBAm942KvJUWc9nmR0bxxm84DpVT
 35pgSWFWrlo4AZBl4xz25N85imJtWvSKtRjx/Q20L829Ay4rIlrF3+Anf5ZvWQOZkOjCB7LmycZ
 fCElW5M358MoeGybNapWiDn/eBqIHpVspp3ExN1GDDI0BFZ6o6FqWIWHXDK377FT3anCOb7aDgz
 5vW/PZemmbd27aCy44qccofxiXJuC8PIS7t7QB/kYKr/S3y85ojcV9a19drQP4Euoa5zfutXSYN
 OZmroLQx5G3DxHjx18KUfGdyVJIr+z8lEibBwGdHkxRf6G98U4POa+GXIPiCasYjqATsRj6tvly
 mdFi4G5XKRXUVjoAj3WEz1LwjHmeMxzvyl3kBoW2HJ5hZTYNl7Dlhn52WIzGv9D1KkdfrQkOv4q
 g==
X-Received: by 2002:a05:6808:11c7:b0:549:572c:fd42 with SMTP id
 5614622812f47-5640dfe6bf8mr7083708b6e.47.1793643236538; 
 Mon, 02 Nov 2026 10:13:56 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fd95562sm8445016b6e.4.2026.11.02.10.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 10:13:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:13:38 -0700
Message-ID: <20261102181345.3238554-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-zeroconf: bump to version 0.153.0
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
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index bb7b23c268..5c8c545c8b 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  0302be24e93b51a8f1908e9acb1c2a14  zeroconf-0.152.0.tar.gz
-sha256  8768de190d88124c4f69665c5547f6ae33366024db76007876bbff79cd2509ae  zeroconf-0.152.0.tar.gz
+md5  c0c51f9944cd79c016da81daf3e14ca7  zeroconf-0.153.0.tar.gz
+sha256  28bd0baa208f4ea481a386e9eefdd3a65663fada34233432301a0c221d741d1d  zeroconf-0.153.0.tar.gz
 # Locally computed sha256 checksums
 sha256  73b9e1d4dc992630bbc22b4519f437020446bc8e913d0ad81a3292a79275a251  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 625097cea7..5358810467 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.152.0
+PYTHON_ZEROCONF_VERSION = 0.153.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/15/d2/7fa1e89251245a7135f13a653ccf0c8db46ab4ce1877007285b9da7e8865
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/c2/ad/e321ee148e871fdb257e9fd5840748d06a72db132815ecb47d42d13b1a3a
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
