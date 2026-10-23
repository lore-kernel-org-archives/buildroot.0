Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC39606A31F
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bGCbqvJc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PERquZf6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2AFC816E5;
	Fri, 23 Oct 2026 18:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BycWgNt0iuyj; Fri, 23 Oct 2026 18:19:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 40246815CE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779563;
	b=XixmuuzFCJ3kcoa+4PRXMJBujpo74CQWVJliMuYRourmjseLPkHSKt2jWMVhMnYk/LmQ
	 80kkVXs3Euf48FOYW2w4NITBxfvqozxwvQc4Gce2Mo56epwl2a5ifJRRrQSYCbRXJH3Mo
	 OU7VbHUpptsHcyJ+1bPgrFsaZdIu0zO6NY1rJDA/LSHsOjK2bgk9nP+CjZQ9Cku/SF0kv
	 dVneossc8L01MPS4g3AY2rULAJbEcUNU9PTxZfaXRHIrdMkZGLnjrF0O2TEn777j9st9s
	 IqKNzfKxNOew1z1KmOgqYMnGHRdtPxpiTV2JnRP50prqfOmFzhoE6gHvWPmzMC5b0yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tV/bFt3YF2nzAsZE1RF3ygS9kpI1JwMwTskmOXxU9Oo=;
	b=dS9fqGfXZvB8FzRJztGbaui6p4nwCxvxWYle4bhLQHQy9m3CKjMiqTaAHb1gC7F3jsN7
	 rCdY4g5gTikjhjjfMWbi+KWeLtbxdaNDi8yWN0irNt9mhapFETke8cFyZuFvS2iAJ/4q1
	 jk4bVyV/JS9dvCG10flJU7Du7WRRICAIITo+dgR9DG6tsp3l01UBbcSjEaY2GLOAmSmm8
	 VgQKB0b3CupfNT5QR1i9snLo80rS629DYBE5ukPJmgeKeUDL2ztXKPJepDJAx9iE72i0v
	 5pcCVsHb2yNxOHn8kF1qVcwOh0PkWhb0mHMv2PnotYv7gEQ31HVN6gKny8nolCUhZiw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PERquZf6;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779563;
	bh=tV/bFt3YF2nzAsZE1RF3ygS9kpI1JwMwTskmOXxU9Oo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bGCbqvJcBuz4h87AH42HCPgRUukyVyFRwLOW9Y/hReTYXC7LYfX9bsuMcj4JEX8tc
	 74UK7pqPEBRr6A+ktLR3f9WFmK65L3zAEGZoktPOW24BjjmVzhE8lF+YumA/pL+v6s
	 6V1gDjpWrxXbFea9Cfgl4wVdMPDNtRdkim12NbucNQ51Ip/ABjcyCof2g/8g3MKZIO
	 QWkuWRWYoEpC6Ltng935OSvkO7H6LLLiqScBkHhkc104O5ZfMGA0D+kd5IudBnfSSe
	 hGmUAArsYEwUlLK1EkLaWifOVILbTyzbwnX9DtDEQHMv1gzdwrE0kbYc8aKeJ+9cjf
	 7u+awj/uhQmXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40246815CE;
	Fri, 23 Oct 2026 18:19:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B28F235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FC5581697
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Q4Yytqd6YoX for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 97153816E0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779551;
 b=D6zJULgMo+80h1JTscHQN/ThlUaf3s7AIVGTRv8M2zplH57camnRGkHAeaMQVEJIqatn
 p9kx6TBySTF6lGaOE0W7FsdlpDrplqarF7Isqxy423J9vBhl1OoT7Jpy4tpwYbgpGYLU+
 X9WD6TOISLF4ayN85RrGzxNX8gvZqLSod/Jl2rKas4YkhG26zOpbLlJo66r2oNUG11nz1
 K7fJ+KDnz4GP+LVELWOcNZWl9oIoggx1Su1H8xAotEBNMZLsqcfCO3jet/13kr/E3XD37
 InnveQuxh+8WfafhJlYJcMWo/4HHLlL7mxyVq4tJI9Qpy2N4p79jh4gmuGmJb0egDhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779551;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=j0/bcCogukXIup/nxy9WZ4pFKh7FSSBEpE1rRfGXmDU=;
 b=PxvQBfIJpDgskbBUVbl17D47IftWxXKN9oyJFKGMEc1zgKIBcbiutL/6j0D/BM4imqzz
 ysdmnLKmEaNNxpTJwg+bjlc9k0ovuy9YdFZHLIg4E6jW/JZxXif/s87nD/lg2jHlmB2GO
 XjkDnSmyv24S7MBAGaGdEHjsx6D2DsDuvg3Ot5ebZ8Z8a2VGAnX3+0L3LgmOVMMYAQC6o
 12e+FGVzblTcMss4s+1jADbhqZnpKTEjnzykcS4W/qeLLugNRzhjPvzBmTy60bOSyygWl
 GMVVIirFqHdWO17BEGY8jBjXF1nipMwVDMKx1QrXSsYb2wJiogaBqgYLsIh8vzLbQQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PERquZf6; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PERquZf6
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97153816E0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:11 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6df5e315bd1so767156eaf.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779550; x=1793384350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j0/bcCogukXIup/nxy9WZ4pFKh7FSSBEpE1rRfGXmDU=;
 b=PERquZf6Fo4SFJW4EIhnk02mfleK6jYDC2zcvZh+DqR7BZdMh2lQTIfwhfSxp0NfXl
 knuG++2FzdLdNvi+t/CVYgOeyxguL0rQ2oGQ8qimhbbtuQui4zxQWgY5gSxnpS83dZZS
 ZAIlmdCmOnEodtuc4ooAeX1Iojz9WtF3+9nZr47Yxdz1tfHP3ajwIQU9GH4KmjC68EgA
 fGS7jYIOJyCXqc7sWfx8E632ZtK6PvWo+unJwOpYKDBqHHZmp4dQX73LUYgO8vlSOHa9
 N++VHD/Gh4k7QxhAhWLuozIoVXNXD9j8VfPzxBCYJJAg32/Su4WY96xnosMnvWSjSdXG
 08fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779550; x=1793384350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j0/bcCogukXIup/nxy9WZ4pFKh7FSSBEpE1rRfGXmDU=;
 b=iIqq2GhZUbbsFcnlXgrIsMbuXjbCS202C7zymwVeltKBFD0KGtpYVPCJCRgIFQH0Y8
 Ji2IE7TbEx7XsML9wuoTR0QFvBmEiRltY0Y9q0h+zbFKneHNKnC+YHCQ/+qLyQSXX1wm
 cQ9VtjpEIpOAKaiCFeo4NnyfRPO5lJAYKANPIsUgp8b7A39CdUO25w0B6RaTTNPIhf7Q
 sLXmM+3WYTGqgOUlJde+zm6m/Sz+EL47JDDfXVAouseJzoceB2CoIzvOwq6j0eNjigEh
 e3wE10QjKGnh/qSQKlQ90mBvIxDL6xt5TqL5WvXq3O3GogmuPQwUZPYScNZIfo3xh5qn
 vNuQ==
