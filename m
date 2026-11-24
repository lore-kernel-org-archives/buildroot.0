Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D39606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iApIfoi2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=funkworks-be.20260707.gappssmtp.com header.i=@funkworks-be.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cx436Cro
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B005F605E5;
	Tue, 24 Nov 2026 10:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVr-5k1w0GPX; Tue, 24 Nov 2026 10:36:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7C68D607C7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795516588;
	b=h4M+XaakaQdCWDWTpvlgty5f/t8DxtdwD39M8nI6lm4ITaCYyYCvd+VJcVHslEMDghp5
	 F5l3uUoxwvdRp7NAseU1VTLL+bYOiWLxjW4IYTmYexr2hRmN9BAX1AWApBWqaOv2zd5Vk
	 h+IhXM/vSVFLDFx6w7HNFrdZmKA+KHS29FlJUKadNUhukvMAMuc8Kz2hjFMygqiCg0KD2
	 vTv5OznFrdCsA91r4S19xuzD7jTzMCE5pfGwhfZK5ZDTQMGcTYgNwkKu96+OndQL49RYp
	 2wcaFtz0/aXgMNweRKxU7mQe55TdIjXIqAwCzx51MyGRQWqG447PG5Fwd1cVji+uGag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795516588;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=j7Ms/RnsYNXuKnHbFBopvCXYuEvPePPIrJXlOJ8RTs0=;
	b=XXh4qJSVe5GegIHH2xCpyrCU42asgyDmITWr9eRW7KK4diOsNVpseDUkHtlFWS1SPyTt
	 kUA5O9am+rsITkkf/Q8MUZby/Wdk/oSHPWHh7YKN+/aelydMktUyXSlfkzc4QJ92OpEOp
	 bmDSxcLGQsJFDGsmSRVlOTTGUtuEM8nVv9/g96jeUr+w9uiDgbziXkWkmeeFbwP7rigpX
	 hAhbvnVu4iFWV4CkHWZtEH/dsiikV+uxW27VFr8+9Ewh2lKfytPIj3j8G5dy7H8bdQ9Sv
	 1cQ4iKxu4PE5ky7NNJm5THGLQq39+s2FSeCFEWSqihKauD0c5BJtoBfjnVVLBPDygMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795516588;
	bh=j7Ms/RnsYNXuKnHbFBopvCXYuEvPePPIrJXlOJ8RTs0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iApIfoi2WtHPrpGge8prtSBd6nJMjRIFMsgd3WXwzer3aL8M/ob0HYqw3AnqSGTx9
	 xRBI9OtVLs+jZEPeXoraY9CyUVRk8uR+yN/BGYxs+DDy+fZuckUTR5doyUEMMRckez
	 q1hzY1FFpWZfe/LVWBJcQ8PU3ZoyXLAlfeBH06CppKTBpeDkTiDhHRNrbLrfkVJBXk
	 TDmaJFq85uP7FpZwl5uTq/o2AyT21XFtIqpuWo/tJbL8cWnWcIhP9a1gsld95jlxjs
	 ufz0ywwsEWO+xDg+uzxNHWhQedkAexYqAYlZd5oZIC/r6ARdhe/jtLa7HdB98qjP0N
	 Bdx22J50bPegQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C68D607C7;
	Tue, 24 Nov 2026 10:36:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF787D43
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3D9080F7C
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIbJiDZ3MgMO for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 10:36:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B8ED80F59
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=fvb@funkworks.be; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=funkworks.be
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=funkworks-be.20260707.gappssmtp.com
 header.i=@funkworks-be.20260707.gappssmtp.com header.a=rsa-sha256
 header.s=20260707 header.b=cx436Cro
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B8ED80F59
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:36:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c5188e4980fso227218466b.2
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=funkworks-be.20260707.gappssmtp.com; s=20260707; t=1795516583; x=1796121383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mbBUMk3StF9L/z4m4Qwf6ygNzEhv4nNUDNjRQnHI5Q4=;
 b=cx436Cro1XYhHQgy8ZIjbZeFQbVU3jjMz747QpYOmlFxOe93FTkSo9SE6LbTi339SW
 ke6txWN2SNi6j85Rsoz1tsyJYqy6hfLnSjWE/L3HobqO7U+Zw3VHELdocyOFWvTNYgnM
 EQCKS10CnP7CPoUWcJMWwKP/wPfTAmolTY0kW8SsJ0XODi0HVDdC3XSV8g2MKStq5zuF
 as/n9kWbWeCVwF5WsW8oej3EjrXUr6lgQPOAmEAG4CMp712yZHcu1ueQqi9kPLVIYQ0F
 zTktdvJuZoo89LPm3RRCJDSuY/p8WJpjZG6BIfK3CjOPsQPzWzv+XskymjXAKfzL1ifo
 LSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795516583; x=1796121383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mbBUMk3StF9L/z4m4Qwf6ygNzEhv4nNUDNjRQnHI5Q4=;
 b=Yq6nc/GJZlXmAqEDmsKG8/jn0+tiuqOOV5qt4nfdKXqC+2yLWOidxm2ptyHKvEiShc
 /HVOXpnbXd6GwD1QhXN3U7qZk+wYHjof+TEXgHS1ni78XcZG21fhUL5i97ACkCTusNFs
 RUq/TliAJ4B05teGten9PHX61Ole2IE5M1NK3eWgv/rg6ojTYaSmi3dHfr5UF5O0+3RY
 4OveGzSkW+u6YOiKVZOu8TIFtRS8mGdAP/nhRqiratZKoQc1gNuxrU0IesGXGyzSGtaE
 oNUsMVvHaNYVQYznL5ylMkj6v5K9fh9XsrGmbEaxqdEEEQLB4tmBPbcK9PJ1cqTL1SDf
 L62g==
