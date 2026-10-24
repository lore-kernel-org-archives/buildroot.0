Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA3606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f3XsMH7X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pFscQXxY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3784E407A3;
	Sat, 24 Oct 2026 18:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBcoOzPkNdKS; Sat, 24 Oct 2026 18:29:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 275F4407C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866565;
	b=aRRAOwjSvavlG0hCiSdqrP7aijpbkEm0GY/8d9ukGVA3ch+O94wu5mmyzatMxLVSpRz7
	 d1LgT2GyIzbeRlB/JoL5+dyig7lAuOJXO5i3mLX+nbhnIB2W2mkBtV/TZZZB7L3tR9Xwk
	 p9xzi1B9DqOYX3lhHAr2RRauzUDjZENEWgoOb3goM8sxKVX+kDnz4XvuHlcM66c4dH/Ia
	 h19IhtRzPLYw6ZnX2uBywO0NHKkxwQU5Syc+0BMp6IXjMTlmCSgn9MtAL8ylH9tHTBv7h
	 0Pbtt1Ps1Aaz+CKKf4e5xLcTjea2vNeKmB/whTC82tD1L7reNFrHHwF7Dy/YmQ869dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AUC+BMHC7V3k0AARefAaSL0uyiBeExZRTFTPGh2xHtU=;
	b=HkqGrhr0Yuo/C2BVst235tQw51A/BxsiWybRD0UPJbMseNIWwyaSTghVGCA4zBMxFXzt
	 4nST9Q5Tcyxa7XnbXizKhTZu4jXKlIQiW0Gr55EuES8faSrkobA8dXmmPSHs5TcVLbo6n
	 rIpmITmOL5wScFpRMkm4UN1QE9VHebUbOPc5c2go52D7vxTybvq4U66EkGFlyT3wJ5ZI6
	 zmwGWirpnC4bIQj6D6oIDZ0VwgMMm9Imv04ny9ucPnJKrr/96K+uP1vV9TTqOeL/Rmscz
	 4AeB8GbSQFzsPFtdYeYK23nK74GYrRhC+Cu1GeIIYJMLOVwcVufjbWzB8ZUxBoD2uHg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866565;
	bh=AUC+BMHC7V3k0AARefAaSL0uyiBeExZRTFTPGh2xHtU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=f3XsMH7Xv1CoQGcaMZWS8QiY+fZyuO3jvb69lVQEEivA+AK579eosxa1XtZHsp9RL
	 gcANDAOdfzhERq060J/5JXbxuEW0f4MsIDPvZRdu78yb8xzVBiaqsb3YwTSsYtyg1Y
	 BmbyiVhwrfTaRGGBCDXh6MKrh4182C6eB4Q17DTcSjITRuEbA2lPfCDiFVMLDJVASb
	 EeTcYzi5IaKdoL2HEvxAVdVafQ9GMewu6HY0nb6MeY7UuDLYU+slhlMyuuBNF2H17a
	 y5OBcdo1Rpip3qaJ6G7WHoIZURvXGeAPpefPuoDDEfu1nxaJ4tTwqhQMMV0yNqK+NH
	 wDdImd8uLcqeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275F4407C3;
	Sat, 24 Oct 2026 18:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF6D765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB984009F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDzS_cjXt2Gz for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B0FD640049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866559;
 b=kWol1IrU7tYbz2UX4KVPhAfSadw75trEBHiBkxwHwLr3Xt/Wpp3YBCiw/9awfo5kARel
 d8OlPMidxfKrvjzT4lQXCfGuqABxvvRvj7chmb+CZ0K0OASE6MQ95d36RRhovpFrmcAzx
 QG/NLLakaxSyv/w2bPonDaMUVObzm+o3EToTBghWhbvDqA21/I3R4CdTd53FdbneOePkT
 cje3aUcT+fQJbz77vXzpmjvHYpgwZxDzZX2a2ic8TkjVxN8rFmbhgZ3vl6xLexPhoH40E
 LHOZI7JCxtvRsVJ1qAneMUOsHcBCQCYhULPaciMFBPOBRE0RklSzbyuwX7z/uKzHgkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866559;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Pj/nPvXLkGf8oE+JKLVI2nqyJgueSpRV6qb8Bbr4sT0=;
 b=Aa0t/F32vAwVfeTxEACGI4SM4+rHP6Gm9jYULYUrDOw5EFyWXkBcX09OSt4rJXiQPWmy
 ckBBNc+D/T3KwEJjMvnVOSUr4H3dU+FeTgeG+tP7+l+EN49nz54GCbAB4C1a0u74nKeFS
 TxGTkRuVF0+7/pyIuQ+ukjYFGBs7NUjLZyxXefZy1CKA5gnbSnM40cUQh0FUN+BBEZsXo
 fPHE9nYgJoY0XOfUz+aeF049JdGvvtWQvoaMXM4n7lbxiHYcAoTOcfCcKBUIT4115Asuu
 wX3PN1oimIBo2OfsxwH9qN73afwbm8tfeqkztxsJpIIeSOWbXqORwKxt4ypqo0lFWZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pFscQXxY; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pFscQXxY
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0FD640049
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:19 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6faddda49e7so1604216eaf.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866558; x=1793471358; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pj/nPvXLkGf8oE+JKLVI2nqyJgueSpRV6qb8Bbr4sT0=;
 b=pFscQXxY+/QoWzvr/l4vCfGCodDr9I53c5aYUrUIp82uHiZFKu0jVP98GNozrFGLKf
 dEg1KG4iSws/5I6miDDri3DAxjRJ7sf0uOah2+lKOYnAWzWLsqY7JCyH9p55ujtVskKV
 DdJqoq9BzHp/+gJVdqInHnEVR/bf5sUqlcmlugmSZDycQK4zwkAvwW6jDYMd/PsZSUtZ
 dAmKzF1BJTvwaP5P+hwZHzIA0TeNjpH5PlsJut4iryDaGQk9CTD9XjeC1YexgWIB1heu
 nyYV9gDW8mWQLiwevz2WHJlbqLzpwQyrrISCJEk5bfnYXmYWLzWCxxNaZHj8t6hRvZ4L
 0Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866558; x=1793471358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pj/nPvXLkGf8oE+JKLVI2nqyJgueSpRV6qb8Bbr4sT0=;
 b=EZzBI+uTu6tLSha3lKh+DxFwlNHZp2N9wDPKSh9u9yy1vwOs8K9n0AKZrGgWu1E3wW
 deeAdP5i9mv2xZVbgiTYoccQGD0rQF5nsf1F5K0KVqvEn2+d/pxsyHVwLv/09ufZHvQn
 Mu8tlxqyif4yLIiDyFVubA0EuiV4GHGpNVJpt/E1hIGjLeF8uWKtILVe/xcgcvovUwy5
 5Gc9DueJO4jghtEpberSPDyI8M1A9OJPD6ecbkRkZs3mMinF1xw9CALcGZETd/yt+YLg
 1AZ15F7j1hvbvl1Z+pgHy1e0hw6CDzCe5qIuzQ+Tkp3eGjaBdP20KHxAFciMwOyiIoCl
 J5bg==
