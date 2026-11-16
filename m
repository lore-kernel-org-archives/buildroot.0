Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE22606A333
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PMAtoRkF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4B040807;
	Mon, 16 Nov 2026 15:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pU0crEOuCVdj; Mon, 16 Nov 2026 15:40:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C8A540859
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843646;
	b=Ef565ufRRNETdT8fM2EqvwYRUbIc/S+9mkIu2Sis2t50GHUQxYbLqlc4gFIanKB4r0XX
	 bdMRmUHkOO/grN+DAs9QyJT6+0p8rvFgIYlsz+XQUyzTmdMEeXbX/MPzMiAIN8LazupHV
	 Io7qhthHQrZU22xDeopvF4FfNXgvICpKh06imvqyUmfBQ4Rkn6OGqDY5nwYkVBVw4VfJM
	 PrM4qAifdODvyt71cSxXG/PD5DOON7LzCConfiAym5iVxIlsBnAMwPDLgvE82iIEBjXw6
	 cu9aTlZBu7ateijJXDjcT8n/jLaa//aN7DOLRT5Oa/YMlrtEO62pZbUDK9o+R6vMH8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wlywT0MYVYFYyjixZETw2yMQKaTQm8ATDoFF1U3tXDw=;
	b=bMmIciSDsgjjs+sexYkMbSOeMciUsFG8kvI4BfUfFF7+YGUytNVKgyuKTzh7EEDGUOCL
	 oIfThKGqXJloZZTI+6bU8BwJ3I+5Te1qDDvmeHtBFRWcvaLqSjKRlsVk/AjFj1pYOw/yp
	 tzVBq2GxtLsjVMkpEIBjOdmh5I8IIcNNpkafvEiTBNnyGn9tq2RQmQzlOnk8FgPyapg+9
	 g/TMzrODx+LnR/LaHLdnP+RyuqO0rR7m0uiwJ/pEm6ACw+vtdBiF8IQT3rVlHkhAZDWZs
	 Xj9elbu9V6bVBa1vCMle5daI9sU/+8Y8Y1AaKthKN8+nXkrY6OyAUNms8/qIfQ93hcQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843646;
	bh=wlywT0MYVYFYyjixZETw2yMQKaTQm8ATDoFF1U3tXDw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PMAtoRkFzdWNmT+F4/zA4YnbAyM58bpPmc6esZNHf7GSH3NxAw3Xf954qDKID5OZP
	 ziVlqgMWi/rY6B4Bu+AJueCZOUsLhj08fu/0JlccGmDHO6nIyDbnZ3aB1lL0iuWdYC
	 CfTwmniYIMUinDvkZZB4Lwb6NZr4NVeJYXzLU5j7VtE1YPRVSapxozjDFU+Gmnyy/T
	 LFBTmbGnt0VuCAuCljlRYNLdEtXAeZO7I0MwINGYeH34/xRrGXFe3r1AkOiRDv8gdX
	 JdO7vtCdm1cup2qEWGG54DPT+Ctf6nr5zPfONKqGEhIocwZGJyynFGt4JIAta01HF7
	 SGlUyd2ENlgIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8A540859;
	Mon, 16 Nov 2026 15:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 541B5109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AB766083F
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBxl8FTiEjy4 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EF7F36083C
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF7F36083C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so3264455f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843642; x=1795448442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bnjYVe2NKtWBpyTvC6+nBGzgThbAmuu2Riz1lDPUJxs=;
 b=xCHug7x468iFCU9zjGK8SVUc+nBSI99XiSk/VhmMmpGjXJjXQ+Q8qknIFGEhMfl73S
 F6V/FyoDb/LIdxAD3KPgzf5hhgNBdzmbFNmR6oE9BIyXtyN9av3wyk3lqYwqbGFoqdCq
 ADyiED13D25FI/klwJpeeRa27hRrpNAD+eAFARP1MLs5Pxo2Dc4E5jS6JNGo5wCw/vXw
 D/LElMP7vEm009YEFmRCRRcxVU5zhgc2Fd0+VyjXDVDfRfBf82lwozqwx9ddJ3cRJYn+
 G63sGxB+Ozaj0FMiNnqVm/6ShJui5pC4YBj2UOry4Pszx4QvuAdhgYc6XXA5Z3t2AB8V
 YuMw==
X-Gm-Message-State: APuU4Z+ng7kFll1X74RmeLgZjIpYFnnMaYFajnSyh68BLu+I7nH8xApm
 T/30hfYp33jFGPtuEThtEvq2WeBtNyVEaPOz17K7P/wZ8AMoeSgc+26wuUzxjaE4eULtmeSXiF3
 taWgHArU=