X-Gm-Message-State: APuU4Z8KELhSYGPh1GOduTKmOwCle9+5iKMi05D97BT8yAEGoYNElJdV
 NaiYIucMHHPB9B0QAuEJGjg/tLUQKZf7gbyVroq0zzwycu5e+cfCq74EF1hDbFjgnyjutqaliWp
 UNimmJQ==
X-Gm-Gg: AZFdTZfjA85Vi48DuBbmvT6vrGufT/JzI2y20hkxyQfiuJoA/E6Y6N8efF2REFolM3K
 4FzxxY6AcpZY7qyYTx66ADZD3lWYnmwjlfFlpOLFVjXn7aiSrYYk8/HMeeVdJOxWcu1yoi59SWf
 uFwH6VaBJJWWme9OdvqrbSfMqxjGvcuZlt8IciYeQUrxdFaCjV4gbUmi5eY16mTiOGO+qNBYNAQ
 Z+mhrQb9nnI9hfqnO5hyxzmlyUOylbHZLcee4UPgGm0CIF6dpCbC6f5ifCOmgblo+fsFSQqdnB6
 UJRdB0a/CrYVy8JL6J8MdHhF78qSC1dd6qhWLgjb6oO5bjBjxB2zUk6ruQIqxOwe7k1TGP/LFxw
 Mb49r02c6l969nVgvLAowLkizAhQSN9s/Bb5bAsxlkuhPvHc/XIEXrU9Z+JNuz9lZ9h8+lJgux0
 V59mq41nNa0W+YBPuiBCM5Pi9NzsKgO64YdXHxsn9dgWqtmAMeUYtykIaRqiL63iXl5gzzQ00Bd
 TGz+QINw5Fjgd1WJpRBvHKJJ86UwhBucDr4gnjpcUlcl/rW8DMVNhrgdwfUe5fLJQt7dyjjtTTg
 F3Canu6AjnXbt7nBPjFqhs3pNZ/viUTeBM98GkQiWn7lMLPxhAOy1aNlagw7U9hdiD/uQMKaV29
 1+67mfnVKLeU9i9PIZ9/mcQ==
X-Received: by 2002:a05:6938:e04f:20b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c513ab1349cmr840391966b.42.1795516583315; 
 Tue, 24 Nov 2026 02:36:23 -0800 (PST)
Received: from LSUA0081659NC1.d400.mh.grp ([165.225.12.184])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc5396sm491742566b.58.2026.11.24.02.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 02:36:22 -0800 (PST)
From: Frank Vanbever <fvb@funkworks.be>
To: buildroot@buildroot.org
Cc: Frank Vanbever <fvb@funkworks.be>
Date: Tue, 24 Nov 2026 11:35:54 +0100
Message-ID: <20261124103554.696850-2-fvb@funkworks.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124103554.696850-1-fvb@funkworks.be>
References: <20261124103554.696850-1-fvb@funkworks.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libmodsecurity: security bump
 version to 3.0.17
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

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.17/CHANGES

Fixes the following security issues:

- CVE-2026-61812: HTML decoder missing entities, leading to evasion
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-cxqf-vgrr-xxrv

- CVE-2026-61813: Incorrect libcurl TLS hostname verification setting
  in HttpsClient::download
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-2vqc-36qp-ccmw

- CVE-2026-73856: Response body inspection bypass
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-vmg8-j66p-vgvw

- CVE-2026-73857: XML request body processor uninitialized pointer
  dereference
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-jx3r-phvx-2jmj

- CVE-2026-103932: PCRE2 @rxGlobal match-limit errors are converted to
  no-match
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-5m93-4h75-3p2w

- CVE-2026-104259: removeComments transformation fails to strip
  adjacent comments
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-qrch-pjfr-9g47

- CVE-2026-104269: RFC 2231 filename* parameter bypasses multipart
  filename rules
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-5pww-8rfg-9crf

- GHSA-4j47-8qcr-jf59: t:base64DecodeExt discards the decoded value on
  malformed base64 padding (no CVE assigned)
  https://github.com/owasp-modsecurity/ModSecurity/security/advisories/GHSA-4j47-8qcr-jf59

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
---
 package/libmodsecurity/libmodsecurity.hash | 4 ++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 011059d91d..25ef142383 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,5 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.16/modsecurity-v3.0.16.tar.gz.sha256
-sha256  739be3c71b1939f14e91afe1eeae654acbd440da11bd29790458840bc315b4c0  modsecurity-v3.0.16.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.17/modsecurity-v3.0.17.tar.gz.sha256
+sha256  f283b33d5c21130fd3a15c84a93a1abe12bd1949edaf44288b12af571b671a50  modsecurity-v3.0.17.tar.gz
 
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 653b4fd159..05f6d95f22 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.16
+LIBMODSECURITY_VERSION = 3.0.17
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
