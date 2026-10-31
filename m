Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE36606A31D
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FJ419Poi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQSh7eOn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C2760766;
	Sat, 31 Oct 2026 17:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgNaWMdyaI6L; Sat, 31 Oct 2026 17:42:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2B8C6071E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793468579;
	b=P42G4j0hTKd+rMirSZbWP/uSGBHJupf8s69AWB8apVMxX9ypiXhKMYCM3Crt6tJp6YfC
	 NkHF/LUcWIAskwNTPLTyoq2eaHX5NM9YhwwyghScK6XeEYe49exnMW8tnorilcmUrciyr
	 3OgPd1Qfd8MPvWLlhdzS5DWOOp0bJWE3De+CofeBQhs9PZKS/4q41z0QCiOPQM5zK0ZVN
	 5vDlk8PGeiFMvKQayHSJncR7dy8neuJB3QucVY6hJo97sEV9o4d80YHIW6MDciYD6e3JW
	 R4491RDmZGo5kDGmd7DUVXdjiV3i5hZSA0c7hjdVzh/opdU8Ta6PfFLDsWOE9ZgtAcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793468579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NGLB7SOrsJmAiVfM1D+q2CIUkDgeahDn+v31PavYHO8=;
	b=XARW8mARIk0l5njYkneTKUhtGYAKBv0oGAKIFWw4L9+BCKvfotw86QhXubzXka7/3/iV
	 NbnpWmKjCVoZCjiBBEWeEydgeJ+C1hM8xZTJilYWawu0BNUupKajVwsa1QauMcTzzFw6S
	 ozPl9oMljM4CX2oZDJOgOPfMunM4TMTItU+W3wljmDBh++y6QHQv+EyuuTviZ2hbAL2jF
	 YbjOfj2eq68kuPJEuMwrFpS4egbjvOsoNOx/QTg4wua72tm/8U+O1l6q5NmaRqDdc8zBI
	 hL7oorr6X3dkvM5vf7WzYYPkM3IZiinHNswM45hI4URTVW0KDp36+blfgTsPRbTGZyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793468578;
	bh=NGLB7SOrsJmAiVfM1D+q2CIUkDgeahDn+v31PavYHO8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FJ419Poi/dSS9Q39RiaVCLRNi8wQL+wEsLAnPDDwu+z/BDh6k7qHRymPmvH8drpPl
	 Bc+tkM+BtIiUvDY3/R7K8uYP54qDcWWJaVkFTsOuPEn9UkinzA0Ch383I57jnNm+YK
	 jrM70UcQaGpaem6+XExuzxI7jwSqVyF4S+h4tSTS5qTGwvPSSq9aeQBboV7XLdzI5F
	 bojYYPKkQ5KAZMqQmNvEBo+BZoYGF3yAK5gu47QARwr62Lq5C+qDTt0Cmy+CW/mPEj
	 B86tt2JPLDC4mcFPd3C1lcGJjZ41QB60g8b+CneLGcDeaUoIBiAOO7B3VjznhklURK
	 aJBCIxaXKCz8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2B8C6071E;
	Sat, 31 Oct 2026 17:42:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B18541DE
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97F1A40676
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7NnsLIXR6rx for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:42:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CB8540652
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793468574;
 b=Nwsf+oYTWmjrnbysq0d7aBAfLodqffPvejNNYTdV2bE4e90OQ3hpgcaRB9nbw+82QO6I
 /srq42F3U7eFMDWeT/1lgeMzIihHrEvm9hxGrGBQZB4ruroVM+G9kg9JSx37Te2vZ5BNN
 BAlqyfd7AaudKPKZOljEXFiAQR3qAM/5a8Q3K5PYVrneQygNNG7EFhNTs6ejwDbIpZDIe
 nvDmS8YPOoMUnRnRxKhEKbWWwPcOgYIqnSz2S2OOry2PC4JRtWrRF15rsIJT8ve6Z0pXK
 Pl3ymoMjKDAr2Z8aCGL2x2opEPF9lc46xPUMGrxaiCZ1Euf7qcGDpwmcNzAfq/8oVEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793468574;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=8MsIivWtZQ/Hlq/iok9Ts9kXNL31W/mZwrutyPd9OhM=;
 b=cI7mKXzx21xycfmyL5ZF1q4RWitC25zb68JPEh+0KlzZuv7pgYJHVZHhB68ghth0Sh23
 I0E+lbteLpgm+h+bANcpT8M4S0Ql4Td8QhCr5xM4nqe13uaH6zQWNk05ryrEYp2rOXqIy
 psz8cg8nNt9KTr2WsxqPfCcW5srFCeCc9iWzB1BsYYPoqxxjJB9TdPGPJ3rJIFPK/Nlxv
 y7WDdavwoW5lsadcG88lyHfJ4e80woBaS5fkuuBbl+RMpSuVzZwNQdq3zUWcjz2pWsNIk
 5KCGanBJxF/MZ82gOjLOv3sAGr8SNr6ZKYbrFEUlmI/dup9+woNJbUCJQe1JguTn3lg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=vQSh7eOn; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=vQSh7eOn
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CB8540652
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:54 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-82109f51565so788786a34.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793468573; x=1794073373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8MsIivWtZQ/Hlq/iok9Ts9kXNL31W/mZwrutyPd9OhM=;
 b=vQSh7eOndF0EUoOLsuenCgo09WUXnXbg7bawS24FeqICj7C28xPnUFS5oQbWAL0rSw
 AbzCopQWj1z+zRwSCrX6xguzBnwQQzc5V2YZ6SIDouttiWSz6EgetEQURE4VeUXyqUld
 YLKLIwKKxQsyhYi601Agic2hg3R+GznloKOyMB7EUI1+4EePOucqkB5BemgBzqDLxFqh
 HzEFiNHn+5Y1s62o7mbpPRSkMpnkbcYyxIlCnNLSw3jhVp/K6p4CQty/nJW4Aal2U/RU
 YQ8BxG6hinr5Ggi1MYqI/cLGxEV2IRhzKE3wP9uCrGCtAz1sc2BQszv/Zb9sCE7Cffqk
 jDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793468573; x=1794073373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8MsIivWtZQ/Hlq/iok9Ts9kXNL31W/mZwrutyPd9OhM=;
 b=BUXAygk5b7zmuGRa0cyLIPLHmRY6ER2oJJW3+9/+F3JgZ+3QjogzsZk7r2iDZ3E4Kr
 LTvM8R8mp/p99me2Zr8NBE7UqV2ERkoLw58535Shnn8TxlzqEXAYVfCEJmt3Bn2ca00X
 THypGK25rHETXaZB5m0Z3z9fKaeitoGL5qZ8NcV0ZwcxmyN4D7wijfAtfk5TTK+DNThg
 WADHqWA9L9k5bTZe3fEFPw/qqLLXquVP2m0XChcKlupy5V6X1zjbRWyPwklCu5MT8bl7
 k6rUJTteyPfwQ8yLwgJJawELTPVQvdjTYkXwHL4pMEWTKwzg9woduOAmZ0Lz4GStwoZB
 4HvA==