X-Gm-Gg: AZFdTZcjtq+sKD+KXRAAoOsqsC8hUm4nHS5/XuAkUF2gw02u9liBg6Hqp1JEikD0nAy
 1cBu7uPbV15bOmE7+yUXf3yi+1mUP61LeXB27KZ07pJLUIjOwMjdHhFBpprtoQ2u9R3iGqaorHp
 3QdF/Zt3ZL4i78L+IRMMxkt5xCsWaR3Utwq89kpYQXSra2xarLJwlyY/k/QdMFwBJV6QWELJgDe
 Znltcl/WJGkJE2YXaCHbzjpVowNWmMGuN8Oj39SA0TwqnJntD2MGioR/u32Lht7FY5xD2CMyriP
 rW/u0g8/LLBPRyDNWWISzZd4YYWlPNkPC92j+4BPB3ajk37Y2D0haL0uvMtmx0Jcv2PHTmrbwT0
 pTMggaxtB1Q6+PzbTOWARXu/u4Ut68HcS1eCYKzO7g1C40jXASKpdKVcvJwJQ+Jszo0Br1gfDVk
 s7RseZpUP16Y5QM6ZhhOJukUNbyGRJb7zcL2rDSU3k4lgb13t2SDEB6e6rb8TCZbxkAjiagmQFA
 8eD81ClxXzR6+s42g85iivr1C5a5uTM1Sq+2ApZwqp130bxcahH8Cx3Kg83fMFNR/4AunWIOaEr
 8KtZZRVEWlurdpDlMzfmnOhSwax3sZU=
X-Received: by 2002:adf:e19b:0:b0:491:1e11:9ffe with SMTP id
 ffacd0b85a97d-49c6d453a0emr23118687f8f.2.1794843641620; 
 Mon, 16 Nov 2026 07:40:41 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49dc430fa15sm16660704f8f.13.2026.11.16.07.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:41 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:38 +0100
Message-ID: <20261116154040.726072-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109153330.473742-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/2] package/python-sqlparse:
 backport fix for CVE-2026-59894
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
> - CVE-2026-59894:
>     sqlparse is a non-validating SQL parser module for Python. Prior to
>     0.6.0, sqlparse/filters/output.py fails to escape existing backslashes
>     before quotes in sqlparse.format output_format='python' and
>     output_format='php' and the corresponding sqlformat -l modes, allowing
>     crafted SQL to terminate the generated string and inject Python or PHP
>     code when a downstream consumer executes or imports the generated
>     source. This issue is fixed in version 0.6.0.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-59894
>   - https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-3496-9g83-7v6x
>   - https://github.com/andialbrecht/sqlparse/commit/53ff44b53e27cff78259acc1af015506fea60f63
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...ape-backslashes-in-output-formatters.patch | 49 +++++++++++++++++++
>  package/python-sqlparse/python-sqlparse.mk    |  3 ++
>  2 files changed, 52 insertions(+)
>  create mode 100644 package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch
> 
> diff --git a/package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch b/package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch
> new file mode 100644
> index 0000000000..c379d32155
> --- /dev/null
> +++ b/package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch
> @@ -0,0 +1,49 @@
> +From 53ff44b53e27cff78259acc1af015506fea60f63 Mon Sep 17 00:00:00 2001
> +From: Andi Albrecht <albrecht.andi@gmail.com>
> +Date: Mon, 29 Jun 2026 08:29:32 +0200
> +Subject: [PATCH] Escape backslashes in output formatters.
> +
> +CVE: CVE-2026-59894
> +Upstream: https://github.com/andialbrecht/sqlparse/commit/53ff44b53e27cff78259acc1af015506fea60f63
> +[thomas: backport: 
> +  - stripped tests and changelog
> +]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + sqlparse/filters/output.py | 16 ++++++++++------
> + 1 file changed, 10 insertions(+), 6 deletions(-)
> +
> +diff --git a/sqlparse/filters/output.py b/sqlparse/filters/output.py
> +index 253537e..697ebc3 100644
> +--- a/sqlparse/filters/output.py
> ++++ b/sqlparse/filters/output.py
> +@@ -61,9 +61,11 @@ class OutputPythonFilter(OutputFilter):
> +                     yield sql.Token(T.Whitespace, after_lb)
> +                 continue
> + 
> +-            # Token has escape chars
> +-            elif "'" in token.value:
> +-                token.value = token.value.replace("'", "\\'")
> ++            # Escape backslashes before quotes so a backslash preceding a
> ++            # quote cannot break out of the generated string literal
> ++            # (GHSA-3496-9g83-7v6x).
> ++            else:
> ++                token.value = token.value.replace('\\', '\\\\').replace("'", "\\'")
> + 
> +             # Put the token
> +             yield sql.Token(T.Text, token.value)
> +@@ -110,9 +112,11 @@ class OutputPHPFilter(OutputFilter):
> +                     yield sql.Token(T.Whitespace, after_lb)
> +                 continue
> + 
> +-            # Token has escape chars
> +-            elif '"' in token.value:
> +-                token.value = token.value.replace('"', '\\"')
> ++            # Escape backslashes before quotes so a backslash preceding a
> ++            # quote cannot break out of the generated string literal
> ++            # (GHSA-3496-9g83-7v6x).
> ++            else:
> ++                token.value = token.value.replace('\\', '\\\\').replace('"', '\\"')
> + 
> +             # Put the token
> +             yield sql.Token(T.Text, token.value)
> diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
> index 0140961393..97f0ad389b 100644
> --- a/package/python-sqlparse/python-sqlparse.mk
> +++ b/package/python-sqlparse/python-sqlparse.mk
> @@ -13,4 +13,7 @@ PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
>  PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
>  PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
>  
> +# 0001-Escape-backslashes-in-output-formatters.patch
> +PYTHON_SQLPARSE_IGNORE_CVES += CVE-2026-59894
> +
>  $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
