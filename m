Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93677606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qjT92Bvz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5A640870;
	Mon, 16 Nov 2026 15:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRfMrOS-IfrQ; Mon, 16 Nov 2026 15:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6873C4085C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843651;
	b=nfvPeeLhyxwpYqZTsEEPh0hKjUna5sxEYyoQK9PwWpFFXwpWwGmqqXSsGCn/jpCB13Jx
	 n6gt5s0ty8zUELMW17v/ORIsTuy+5odIyRrl47O6oOqwQ6njzmhTNU7xcnFTi14X4wRnJ
	 R4DmC/rxwB4r/Ri+O7hA/OUQ9RqghG7V4OOuNUhLoj6grjPaP0E049RuW7Q0V3xm/HE+g
	 jlbIFmsy+CfKUyX7oG1r24IrnJ1FLxACWd6w9GeBq7FVQ8us4/ElIYlgDwFLpDQDSNzrS
	 WD1N8/xL30yHysY8UGjZeo7UvTkalztoK15+FXLN97hY98RU9LO3gYPkmTJVRvfYRUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843651;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u8bLTgBTykyBGoOk7tK+I1JgODoEgdutKwWX0hDRT2M=;
	b=IWq6TS2sKv7mg+la8ymWuW3E39w3wNO0PDGD0BDDrPS6MojSFf0IkreYds2B/ADBaAg9
	 RY+itx16FL/+B+hpVq/aPgztQ7K8rSfZV7pP7xFSF4rcpFtE/IUpLQJZP3tiojTFC8L0T
	 n4nuffP0E7gXS5QPS3z8Wj++R6UDkqde754nyl3TICvnlAi65JPo8xAirHxGYBKZGFSUR
	 wfsACao/UmMngkxX2LS05ssRpYsyFjIXVeEJjM5Y1vWsh08hM9LjZVrVNmniy1N3LX6dW
	 rok7fwGq541UuIl6+OBb5mvoDifHOcXVwWIPPi4V58xS879dm2X4UmWO0hLz+lluJag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843651;
	bh=u8bLTgBTykyBGoOk7tK+I1JgODoEgdutKwWX0hDRT2M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qjT92BvzhOe03ijhmq/yemgbjYz99ivz2LBnsWBeelCGe1+hS1B2M429yA+ZIxC4h
	 A40ueDgaFjt1JnyqaJW2gpSe88K2MOcLiabLEosjPtam08Gbnc3dCFsecCojPfNI31
	 6Z9smzRCpjh7UL25NlZlhVPcF8ss+NRU1EelLDfX22cGzEikuFGz9J/qfbsEcbGoxv
	 hWHb4s6mDsEvYsvdWL8ZvNGpMcWoj/X5S4MuZ3R5GqH29yltsCgpzgbd4vXSotDtBy
	 WqL2qpvCZK3E1QSTqoXD2mFgC6gl1Gekj0m0EWEbueWE5SP2z2UE7RpnvlIyDqXaYR
	 FiteN1iNrHGjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6873C4085C;
	Mon, 16 Nov 2026 15:40:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88B8A109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D6240862
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRuFK2it7K6r for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DCD594084D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD594084D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso23391455e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843646; x=1795448446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=s0MgMYJbZTexILMeFw74ao2y2k8ot/FQnGjryHwtpug=;
 b=yXqPBF+Q2jgbgn8rSHlI+9DpJsGWXSobfKW0xgo5wI8QMRg+psUFmBbawhwt9GRDeT
 fPTtEI8xgkvr06Ih7VcsBRJOxVzp+MubJ9OtMNLDIPMXMbgeO9zw6XUI5WGDY2/1ZUeT
 LIct/IGgGtEJ8ensKEY2WpVDaKM72uhNUhbfYrsW/+kePcQJsv/O93HIgDlBwxVbN/C1
 0UeiqUUZ+IJ/ARLP7DekvAFOUSlMDz6sxysuA4wInKjta99EldUYIkLLi84+0Eq7H+Nz
 6IrBPEb2grM+4Q+ZY2XbGxYiHEmC3eSicxg1lxXmXjwdY59f8vUc0HaFIv5UeWXeiIkb
 jMRQ==
X-Gm-Message-State: APuU4Z/By6JWWRChETUsAkJTwMifnPwaqdBUcJX4R7qDxUXtM5QzssCB
 2wf5fwhGpqa8D8JHbFeY/XpvHiewSCl0EPy0MINGNFE/39bMw+2udEY6hhRN+dBjLIQRBKozVut
 aRnbbTHM=