X-Gm-Message-State: AFq9FYJMc0xLVIbsU8LDRUt57JDmaSX0JG2tk105hp8N94tgaEwcErBR
 LeVkL4WqHlTqx6f+JoZbW1l/BGpXhViWQ9rKh4LHTYNF/wcOO0z+evaa49IC6nNT
X-Gm-Gg: AYBFou3MToBY3CwEw+q1aJ4CDqaxrccmHp0uVe6MGsM5W7u5I+gYsbeHih8orsqxfXU
 MqJDRY50OcE87K+D4C1ST8OmsoZMZPBPfALKYW5yFNgxG8CeOvaQNyhcR9mMjX1p3w+UUkdkIIs
 4b2cFiG+ydysTfjCfbfv7+Ua1F7fApd1fT80jnF2ER33VtXgVApLSIfOVd7OXt5YEuw4VHvqkXN
 oYDyDvrcv15WFjW9hdl9Lh2wdB5GRfEkwd23jEX5eKNESpjWXposzSOw9AvblMivb4h6lH4MGKG
 ZsQ73r5uwiqodsneOXYCz+8wOUjcNcvB9Z2X7tOkkoDWahI5vd4gK5RGzoQp3h26vTIxAtKh6Mt
 04F3vcSwIcm8fArsSfB3RaDCPGjFH2gxSypo086eCpzMf1PK6slAgdhrp//bVqE3eEuHFPEWL1m
 a0o6Z08Nsl8v3dbSQ8+D06o3YDZGqM1ikc0xd3VM3Cnk2LGZNHWOC5rAnogxNbYqJiAcdK3YvuI
 3jd/skgCj28+LjTUO8QOzkuUGkh3en40lejOErZ7Ok+k47IYDmIc17cLNvKI6GiDMQL8OHLHdxV
 vPSuOID7wcC6QARz2WppT05/zNKB0sWKs1y/qruzGz2zsu5wTx4I29/gGFq4nM+WYXXfKgfSzJY
 8uw0slaADthkKhD/VIN6/5Oz3zoWeoUhZhXdrKoW4iFU2odGrCPHThr1vhzEpoahfmTK5RaLLdv
 ouYUT9mj3qlWUMpWMohXhNBK4=
X-Received: by 2002:a05:6820:a111:b0:700:371e:ee11 with SMTP id
 006d021491bc7-70b88b615c0mr1568367eaf.78.1792779550317; 
 Fri, 23 Oct 2026 11:19:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:19:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:49 -0600
Message-ID: <20261023181818.920329-32-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-wtforms: bump to version 3.3.0
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
 Grzegorz Blach <grzegorz@blach.pl>
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
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 04774b2ce3..a74c49c395 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  94cfcc701458d2bfe1449bbfc7872be3  wtforms-3.2.2.tar.gz
-sha256  7b00c73f8670f35d4edb0293dcd81b980528bee72fd662b182aaba27ae570b93  wtforms-3.2.2.tar.gz
+md5  171d1dd8e3d63d752b1cd5e9f567a093  wtforms-3.3.0.tar.gz
+sha256  efbc626b0b68d3bcb77822e0eceb995f56c5e9d0aeb4220b9dc2fc9f03e7e1ed  wtforms-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 76bd047ae6..75ea618491 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.2.2
+PYTHON_WTFORMS_VERSION = 3.3.0
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/e9/91/ed9b517da898e3fb747566aa3c12a734bd64ea7449a0d25ec74ce8f8b8eb
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/c4/42/db38b45b7d791f608d7f1afbb9176dfef4a0dec415eb435b07cd44eb96cf
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
