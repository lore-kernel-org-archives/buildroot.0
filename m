Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FF9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KmnpgNJF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5No2YsH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 510178159B;
	Fri, 23 Oct 2026 18:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJqE-MRE104g; Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7633281216
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779539;
	b=bJ01PML4Y+TTXycKFNCYAnZAdZT0qcfy9gu67J1g0z8k9tOtSEuu4wsOKsYCMwrCpBrF
	 YGJMa48T9DhgxssqaeEsmfUHqgWmo5vkEQoCiOEqIJvOKv/tUcZ4qRpYhJq4zAeGU2290
	 3SIYkEv9wpBvqkfbP2RtjSNjqt6ecS0uWZM4lijb7VIrt281ZETN53IheSU8pE2nTQLCm
	 NxBb5mUs61YqU93BFIgs2z50mKooZM8yreaZ+A8f+7AZklDbslz0BP3zEBGY3s9QXW7mu
	 jvw0S6YkKoQJeK5QDGPRb9VEes6dt6huFZA6LhTOKPC+JCmRZQUlr1VBMDYeKzWRtRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779539;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zw6NHK0cRBNlUjfiyUF6f8rMef+oK9QLFW+MWw46RsU=;
	b=bksgbJpwQMMEa5bctH2V61qHbHysM8lMGcK3C89/ni00kpIOMEh6xKrgwBd2GxYLx/gZ
	 zxtafeA1j4FFhjfn8KIivgawy4Beqjv1hLp8FEsD7u8IXcoMutipCEIY4pLcCDO9KWu9t
	 PCkKweOQ46X0SKJq+It3rM0MeqjepCa1NyU3JjddKdNn2sbpZhETsxIIEa3ppRL7dvL1X
	 LAdt0vpNGujUoVhIw+kFs88mdERdRQtzo1XESuoPLpSgrdrRa8Kzc2wqTo3v6JS5io7lp
	 /mkjl2S0Or//IlyzN7nOnzkVOM+/Gohqn08XpKX7a2GaHz6YoMTq0iQt1zbwcu7uL/w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5No2YsH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779539;
	bh=zw6NHK0cRBNlUjfiyUF6f8rMef+oK9QLFW+MWw46RsU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KmnpgNJF0uWK4zdCop+WiptwkiEgSxbNSmXbkrwH5wRT4CJKUozByMbgB89A5BQEV
	 8nS6Sr+l44FzzD4xg6mCB/5i1cMhnpoP3DfyxLld27QwN5CX4KbgJLYzHeXTm0HMN2
	 mmsgYWVlhM23qv4Iape6okcffpSx3vh/VRfLXsda0GSd2kHmdrXQS3uNZgmn2yeUL7
	 rtuZa9KnVCq2ANBQmveTeSaKOPJAuH5a8w1qxhvO59x4li6K8Bqut9ZAAm+/sqNYnP
	 Vmy2SSBy9NU3FmDvYZDoZNso3kgWt5oZmhAAJlgh/lcz5A3g5ebKdD8+Oq4fLTjNnd
	 o+aiiUByLEkDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7633281216;
	Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 853DD12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72E0F80702
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZNiP9YYGVxC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 63BA8815AD
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779529;
 b=Lo8vg+thNo319dg18Lsur+meco24qa4EMyyGsD41n4TGcdbew7zicTPyl9tMqRfc+Zie
 xJ4rKZCT5wllIwusQzFQlskSUEoI1KdG9JLMSomx/tVvupssuX2A3k3YZit5Ysy2KWBJu
 vQjBJzwYW4zn48c1k2apA15Ziucs92/nzhG2/bfY0Lcst4KPQBKHEWjVKM/n0PFxsXw0X
 7cPsPUpQQdtnZFJcUN25Y+9nUD/20UFRrvCQt3m4M52PXB0Ap4n+TciM+8nVAw1ou9AuG
 l+wTL69H0jK6xTvEFpTV6Iwt4qxaIZEE6Y5IcyNg9eyMgVgFHQIH85+YpjdT/TvTOfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779529;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=pxm5NWhwZ/Qre2K++jaN7ifACPozu5AcWfkU/lLIZiw=;
 b=YQd+TZa3MVp7WKjyIotapKDqxbMAwVSb18y9I3hpl4LE83xxLnpfYV4pMx3+KupxAZ2e
 nFmJFXWysCKnA6nfUQw855MtYHN0POfxp//ao4tPBvNjiZtoxLggi+pyc9BNX86BN2aL6
 KY5YgsEu661zXKY/f6hOZ0Uhbdecam4uYYhxSVwSeheXfj1FAj9MXsHBIxe4c+6wIMO8b
 Q5IiM6h/HL7acp7lz1zJiqeURZm5ueSUpi47tyrGO9QaOCJ3BalluVH52AYqRy2pCyIyY
 a0QJyPESZEweZoY2/O5TCQYzdezJ4uCwmJqhB8dJdyAjtVBeeH4ko0G7RikxexsmBEg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=K5No2YsH; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=K5No2YsH
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63BA8815AD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:49 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6de1ca1b05aso731914eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779528; x=1793384328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pxm5NWhwZ/Qre2K++jaN7ifACPozu5AcWfkU/lLIZiw=;
 b=K5No2YsHQVW1RyYnc1hreWwAj8S4OpiuXyjEkPQnqkuG/xXyTSaI0zo8CW+7fnGNkq
 rSk7GtdgCtYzJ4nRSHo2mEQxnQ7QupcoBqSXMyJDa3wx/ftKkQIgNbd68LYVBeqm+wdg
 3G930gyJvdmAsL28gtIW0MLtmhyQQpuahoTTtmRsPp/U86kOWgxJPOgsVi+BLl4tIcLb
 wOAUSggLNCGvvtYQbHmVINC5kIY50fTMn8kK/ryQyJtxx5xE0Bk4mRpUMCi3Kj6KRevJ
 klu0L5lFdjQo+pH5MERqXozbWd0Ek+VO8K1CNrwp3sA8ZnOytnW8lHKhokLQ0rcAcwYv
 cnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779528; x=1793384328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pxm5NWhwZ/Qre2K++jaN7ifACPozu5AcWfkU/lLIZiw=;
 b=foUNPGUE6Oub3jN73VSHUs2XUZ5llXpnbM7mPzn8i0JhUB8nX/dOMWx+dy3U6aEjHw
 H79n1geLGfnC6LE684zDc/3ATSBjhu8Le8cxPUH1yUh8pt7h+XwCZSDyDwrlOK9AJNfd
 EFs5ZixFuuOiMkDfv06QEgBwzehj8nNTJSvBkHrCVAZJvFM+4m87Z6e4ZHIA9Q+GFp9N
 IjaIykiWNKCPuE02XCG29U4FutYAXWqkGIvh5tl1ibWK245moP4gKUI5k11MzzMsXKV5
 7hmbWzvu9AfrsqFHY7bP58yhMjPfdrnIYaA/TEi/FMJlCvDvHQVt+Jj/cHlmVN7RjWnS
 /tSQ==