X-Gm-Gg: AYBFou3UtSg0U05zqfUejKhjRTGWAU/AE8MU+uZu0XgClMPPzWZ4hC0uUviruP6kT5E
 D62Ch7Uguk6OuRrmrHB/APC6T+Zzy0kvnvP3p6ktNXGAiocRXNLgBFzi9ryBovctGmtmI5dVHYT
 VaxqblwX2H4K7tbrPVif+oc5OagPvzWAdEUIzvCuxlrLxnp8FlbVbOuAffZdq+dhQ1QCKaQ8UCM
 XFVFhp8V8dpkRrOGYOXaOVqXQIvaGf8fyAB8EJDIVmsS3khgWhiPhPY0yLNTi6XxaU4RA5y5TpZ
 utJMFeahGpp+HvFg9Ro07bkbETh3xJY0wYefekk+wWh4p5e3lYDwvhazs7NAxux3kM7EER3Dz/f
 NyDpZNzHrQqIMVru4XbbnTFJoW96idBl/0JkZoBqG+zRyV12wQrImAB2PEL69rCaaRfsXKKNqQm
 v6x1m5xZ2B2CtH3Mat7A0aTWRbCkZjkiOLEmQynzIY+sbbaW/meaISliu14PqBXpZZB7Igw7Mq1
 xOivP4VE2kNiupx+Ae4MKndmfHV6g7JVrbbk/zoCAaq2o0hktxU+PeB85wrDHyk5IUmZNszjPOI
 N0aXqTc88zWbi9Icp5pgQRI3ztixq4Q=
X-Received: by 2002:a05:600c:470d:b0:4bb:6b59:aac3 with SMTP id
 5b1f17b1804b1-4bb6b59adeamr106697935e9.29.1794843645609; 
 Mon, 16 Nov 2026 07:40:45 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ac0e1esm270061945e9.3.2026.11.16.07.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:45 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:41 +0100
Message-ID: <20261116154043.726103-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109153330.473742-2-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 2/2] package/python-sqlparse:
 backport fix for CVE-2026-112307
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2026-112307:
>     sqlparse through 0.6.0 contains a PHP code injection vulnerability
>     that allows attackers to inject PHP expressions by supplying SQL text
>     containing unescaped dollar signs. Attackers can embed ${expr} or
>     {${expr}} sequences that OutputPHPFilter places in double-quoted
>     strings, executing arbitrary PHP code when the generated snippet runs.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-112307
>   - https://github.com/advisories/GHSA-457h-p88w-wq8p
>   - https://github.com/andialbrecht/sqlparse/pull/937/changes/bb3c50a52dc2f267c786f0d99c27b25519f9331f
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...pe-dollar-signs-in-PHP-output-format.patch | 45 +++++++++++++++++++
>  package/python-sqlparse/python-sqlparse.mk    |  3 ++
>  2 files changed, 48 insertions(+)
>  create mode 100644 package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch
> 
> diff --git a/package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch b/package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch
> new file mode 100644
> index 0000000000..fee0396cde
> --- /dev/null
> +++ b/package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch
> @@ -0,0 +1,45 @@
> +From bb3c50a52dc2f267c786f0d99c27b25519f9331f Mon Sep 17 00:00:00 2001
> +From: cve-zh00 <bastiang@uc.cl>
> +Date: Tue, 20 Oct 2026 10:56:23 -0300
> +Subject: [PATCH] fix: escape dollar signs in PHP output format
> + (CVE-2026-112307)
> +
> +PHP interpolates $var, ${expr} and {$expr} inside double-quoted strings,
> +so SQL text containing them could inject PHP code into the snippet
> +generated by output_format='php'. Escape "$" as "\$" after the existing
> +backslash and double-quote escaping.
> +
> +Adds regression tests for SQL literals, ${expr}/{${expr}} payloads,
> +PostgreSQL dollar quoting, quoted identifiers, comments and a preceding
> +backslash.
> +
> +CVE: CVE-2026-112307
> +Upstream: https://github.com/andialbrecht/sqlparse/commit/bb3c50a52dc2f267c786f0d99c27b25519f9331f
> +[thomas: backport:
> +  - stripped tests and changelog
> +]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + sqlparse/filters/output.py | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/sqlparse/filters/output.py b/sqlparse/filters/output.py
> +index 697ebc3..06015ec 100644
> +--- a/sqlparse/filters/output.py
> ++++ b/sqlparse/filters/output.py
> +@@ -114,9 +114,13 @@ class OutputPHPFilter(OutputFilter):
> + 
> +             # Escape backslashes before quotes so a backslash preceding a
> +             # quote cannot break out of the generated string literal
> +-            # (GHSA-3496-9g83-7v6x).
> ++            # (GHSA-3496-9g83-7v6x). Dollar signs are escaped last because
> ++            # PHP interpolates $var, ${expr} and {$expr} inside double-quoted
> ++            # strings (CVE-2026-112307).
> +             else:
> +-                token.value = token.value.replace('\\', '\\\\').replace('"', '\\"')
> ++                token.value = (token.value.replace('\\', '\\\\')
> ++                               .replace('"', '\\"')
> ++                               .replace('$', '\\$'))
> + 
> +             # Put the token
> +             yield sql.Token(T.Text, token.value)
> diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
> index 97f0ad389b..2b30975f82 100644
> --- a/package/python-sqlparse/python-sqlparse.mk
> +++ b/package/python-sqlparse/python-sqlparse.mk
> @@ -16,4 +16,7 @@ PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
>  # 0001-Escape-backslashes-in-output-formatters.patch
>  PYTHON_SQLPARSE_IGNORE_CVES += CVE-2026-59894
>  
> +# 0002-fix-escape-dollar-signs-in-PHP-output-format.patch
> +PYTHON_SQLPARSE_IGNORE_CVES += CVE-2026-112307
> +
>  $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
