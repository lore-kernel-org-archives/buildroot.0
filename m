Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F122EFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C9940F75;
	Tue, 28 Apr 2026 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrG4AM_374Ap; Tue, 28 Apr 2026 19:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA6DB40F8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777405169;
	bh=89jDfGewVB43QKHsz2XYCPwldlwdR3uCQn3ocHec4CI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GtpwW0l6MXFJha6q32iURu9FHinGD80HKw+Gr7FRGVZ+dKt+anIMRePbj3PHEFgin
	 fQnw2oSoKiqm6Rut83qOJ7C+8irjSJDxU16uXDu7VK6ylS0ZvdMWro/eUxzdzTFqcw
	 dPc2rWKQ+U9MQEJCK36zh9P3v/6dWqG4UweY/q+KeJLc5X9+1OxvtzeW0HcgdvUD0O
	 zJCP3KP2cZUFW7S28its+dITsEgcoMiF+RrncYY4TM5XGcbdYRWFcVxtf+PHws41pT
	 l5lAy2RSARifPKzCQLDunYh13cW0iuJogZ1dvKMaNiEH2bCENReehcT4xfMbZIa0cH
	 2aLCcCFNMEpFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA6DB40F8E;
	Tue, 28 Apr 2026 19:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1485231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 932AA407E9
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3u78GpelveWo for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:39:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86A51402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86A51402EF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86A51402EF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:39:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A03875FFB7;
 Tue, 28 Apr 2026 21:39:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:39:23 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:39:23 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260428073542.1027653-2-manuel.diener@oss.othermo.de>
References: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
 <20260428073542.1027653-2-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <bf650d16faa9e9732306bcd50e2f7d8d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777405165;
 bh=bW2hujRw3VnuhsnUNzniwVxVMaRRptiBKv1r21CNRfo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kOFEYdji/CkVH+99XNvdT6OzEz/kcI6YKShL7514rSL1mk36ToC6CDksSttdLsAzt
 IHBGGeqPCkRPTnD/nDPWyEHGvE84fUJlZ/KI7wZOg4J5Y7NAYBb4yYhRF6Kl9qdBMa
 aTPm1U0nmUkEzuY+WXNnkN6HIfQc7nLzV+t9qebiE5Sj1Cm7BLdn9aKa7EJCh/bHyf
 lJeI72bcxZmoKQem2+NKX1HkFm0PwjBpChjCV3rNRyYYQUQAxBcIGtoxjBkiKjlHvV
 zDr+7F9SHdjMORu7YfXjCoT3JXTU/In2VWSa0TIohYkOtXPYqJHWirwsvIp20yf5xl
 PWISupYfmUOxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kOFEYdji
Subject: Re: [Buildroot] [PATCH 2/3] package/python-pydantic-core: bump to
 version 2.46.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Manuel,

Thanks for the patch. I have a comment, see below.

On 28/04/2026 09:35, Manuel Diener wrote:
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
> ---
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash 
> b/package/python-pydantic-core/python-pydantic-core.hash
> index 61775e5522..c1a77fdb47 100644
> --- a/package/python-pydantic-core/python-pydantic-core.hash
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  
> cc643029337df7a2e90799cedbd75fef0636c6a467e74d22f4dfec4c1959359e  
> python-pydantic-core-2.41.5-cargo5.tar.gz
> +sha256  
> 0b4e5e3e499cbc2d23ab37206fffd0d3ce2f935e7f005e1fa8ef934ade26704a  
> python-pydantic-core-2.46.3-cargo4.tar.gz

This patch removes a cargo5 hash to replace it with a cargo4.

Running command:

make python-pydantic-core-source

fails with:

ERROR: No hash found for python-pydantic-core-2.46.3-cargo5.tar.gz

BR_FMT_VERSION_cargo was updated to -cargo5 in commit
https://gitlab.com/buildroot.org/buildroot/-/commit/f1f96c1ad006c9a65ac39b500ccd1c8581dd2fc5

Could you send an updated patch with the correct cargo5
hash, please?

>  # Locally computed sha256 checksums
>  sha256  
> 2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  
> LICENSE
[...]

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
