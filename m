Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE1606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C2v4+0mu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qWJyJAVJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 072A160809;
	Fri, 23 Oct 2026 18:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPnJVvbjOpQi; Fri, 23 Oct 2026 18:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F60860628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779526;
	b=RUUt6MhQ8aFvx9/1CoXtHaS1EVKIM3EEogIKByyfA6QlcpjBcP9Do9XseCGzFV99FumH
	 ddVWGLBBR6fne6MmLwtQPQKH7OGrWtyVCLZNgQObOKuZr335paRR9C/xkcPH7ow4NzO63
	 WCMtdYd+9PtLILe0F3bcASnD65OASHmrn3Jat2/z1BRiUjeLUUHgID+lLxux6YbGB4YPF
	 XV/6PLa+vb5Qaate13ejmxpadHBkx+31Mg4EI6jTj1YB59I+jPNr/iiRyIFV/nmad63NK
	 HNwRvC0DpfQscI63MpS/2bJX8Uh1+JyFmQJox7cQuxJEQ6jT8hoiAZM11HHfl1B9tzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=j6UW1jVvJZJA+BFM7KnXwyjSwSH9l0orXp8wmeoq7KE=;
	b=aT5+IExffGCo5b2R/+FYo2efCmt+oKONrJv4PHmQges98vTeXNUk1Py0aLDP8qfQXksj
	 KbhUKpYfzU5yiBbdMYh5cFLfz8+0o5v3XiAw3zEe6S7HO0B15m8lHjCXDRuFIVId7D1Dm
	 EQlIe1izBC3fJbaX8daT6E5vlIvtyHS31JCsgUXcqYCaPQfQWpeIVSmmL6LjAeJIQHwhG
	 qKz1ebb01NHJmthB6YHMOiQOdwkhps/1D3nAjccbEaJzzMMGu+qmLQwfTBRJAFrWtuoN2
	 TX3D9b3jgw9WbGRDLkWPzaG/FiPDQ1COBji2ZDaaBBlThKcGSjBAExWPTq2RHOWeD9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779526;
	bh=j6UW1jVvJZJA+BFM7KnXwyjSwSH9l0orXp8wmeoq7KE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=C2v4+0muWTbliJ5xHLTisHap5fa72FLy5YQ4hnLKwG7qSokt2CSYczmND9Z7lSbm6
	 fcuCFzGi7N117g3pam7v9bAoIBq+zYwrvvW2l60zPc9wu3PI3tyYCX8In8lduNWVgf
	 cZM1Vs8eiKVcnKHGQHhM2xH5gfAeMxoH4q/eWqnhGr7f5kpmcemaPGUKIIa631HaRF
	 G9UQBPnURz4J+YKgX2CqP/lJhC10GTiX1IFIneU04SaIJEB7zizIovw2k0mazTvQrO
	 4YHo/FY/eFfFhQ7H3gz2CbLaqcvzg8m92cQaDDV0dFk9vOP9cJaDZgYrclOFUwJ1gr
	 bQsRyKq/n9utw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F60860628;
	Fri, 23 Oct 2026 18:18:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1188F235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00B8340061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0S7-3Mjoql9 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 12D9540059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779519;
 b=jokG8AAW0t/PYGzMC7bLxnKBhJ+0anCr/rtblQqqED5VWnCUlTq9XWgoHFw8xQmufPqP
 nlDhW0j0N4gqqM4NMYLJV6mzl7eN/xSY/SM45Chg7IbfvL84WzfcyRrhwSMzh0NR/P/33
 5xS27dI6PPafxXexnPOTzYGrRkSdNxqXEE/eNoHlGiqb+07qGYweaogN1Ei/fFV1o/HAA
 LFJqKXxX/JNvWTlL475k7hKMoKqG0/zZb+7XTITL+VxfMk9naZPGOqgsP0u3g8Y4RURs1
 evdTvrbJJr0zdTWRhc5uxJOcVhPYSj0Q3bN8ijJiSBbH+uu9/ROF4yL7A4fhW6p8R+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779519;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=8pSiOgC0vB89sgbJzplAZ4DYbkYJFhXPpg/b71CmAeQ=;
 b=govFIOkQOdFbC/HF3+36ZNIi9VrLnniUdhUEs3RV8Sa7Orc85tVpCP0aFlGCY3kxn665
 1resk2Nyfu4h+D+rjuiyb4NRyw0FV5TDKtTmcLufeT4IvsJ9BV/PJ1P1+akRf9uTgFyeI
 +Yz+Q26WQwEQp56l0zNvdoNFmU84BDlCivLoBGcq6sUgghLg+4NjiHTBKSBpmQgoyYEbZ
 DlYK5RsrtwFZGEkoFgpQqltg8h4AamF5RNnQKiMleg0ea0NYzeQ2pdzK3y8jY39AIl5WA
 V7hoUa1GFbp7Lm99n5UPqoD719mTiarq1OXeukHhYWHSHQ3C0L4UKkGw2L12Eiu1KsQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qWJyJAVJ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qWJyJAVJ
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12D9540059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:37 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6d68de53053so624435eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779517; x=1793384317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8pSiOgC0vB89sgbJzplAZ4DYbkYJFhXPpg/b71CmAeQ=;
 b=qWJyJAVJkBo7Ye7GH/BCwpl1FrrnDlkRaWMsbNZ+D7w/qu60drhMGGVvhfve94nAWA
 MWv5vDCOFA9rXyg7BEwM7JIM8JTH9IMRrMC0w04vfDjz64s7w2SW6jsNP+e8u9WiLFED
 6yPoF9/9gtc9JocS9Zrl8JKOwLD06F2C2MS+D8RWYZlKjdPxzgoZH+HC9TDXlYIxOQ7q
 xy595e5IyrOkSSBJm3IfUdgK+8XD6N1XsJEwM70Yaaj1N+0oKRfKPN3OYrMMWnQX5JYC
 JrQneiLo4Bxpm4bMtWw2W9rxAea8d2zIklWsngVxP7vG9wlEKcq4uf+AjcKNIhQuTFoP
 CoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779517; x=1793384317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8pSiOgC0vB89sgbJzplAZ4DYbkYJFhXPpg/b71CmAeQ=;
 b=HpmmkZb1jpu+nneJRBStNDVuVDKqJ30M8AXSzgh+56pKmjNgWQQYxGH8cWNCbRbjYT
 AWp6ht02uHdCA/atXw5mPFAilopRCGZszhm8PzfcBmqZiFD5obL25xIwsGQWOkF8BtJO
 fDrKK3bCCNdBhP2ZIEgcis6lb1+ilKWHuQDCh49yiWr6HjFmcAtHSxp7eEFuHFOSQhRQ
 Risdy5vWCVVzJciYQKOjkFesNKcRXWdtdUijlDwYQiE/uU9c+y5FKI0R664BY6XEf3Kq
 fEVpi5+xXyxVRyU4J0XmO8GIRspekjDE/Qq5q+YTmm4YOzLiqMvZ9IJxrizIszvxWNb4
 MXgg==
