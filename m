Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9728BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 619914104B;
	Sat,  3 Oct 2026 08:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeqUckJM7e5n; Sat,  3 Oct 2026 08:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7C4A04104F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017151;
	b=i3qnrloxs9pqzOtq2t/wZvhsGWSJXym1VLLcovf/K3LE1wnJxPHMISUZ7gJgbf72Xzy+
	 1nvne5p1FSXoBbxJJNmpG4ZrFuzRxJxrvv2DM2IdcfOU9yCoBYy7K5T5XexHuD6pWSoDL
	 R0PFWTwvMIuMTUqCka/uiNsd0gu1jZY1K/SMGd5h5iocfcW89QVzyRaZRgJWl8nGod++J
	 8g1VtG4sOM0HCyhgokSqSlUyjA44HftUKmNvZoNmQX20tmCHOQTcBebJZ4hNxqsG+ylpB
	 yWYaBWY50kBhXzg0s0/vLmauq4l5IN7gBTI0s+WfAKXfDvRX5S0gigclaJ3S8ETqgLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wtOFP5i8KnX73AvHl+aJv5BwEoJx+Up4EPRNldpaHms=;
	b=cg0KgPfLFzEuLagGf2/BiYvgGbwo68DnIdymZBV6e8yRjrOTEO19Gz0VICvuhx9m0pDn
	 Vc6TMZB4u+ubO0e+r2QuUzE+YGiIMxF/VbhckvYL5Fp1u0wo5imIAZ5bAdtFHnonWDr82
	 if6hA1wm+dip6GVyu29lDYhoHvz6b9in6O684GdUCZpquWE78ptiUz9FUT0zrW3PiHqjz
	 WsVyN0o6NM7qbE7hWCZon7dL5Q3rJ6s9+gOM/qJt8WesOtIQA5npO+ur4OrSkKyhpBdUU
	 Iz7HWMq85n7vJOkxQbgaF2IsR8EN9ZiJwn1AlolugT1ICvEvUfsn28zDZhkeCv/M//g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017151;
	bh=wtOFP5i8KnX73AvHl+aJv5BwEoJx+Up4EPRNldpaHms=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=A/xS/DLUTzosdFKINA2GynXPeG3NGEgJQKqtoZMkolD03hTh8ukU4auhpReZMe719
	 bQTWj4hlATBCd0mEN9ajBnrrj8qfCy+6qW+POfgpAb3wyqt+aC5MVF5sCOseoBL6b+
	 hzVD+0qtROO1I72g5If3wOvvvtklwDtBGmxDTCt2z3wIxi98oxyiy7Ujr5dJMlaPDI
	 SEeFIHJsVg78G1TLgoWw+D+YY2Q0LIG/9Ny47XKno5ASuW1lKIou+jriANY90NZKy+
	 S1Jk5O00Mx281i9H4QUMLN8UfxOJ2jckCTDSFke4fbp+0MEFcx37VgvEGSi7k8c7hp
	 Ijq45FP/mSvCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C4A04104F;
	Sat,  3 Oct 2026 08:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EED62E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3046160E33
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScekHQVErfdq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 407C960E1C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017148;
 b=FqNEzawfWJftTHIkl8UJs7U4mfODsO+K7eNb7k++ioJNiVgb8sIE0sb0oETG9FsAckMk
 WeRDYOP7oiKXZGA3F8nRnbS2y7vwZW1C15m2s4YRqcUurOI8Td0M+A/+bMud2551c9bzA
 HsqA3tBzxiqIyplFZd242+gS8/lidE1d1XK/jsTtux7Ne9pY98+eDaM3It80xXOgow5UX
 ychNkG4qDb0TJN/xNT5PzQ+OSb0JuRK/d4yJTb4tjPiDgMI3k94GIJsvt8cJT3gZaUbdy
 60Q44JqmAiKanVERUmlgKAAmajVXJfweft9cW32FZx2Zr1BqrMte7F8WphL9m6gHo5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017148;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Dtmk44SCyVBJinlGU9L8LQ7B6ZL81UY8umj6Xf7u9ro=;
 b=SuxUW+/lp7oWki6pIE3fDKg3hTLUP+6GoCrO9NehJ7GDiiWzmPMLOTpQ8RotSaadEY9S
 j10SrPDbPUhcvHNveO2ZwXS6B+DMmb7POkbdFyhNvC956O6WzmBTKMCEin/6ZgoTL9QbS
 FlaPquL4lLnUvRLIlLSdOj5N0Q63t+bobAnSeOvRuTqLOfoGzSCUr3ykDUl1EHFLqZ969
 qetiIXQzCp51XMb6xgfIMA2Kw0DmmnmJvOS9QFV5lKTgp9XZlYyNQatd7pNsGzmGU8FAP
 PwfIEtKcdQpXaD+tRW8Sck8OpSUlkg8G8j9j0lehAXgeVWriB3kh/6+gpesrsYZQjLQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EJVeDFWt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EJVeDFWt
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 407C960E1C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:45 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-823b938464fso513111a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017145; x=1791621945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Dtmk44SCyVBJinlGU9L8LQ7B6ZL81UY8umj6Xf7u9ro=;
 b=EJVeDFWttgS0Pi4qo8r0gZEj+775YjAdW1KTaQXrcUUIcDWcpui3cVqT3eeDqKCrYt
 UHfN58cMz5OmM8y41ZkoYuxwLLp67xi57xjBbaGpA7EezR04awaBo8xF3xLoPLvl/16g
 n57rGzvCouXaoqXuAG6QobaJ1y2ZNMnnyS2nuaTSKjqczw0LiS+QqRY7j8VGDO31E0VW
 t4EzKFWldMAJ20O9a5ElJv2SnkKKWLTRCWoDox5TrVdVdexNvMyk341PLC9Ij8Xglf3W
 WSsT7JjHq36E6hSUz5/KjPYteklr5brN8AHDQN09H500oBrlSFJpZ25qVqbpnkeIlwJ4
 aRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017145; x=1791621945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Dtmk44SCyVBJinlGU9L8LQ7B6ZL81UY8umj6Xf7u9ro=;
 b=wxEoxxfQ/nHZxnPRsIWEBLu8yC55DQglDSeqcupAU6aTmjLBGZvG7QFYrDuTT03Xao
 pNLupU3YtbV0IhyuTu7SQEB+asUciPv0ZTCjAV3r3yhg3tOYJ4YsQWq8Jl1PCl+OgpXr
 x0wxUt5Zyn4i+J3p8aqYaraB+S32z1XQ4M+WcmBLg6pBXLtxuAJs9n+Od+Ky4DgqX708
 BOLYCimquhIF4nFpzWtigu0DT2EtPbGoRWZd0WyiB2tUJ25EOSf08Zknv97oCFKi6j0p
 dwtouMWQD2I8biw1o7krn3BTzKVGlvFsZmxbCRYVwhHCCYICWQzeY2PNsbSOAqSNITTi
 kVFw==