X-Gm-Message-State: AFq9FYINFf28ObYFvSbAGc4fRGYDuqt6so7ylJ6Z0DrFl+0d1an+9vB3
 2HTRKg/1GwdfCnlKsKTfDMPnCE/Clq29MFNYpFhdjAdi6UZv4S5R8t7nGT0jq0Q2
X-Gm-Gg: AYBFou1/8mJGkgSPYWDb4kWezyikJ1gmFpsjdYieCzyyAkvSuYekb5jmpiM4vGugvbP
 CFQGjVBBP1sFpgj+XQaKMEkPAh53Ro0s0W4HyyyCwkoHyhK8WTd5EPibhtZdUPWsvHxGc/J44kU
 ZjBiBp1JOSJXhQiAYHSmoX87xFa7rlx4q6qVdJSwh9dz9i4GYe0yo0fPrE92O+Bg+luvI4r7/r/
 wLB8LbPI+g0jpQHV8uI+ADlpBT2zTYhyXGvEJ/veLVzX2zdY9mBnxCpewzrJrMumjf2vNrIsGHn
 ar5bQeXmAXFtUVcdG+O2jm0AA8nF0AKl3CU7U+7fdIs7070EsF+lLVKPKfv4Ofe4zoVzxlDimpI
 eicdC1Iz6gCksMG4RWjbfoBCR9CatBmnb7w/AxZ+varQJ1fTaMOq0VMZ38d/KG42fRd1bSrfR7r
 gXzLTDnLrzEmVxUz26fJOvkBVFBX+MMkglvY0x3aPyez6qjhzigT1nKnQ6uVo4+1ybE64Ayp2B4
 6NoBK9rbO6IqXz7xx91aSdutSgfDGqeQOfg7vxNKd7B1XnERhMBCTA1JjHL7ZzALYUUhUujWWf6
 aG3hNuDjprKav/LUjMlMnSMmSDHYRqCVyG+CJEz4ahX/5l50N7NxCfOgyEB4AZtZon7JGmrfz2r
 AgIV1FEda0+vzAWDdbNPA7obfyojcF76jGyLfuWVB3fd9Zb7QWYN1Hfx+BO/8CMK36/m++l69Mb
 OGScokRuOZ47VIcMdB1H293PyS
