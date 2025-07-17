Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65667C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1302E845F2;
	Sat, 19 Jul 2025 11:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ll43nzRN84nz; Sat, 19 Jul 2025 11:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E00484572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E00484572;
	Sat, 19 Jul 2025 11:23:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B66C0222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36CD41A50
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtoUwzEj-aCt for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC36841774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC36841774
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC36841774
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00DCAB977B26; Sat, 19 Jul 2025 13:23:27 +0200 (CEST)
Message-ID: <f64a43b7-915a-4d7c-862f-40afd9810d5a@rnout.be>
Date: Thu, 17 Jul 2025 22:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715232507.835115-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715232507.835115-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752924208; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=M5R6dXGed+vHcuCROeEahMSfNyDNuaRubhlYMwqDA18=;
 b=UiclwPt2llK8UU5yJr0RBzoureQ+DP5Z3PpZ3qr92jbCuPKD26a+MhH9X6b7wwX3EPzAiR
 wZpGXU9kpI8VhNmIv5rZy7uNbzc64n8OVWIQWtn2svfK5YGhunXQqYdlahpCCadmDYUF0N
 m/57IR0gWwtWCMci0YCr4g7VaH+50g3IjQCqlDPLlEvfZCDt6EcKVg/X5OJuxOlfPZkyHZ
 ayvwkgvO8RMEK/0yRQe5F0kH48EuEgVSmW+Eai90HE65fbiH0X4g5fQ47xpHtDOAjb8J32
 V/CHWocurCfXvIT6CO+FwzYH7g+WYNO57qjcgQRumrmpUMDYjy1VNi7N6Nybcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=UiclwPt2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cppy: bump to version
 1.3.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/07/2025 01:25, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cppy/python-cppy.hash | 4 ++--
>   package/python-cppy/python-cppy.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cppy/python-cppy.hash b/package/python-cppy/python-cppy.hash
> index 73049c6df1..f8fb8b9568 100644
> --- a/package/python-cppy/python-cppy.hash
> +++ b/package/python-cppy/python-cppy.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/cppy/json
> -md5  522447d934d18484cd4cfe90c1872628  cppy-1.3.0.tar.gz
> -sha256  da7413a286d5d31626ba35ed2c70ddfb033520cc81310088ba5a57d34039f604  cppy-1.3.0.tar.gz
> +md5  d62122f9d03d1f2cea5d911fe8b17216  cppy-1.3.1.tar.gz
> +sha256  55b5307c11874f242ea135396f398cb67a5bbde4fab3e3c3294ea5fce43a6d68  cppy-1.3.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  db7a008bff1e63ccec397cfa033109740c4dc6cb12070a70d0cfe69aba27c4df  LICENSE
> diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
> index 3253956672..28b77963f7 100644
> --- a/package/python-cppy/python-cppy.mk
> +++ b/package/python-cppy/python-cppy.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CPPY_VERSION = 1.3.0
> +PYTHON_CPPY_VERSION = 1.3.1
>   PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
> -PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/1e/84/62a09daa04e732a5763ec22dbc11b988e5140a77b418ea70bba9ab1a77a5
> +PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/45/ed/b35645a1b285bce356f30cc0fe77a042375c385660ccd61e0cdc4c1f7c44
>   PYTHON_CPPY_LICENSE = BSD-3-Clause
>   PYTHON_CPPY_LICENSE_FILES = LICENSE
>   PYTHON_CPPY_SETUP_TYPE = setuptools

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