X-Gm-Message-State: AFq9FYJPBfQHulJcSS52ORpQ8ao2wQsUK6svcqWcufe1cQ/108yJYX3r
 NSLnII8d8D+XyRNF3JIJci8STc5sAhxxmQzs8ArQVI5RSK8kMOBslzXtPAwJ2Q==
X-Gm-Gg: AYBFou2puZAFgV00VYNL5UIhF2z43D9iMGFl0qWzyHhNs6ITH1CJD1EnkeW00xyC7xt
 cqkObeRVpphLWU7C08U+hnfhEOBFLt75FPSKMgU0tiRRfayDqRHioQOWGhyL/zaPblgnnoTkku7
 phlttfigBOpyKYEMQ5HMRma/NlYPpBeqY2jHR7uNS+xAwVZrEENoqgNwRJPEg8hAMbbXUjeF4KO
 nn14rqvMT7MDPcw5MBIV68uKs1F83yKC19Tp79jxKg+0+HpA5Nmnxtn2IBXCJQlhUDip4THBSZ7
 NAT5gyRUjSaN8hhHATlFOXAWt7vJbnaTxC9jP3bt0MnU1pBqywli9d6w6suRy4qWUOfnxTmbfXR
 PCBI0q9O/vAZ2AV2sB+qGTu5CuBGBAPU0BtXkucb2sQWIf/bNBXI5qNM2DmUxjyDVgQ7Mm7+PpL
 LctOmzbwyegbJfavPTcn1h+0WDHsi3KPGpQJujsCBwdmYx7T5dEcG6b6ZRFAtP1Tn+VbeK0V5zL
 FN9xaIzEx0Zou0ODu9wJ3XGLS38rmjKMD/dWYo96ms95RlCinNTgFttEmMpgq+op8MY7cGU+5BA
 8pw9iNHyRD9RTAv3VB3NlQf1QEwrrcVikjMwh5HtJX3WPQDK/obYmydSIOYFbVIvL0Cun0BIg2q
 toZYEMU2kZGALn+meqnBpWfqrisSJ+JL5GHkgh1gSaZaU/xl83nG55unPuZQ0s8ULsp1xGBongZ
 lLPghUm7ZHLFzGy2GGN+qUj4dT01Pw8OoSwNoR0NTxtcNg
X-Received: by 2002:a05:6820:1503:b0:702:3087:ca55 with SMTP id
 006d021491bc7-70b889f7066mr2015273eaf.36.1792779516694; 
 Fri, 23 Oct 2026 11:18:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:28 -0600
Message-ID: <20261023181818.920329-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-googleapis-common-protos: bump
 to version 1.76.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-googleapis-common-protos.hash                      | 4 ++--
 .../python-googleapis-common-protos.mk                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index aaf12f78e0..c21b8cd324 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  d1bdd06d44f08c8f3cfd5722ab5363a6  googleapis_common_protos-1.75.5.tar.gz
-sha256  c7a866fc34ed29a3b10af627a4b9b1dc2433313ca6e959f0ae4feb132047ed72  googleapis_common_protos-1.75.5.tar.gz
+md5  46939afd0ee1e69eadfb2c852dbb0e84  googleapis_common_protos-1.76.0.tar.gz
+sha256  71db0e44a1d4c2dd024ebad44ca67129cc1e2892e4861df466764749d5ef8642  googleapis_common_protos-1.76.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index e21c5df3ef..9bdc82a6d2 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.75.5
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.76.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/8d/2b/6ce81972d5c8cab9705fddce3153be63222d9e12fd96f8baba5038a744dd
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/62/b6/bc095b23a3e0d978e75c8c18cabe4c11f791837410670e4486f0d539bfba
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