X-Received: by 2002:a05:6820:8599:20b0:6da:4b62:b6b2 with SMTP id
 006d021491bc7-70ba0e90689mr845524eaf.40.1792866558283; 
 Sat, 24 Oct 2026 11:29:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:28:58 -0600
Message-ID: <20261024182913.1957467-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-inflect: bump to version 7.6.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the coherent.licensed build dependency and the jaraco.functools
runtime dependency.

Update the license hash: upstream replaced its checked-in license with
an SPDX identifier [1] and generates the MIT license text with
coherent.licensed [2].

[1] https://github.com/jaraco/inflect/commit/8eb81cec315179539a0d9edfea634e1cae726e68
[2] https://github.com/jaraco/inflect/commit/4b10e63076aa60d774e16ab96c8ab816748c93ef

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-inflect/Config.in           | 1 +
 package/python-inflect/python-inflect.hash | 6 +++---
 package/python-inflect/python-inflect.mk   | 8 +++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-inflect/Config.in b/package/python-inflect/Config.in
index c2773aae45..ebd3f8666d 100644
--- a/package/python-inflect/Config.in
+++ b/package/python-inflect/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_INFLECT
 	bool "python-inflect"
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_TYPEGUARD # runtime
 	help
diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
index 1538bfa178..dac0f25440 100644
--- a/package/python-inflect/python-inflect.hash
+++ b/package/python-inflect/python-inflect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/inflect/json
-md5  2b4c0c942b110c587d8cc1acfb606882  inflect-7.5.0.tar.gz
-sha256  faf19801c3742ed5a05a8ce388e0d8fe1a07f8d095c82201eb904f5d27ad571f  inflect-7.5.0.tar.gz
+md5  e56412feca1a5142cc033bc8fe3e5c0e  inflect-7.6.0.tar.gz
+sha256  b46875b50534a7cd5fcfb5a7c971bb93fe68948c43ca53e9833bd1e1a69221bd  inflect-7.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
index 21e87aea35..e8ccbd8833 100644
--- a/package/python-inflect/python-inflect.mk
+++ b/package/python-inflect/python-inflect.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_INFLECT_VERSION = 7.5.0
+PYTHON_INFLECT_VERSION = 7.6.0
 PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
-PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/78/c6/943357d44a21fd995723d07ccaddd78023eace03c1846049a2645d4324a3
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/9b/4e/2836918b501ac34bf42c14dabc039ed83ce8a81bb5711e3ee4f526deedce
 PYTHON_INFLECT_SETUP_TYPE = setuptools
 PYTHON_INFLECT_LICENSE = MIT
 PYTHON_INFLECT_LICENSE_FILES = LICENSE
-PYTHON_INFLECT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_INFLECT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