X-Gm-Message-State: AFuF++lNBBj+Wo7bmNpwP3waIGYaD2fCU09XNi54TzC6aqMi6KEtVeW7
 sCmRPjd/+CYMUQnD9MfvYE7FemhKUFn+HHaGXzOb047JLT/Het9vkZRIS0R9Rg==
X-Gm-Gg: AYBFou2xYvILoEznoREAvlZzc2AiO/cGU7EVvZ3n1nqSOxwz0YnfEjNtTGVb6jNG5sM
 cRKCLKOCqP1nZ/Mw1Z3a0nNJlbbJ1StiE3W52PfaTwFUwcXASbR9CEjE9AUucOf0KvGPdCGwUa+
 fQYjbcgmtRji/wTtAk7lNlnEDeL134nWAqyv8oIU7iDxSozc2hrQNxqJRVeylS9/LNUcm3QTGEv
 Ohc3hxQHYAdW3+grjGKNpj1rvwztcFdjJ5+TLIKHsP/eCj9wE9q+Iby949v5JK9Er3Syvn+wN36
 jKeEs8nlkJtEc6n675xJenSf0bg1wsmcq35D24vMKRFOiWmtDqvcyoizbkJKNLdtTeXYJh6GewX
 bX6MzmkbZkGASfbziDNRI+EPMr5a2+tmMMrM0MKkEUwvnfid6X7ZmIgX+3luTVtyFq3TOS4KyDv
 znjShUi4QJvkO9A90iUHdrxVR5VXYR0zcDz1Njc/myNuZPnbDeoiY+90aPtdQRUo6OJvInC27ou
 0A7CaOCcwK56dpvQe59TxqNGaPNmMOJWGRp5Wr3YXfzq9asmIXly9eQsGbX1/L/W4y638RoucEa
 62WaQNodR/ts/UZVioXrFWhClOg4XTWOI3zo2S4VYtzcJtD4P91hs23WGejvPFgvwmbeBHDXWgE
 rSW9hKPjVqQ4f2mKESUow/wrK+vFb9qv/XcmW60lLpE4=
X-Received: by 2002:a05:6830:2105:b0:812:4cc7:4afe with SMTP id
 46e09a7af769-823fd109ad4mr2146069a34.17.1791017143838; 
 Sat, 03 Oct 2026 01:45:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:10 -0600
Message-ID: <20261003084453.545653-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyproj: bump to version 3.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyproj/python-pyproj.hash | 4 ++--
 package/python-pyproj/python-pyproj.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproj/python-pyproj.hash b/package/python-pyproj/python-pyproj.hash
index e42c371469..541812b424 100644
--- a/package/python-pyproj/python-pyproj.hash
+++ b/package/python-pyproj/python-pyproj.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproj/json
-md5  1c0501d6055ff26565dae8fe2e6083c5  pyproj-3.7.2.tar.gz
-sha256  39a0cf1ecc7e282d1d30f36594ebd55c9fae1fda8a2622cee5d100430628f88c  pyproj-3.7.2.tar.gz
+md5  bf9101fa60868513cfc0bf6bb9906f28  pyproj-3.8.0.tar.gz
+sha256  efa59725bba68bf97fa808b61302df32934acdceb6a5c92a8dd0e71dc266a876  pyproj-3.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a652687151814d4c4715445912fcb49e7e58f5b248d47a1a88b859a8815e0822  LICENSE
diff --git a/package/python-pyproj/python-pyproj.mk b/package/python-pyproj/python-pyproj.mk
index ccb5c659d0..e91aedd617 100644
--- a/package/python-pyproj/python-pyproj.mk
+++ b/package/python-pyproj/python-pyproj.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJ_VERSION = 3.7.2
+PYTHON_PYPROJ_VERSION = 3.8.0
 PYTHON_PYPROJ_SOURCE = pyproj-$(PYTHON_PYPROJ_VERSION).tar.gz
-PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/04/90/67bd7260b4ea9b8b20b4f58afef6c223ecb3abf368eb4ec5bc2cdef81b49
+PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/c8/29/6598570c90cbfc84ddefc3ccac4aa412bf51a527d72c74cc4fe64a5e6f24
 PYTHON_PYPROJ_SETUP_TYPE = setuptools
 PYTHON_PYPROJ_LICENSE = MIT
 PYTHON_PYPROJ_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