X-Gm-Message-State: AFq9FYK7kKF0fx5L90KsNkUtVCyo1nRALr41HycCzahq/+U2kn88M3qK
 N2oRH/AZCJtyYRDrhtmIrP37Rlt3EbHIUa2WgKsDK0pCd5eNHa2zvrrv7evRrzUd
X-Gm-Gg: AYBFou0CRueHxW8jyk4Uimj2DFM0QWC6waTbYd8gha9OW4MTR5KUxvB00t43lHAQxU0
 1JyNXliKvmU9E3ynd45MmsgQsWNwvM+LcfJUN7y+EUC94/WJXC1aQQuzmR542BLP+PaH0Il+nrY
 eDXCQ/I144fv81sdFY5nSobSKOqvlN5kSeNk0QOYNJn+m++E7cbUYq9k7uYykloilHI9Qj3c1ec
 kAJm9QDek//IwMAkzA8FRcZo9qxBauZg8IPwRBOxyKaOjp+CFxcugWt2Aolovngat81eTb09Aw3
 i+PSFr1UkiAMzOa/8VzR7XzT0Yjh6paPYCmu6wrzyDg9HizXZQcekzyHJGG0c9KqTzGJ/Yi8r1R
 do3oNv9sFeOLS6G/xdaCmppKnvzDJn1Boh5cpqs+9E3zz035+zcckmicaPgTxQRtnPwf5huGhUx
 1j8yy+fkefLbYDCMenrv5VD2TeEKoZf8PTs7tqVZvoYO0tuq4dVp8FNp+ka9Zy8ilwNthfOnmiu
 eD4dZhBY55ycdRXfuAHm1pKjm6O8F4rrb3KgNpfLiWtVchSIOjfvkhSLAytabXeoKJXMy0Luuez
 dnSHd6TJaiN2kXx1a2PKtf9MIvKnUNf0bEoB62O6WxDfRCS3PrPIH3tkVeAQmgDWsYuhlyTgQrZ
 kbveBaUdIdts9KgW+PZUzshgWERgqHycE6DXz9qLU6Ix1i7f38wnBxq8TA5jpVfZzb4jCrhIwm+
 lFN/ESCkaqQhP/sXDUZc2tB3s=
X-Received: by 2002:a05:6820:221c:b0:6cd:3fdc:6005 with SMTP id
 006d021491bc7-70b88b2beedmr2135644eaf.86.1792779527982; 
 Fri, 23 Oct 2026 11:18:47 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:35 -0600
Message-ID: <20261023181818.920329-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pylru: bump to version 1.3.2
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylru/python-pylru.hash | 4 ++--
 package/python-pylru/python-pylru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index 46cd6b7710..faa9575119 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylru/json
-md5  1276fb7ba07e27c2f79462826788905d  pylru-1.3.1.tar.gz
-sha256  1ad89d14cdccefd81265bb619f9f9c351556e2e38fafc7a57b1319ded086f8e9  pylru-1.3.1.tar.gz
+md5  2710118d4618067047400d3f63cd5167  pylru-1.3.2.tar.gz
+sha256  ad610b227999da4e2cbaf68a6adf7b57ff69a3e3839ff0f86210dc2f5ebddcdd  pylru-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b376065aeb8d20c17795697af05c8426ae02f736dd06224ded1b35aad8bac818  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 39c7c620d4..761c1e7d87 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.3.1
+PYTHON_PYLRU_VERSION = 1.3.2
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/76/5f/1c22971415233fa6132453fa8b5a7464b7b7af004a2f236717de403a42c6
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/0c/88/dc306f0b4dbc5cd89c5153bdf5b2141d0f9107dde8b26edabf4f6654e65f
 PYTHON_PYLRU_SETUP_TYPE = setuptools
 PYTHON_PYLRU_LICENSE = MIT
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
