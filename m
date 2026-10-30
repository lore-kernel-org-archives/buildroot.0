Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C45606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cBzYx5MN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB90460AC7;
	Fri, 30 Oct 2026 20:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeZ9dD7cegJD; Fri, 30 Oct 2026 20:27:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4D86760AA2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793392024;
	b=oxdhf7rMbJ92XJIk6yLsgH36bnV14mfQvD18optM9FFNK4m3cfItex6pmcz/5cSlsj6t
	 AYC6SxdGlRGr+QTVAZ0Ag6C8BI7v4q9KM5JrVS0boW6Tn5nG0VoF2uEMNBIl0Pd8IXKGa
	 G/gKdAk4tMMKMMVfWGgStN6DSzDmnROky8gIRSAbO9fXmd28XS4RXl1UUbR5okK7047m1
	 vx+EH9MNg/pxeOUoeN+oYewe1MDfITokIRWmFpJTkuvY23VIycgCGC/LvT0lm98oe4gn/
	 LOda4oKPIc0Kv2VxNGAASgkygRkuiCd39LFQzb01y8ukHb50p92x85+UTfExE4x5rFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=LJBh3O3htsRgiJph+q3cIG2N5l/2jW/jpUgbW/XrA8w=;
	b=ngbCyxYExF/uJCJ5rymPh/ag0IwM2H/Ef0dWFFlG4N2NdMLu66QHRwI1oI4kDOVEfwPz
	 zvs+TFd+4tGGCLMAdd3tjhmdKUs3AUcLhzLjdM4auUVDf4e5EqyeLaak8riC+DgLYZars
	 AiLugTwh4mUkew/lN2LIrEH5InARR5+2+jeKjgHkSBrMbRbsRQ7gXuP/VKWCVezTJBlil
	 HiSJR8n2bh+N7QBA8NMtAV6wf36OaQFr47Dzy4x2k/SRV2h5fllplGe4BuXk/KnVa7YRH
	 uN1vUeZ/a5rE5wl7N+OsHlrk8WPx3SnGP2aWeMnjg+jvEDcGPh8iO/1+h1cmP3YqMGA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793392024;
	bh=LJBh3O3htsRgiJph+q3cIG2N5l/2jW/jpUgbW/XrA8w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cBzYx5MNGqBWAiPKz5bQFemJwIt21jSmzrWv+JPGwlNwr2+5moaHkWueuWnG7BrrL
	 gf+3SaKEhF1v1UseCibqKozoW0/vF+FkHbghbV+J3LDTKJjd/EbZu//3Y0N5o1D0cq
	 Iv4oBtuB8/hQ1lh6dwaSoTq/FAuozb9L/HvPwavj1Yn9BJgFKVE1maINQgzGfRgvt/
	 JxGLEbQChNgFrxzzKJ3buSLVYw/rCHR7bNTKegtnW7zYUjL5vciUVIJAKxt1A97z14
	 R/Y9cVXpQMfI6aOOXDQZP9jM9xir7vP+wvfjXFHjC+rc0LpNjYjNRnAIvrDxLlVEbM
	 YRNpSgY1v3GuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D86760AA2;
	Fri, 30 Oct 2026 20:27:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 347234BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19D6B40A5B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAF27l5oHJEh for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5C020409A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793392022;
 b=FMD4lBO/wkh2NXnN0HXOS6/hQsO8Op8dioRBkNe75qI3+3AdFf0ewa4pgaO6lzN3yqdz
 l+ohpgLZqcLpta3OKLnqwJaW/IfTrOjLunswFv4c5fg0WT7lVUrPZ3+ObVvyRCZukgtoh
 7d8EZ75BH2Nj2y0UH8G05J5PtbOtPonEPZjLBZlDnGHuAxZUnyCetHfQiCNkYzOvj8NpS
 ST3PLgXUX76hT4NTH3kK+7NcYsDzVPZhZLtPxH/gkxz3abpS4WjNFh0n8xJYGbTYloV2z
 9YJzmtuVGnvND1O9xlOgEJABRRhs3YDGt+Hz3TzinuY0wx0ymbBxCMC2jk2sjMQ6SLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793392022;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=9uhgekcllxMfW4Hhmit+MXGQmJHr/yn5Fk2BYg2/hk0=;
 b=LMtA2P56zmu+hdmEiEx6O9dhsoUfsDmX3nXGeCEryy7D/FmTQDFhYV5hwOabg1Rmwj8S
 LZsx7+/2o84besXPyt6bThbEGg+nxlIzB3JkwazfnpputW1TrgWeoSPNndbe1Jbru4el2
 9uzrWrMlyFeJJPdEyRJM8V+ol5xCCBVVy/EvPCHgLZeLpf1kLSGxZMGj9IwMRb1kMTwy+
 3Z6bIzshi6q7ioIEL5ubRjVKjagM55pmvdOlPXk9tugvZ8i1CrN+GMn408feShaoGkZNn
 L07Oqj74x+prZ8WFmjVyJbsVoV/6CgEtFy5w+NDJiPLLO0Fgkoj4BWE96Hxu9fCL3Lw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lTiKvApp; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C020409A4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:27:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 862BA5FF88;
 Fri, 30 Oct 2026 21:26:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 30 Oct 2026 21:26:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 21:26:57 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261030115313.3112716-1-angelo.compagnucci@gmail.com>