X-Gm-Message-State: AFq9FYLlRrfmt7Ymvtmex/yBXRug8eGDn/AAlw8Ziws5bbCVSeJeGXqn
 QIGkBNRO+c+Qid7VCyGHdcu1wcqAKMzpZWQSbxP8m4lH0SYDgNLY65FPVkhaEQ==
X-Gm-Gg: AYBFou3R0e2f//wKoDr0YtL99s2oclsdqpK6vwO5SPtu3h21ziOLyNGgiGUtGfEBs+h
 MDr+KpclXF7J0LXi4hszl7EZ0JZ2+V4qYdMcHLIyJ+yZPk+NxFc4mmi9wnywafSxR8K7Et+kric
 j5Qw6myOpFIFzpUcw2vicnp8oDPKuza0ZYQZnxrjJ8hCFN+X/ZcSDkdgv69D3FY/xz9NlN7r+A5
 9CfPQmXoR3UWzJvsYT7FKy80/KaQPxtULgUCnKZd2X44pagG/it+Tx+PrwiGnBszPeGHlDnVM0H
 d9ZAeet4vSlQCVxKneAMAUro5ovKJO49FB5Vk4fZWGY8nyLS52KC4+N6AxKSGJ5Z7AbACv2veyf
 rG4wGRilhlX9IcLt3Phf+5p4mto7CMDYZG5Fgfxfy5ZRWoG1gNf0Biqj6VAFA8VIpAHQo/bYzOx
 lFBjgjuG7vFNT5sTJwrXBJ4+kar7FXH9NF12xS5f93RtKaBZLTa32xG3KZ7dNE++sQ4aVSu7BBJ
 6mhlWAVAla/KPiSrqSZZ+F2bcdqnfVLc+fNQcdkuihvcOurqwWCaIZcE0I1S4r3hPMz8j+Ent70
 RsahxpRFB48phqCu2+j+8qwCwFizbul81dEg6ZqqJ1QdFoLtG6gTma8PNcZGxMiYwQfQ97iAI2x
 kXQAyqlXZC9KH+Vp++z70+5m+Z8B2EX32yti+pGimgfY0t2m8ooVjcmEgug0Na17uqD7OSqu3l1
 PHkT7f+5pCCexfG1BsZb948w5qOynHr7ZUeXFwCnEQFfuC0kM6dIIQ3hbehMSh8Ai4U5AlnTDRk
 A==
X-Received: by 2002:a05:6830:6815:b0:845:156f:58bd with SMTP id
 46e09a7af769-85d3651b439mr5010928a34.14.1793468573351; 
 Sat, 31 Oct 2026 10:42:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm5008126a34.12.2026.10.31.10.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:42:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:42:45 -0600
Message-ID: <20261031174249.2698980-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-oauthlib: security bump to
 version 4.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
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

Fixes CVE-2026-49272: missing device code validation could allow a
client to obtain a bearer token with an invalid device code.

https://github.com/oauthlib/oauthlib/security/advisories/GHSA-3jp2-3mrg-2vxc

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 5540760118..e001a8baa7 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  f1eb96f8a4257d715ec8af21a217a0c8  oauthlib-4.0.0.tar.gz
-sha256  efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86  oauthlib-4.0.0.tar.gz
+md5  52700d6336f3766bd05d98b3696bec88  oauthlib-4.0.1.tar.gz
+sha256  3d73febdb6faa00f277c81fb04be7b7586fb96fc3b7f0b9c772dada69a25ede7  oauthlib-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index d001fcd071..7a2e66c22e 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 4.0.0
+PYTHON_OAUTHLIB_VERSION = 4.0.1
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/33/17/2bb072de0b990303c985f26869fd47bb179024a051f47e7f9d208eb92f8e
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