References: <20261030115313.3112716-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c3957c004d011e7f2f9bfe4924dd340d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-web2py: bump to version 3.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

Thanks for the patch.

On 30/10/2026 12:53, Angelo Compagnucci wrote:
> Release notes:
> https://github.com/web2py/web2py/releases/tag/v3.3.3

This release note link does not provide much useful information.
Could you change it to an actual change description, please?

If there is no change summary, you can put for example:
https://github.com/web2py/web2py/compare/v3.1.1...v3.3.3

> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/python-web2py/python-web2py.hash | 2 +-
>  package/python-web2py/python-web2py.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-web2py/python-web2py.hash 
> b/package/python-web2py/python-web2py.hash
> index b100a1fec8..fd16d50cc9 100644
> --- a/package/python-web2py/python-web2py.hash
> +++ b/package/python-web2py/python-web2py.hash
> @@ -1,3 +1,3 @@
>  # sha256 locally computed
> -sha256  
> b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  
> python-web2py-v3.1.1-git4.tar.gz
> +sha256  
> 68efbfdc26a1b5a2d20bbfec9de522e7fb88d36b73ab7dac24011ae3d51b3380  
> python-web2py-v3.3.3-git4.tar.gz

When I tried to download the archive, it failed with the error:

ERROR: while checking hashes from 
package/python-web2py/python-web2py.hash
ERROR: python-web2py-v3.3.3-git4.tar.gz has wrong sha256 hash:
ERROR: expected: 
68efbfdc26a1b5a2d20bbfec9de522e7fb88d36b73ab7dac24011ae3d51b3380
ERROR: got     : 
ecd2e9a0728cd469a2e24a6e5896a0b610318c22c2d28f82bb9d68de551ff856
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you check where this difference is coming from?
Then, fix the hash, please?

Even when fixing the source hash, the build is then
failing with the error:

AttributeError: module 'hashlib' has no attribute 'pbkdf2_hmac'

Could you have a look, please?

>  sha256  
> 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  
> LICENSE.web2py.txt
> diff --git a/package/python-web2py/python-web2py.mk 
> b/package/python-web2py/python-web2py.mk
> index 68847a2385..27777e3430 100644
> --- a/package/python-web2py/python-web2py.mk
> +++ b/package/python-web2py/python-web2py.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_WEB2PY_VERSION_UPSTREAM = 3.1.1
> +PYTHON_WEB2PY_VERSION_UPSTREAM = 3.3.3
>  PYTHON_WEB2PY_VERSION = v$(PYTHON_WEB2PY_VERSION_UPSTREAM)
>  PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
>  PYTHON_WEB2PY_SITE_METHOD = git
> --
> 2.34.1

Could you send an updated patch addressing those comments, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
