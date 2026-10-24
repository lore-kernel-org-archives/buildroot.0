Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A826606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HoP5KrsR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDA4081BB2;
	Sat, 24 Oct 2026 15:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYkYqdcFJeCC; Sat, 24 Oct 2026 15:01:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AFAF781B10
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854090;
	b=kBsxCnh1duM3ice8ffpLHsED/uE8zQiX/JWVqbaTwiSN6dPOjK3pzDvhoZpZXnnMfAoX
	 xnrrCB/WfsIbNJu4k+vn+0PR11Q7hAZ+hIEVYLcB90xxoMHxmMa6/0FW9RT+usnP2AT+Y
	 J9B2i1OcqZpBQgYQ38+Q6mrpYpAwmvWTSAod95jLWgQV93gJ4p0NURq4yBxz0HQ2ceB7p
	 Yft0tuCfNa1mAkyuUdMQCzbrLJInZEIbCwsT2kmpXyn+0v3sGZE86fKq9zXVbz4dPlCmD
	 m9bdXLUKVSoHnvh7hDSU4bQjqRNR8j/bC0SS/W5ImAi4yj4L6zsQd3ZdfjlYb3xBJQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=HVdwGplj7pj9wpl4GmUy8JgK01bd6UOKJ9G3hSASTsM=;
	b=Mt0Fkfr9qQfHW+P6iuQEgpotCs2i8elXW3i73PgU1DTcFF035BZ/ATmftSa/aALsc/RA
	 MI26kU+IY5VpLQfvry9bbo+Ft5tyWyuDMof33A1SPz+yE9AXEVPr62tV7Ir/okCjLKUGO
	 k7NcAhUB40o5S/3Gh+6hSYVhAuBQ7FRjxQY9prfwNk8NrrieC1Ul/OTNoPRy5MlLYPY82
	 unkYxnx2LE16qv2qBYFEXmM+cUX0SMA6MeqJTyypyBQwaBDa2ZP4mdXeST5TNYh6EA92o
	 XgOoZVxLcaUZMaHf/Lb9Sb/Mv8uWIDkslUBA8nZi4yS7j0wV5PZk5YJabVKtzHmh5KQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854090;
	bh=HVdwGplj7pj9wpl4GmUy8JgK01bd6UOKJ9G3hSASTsM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HoP5KrsRI9cku/d4r3mpEODIIYLzxTSC7SdLGq2f2hE4GOLpdSv+Sp0Id1dXqr3bB
	 qpheMa9ghHFes4CL8m7dXNf7zrZH0kqAkuecvYxO7/TAor7tMuEH53DKgKcKqeoClO
	 13oFSsPrG6dN8l5EK63pmx9+kIW2Lx/xbH86s+tL7AgAQd/n8DgkDX6W5Ylh8wf/p4
	 B1K31wdDfVs6HrqYdibyzCayEodOm3zIRSPs3VmMNlk1JDuuD6Ks85ouP5ra3Ekhtb
	 XUj2PaYLsf+0zn7JYQeWovpv9xtgSoks8itSWr7n9Jv8chlkX37yxY5wcnO0FG5Wr+
	 ntfMsxXeDSoFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFAF781B10;
	Sat, 24 Oct 2026 15:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C816D380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6F2E819ED
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUqZxxtG1gLC for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:01:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C0D238198D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854070;
 b=AbCQ3hq4h0xFYT9nHOuGPf4jK2oC9fvFS3rHTXAFEnzQrUZK525X23sDueUotqtZmmHN
 FUASWmSe+qfJH0gxIRrNK/xb/CqiymBY9TznlUZ0SxzXPjZl9NS7eUOsZEv68RlqvMHzL
 jcSqD4UiPwqHCdS5QKEeGM9GRv2/V6Q9fEj1amWcnTMyZ/yBat4Ia9L7KZRuyF8j1tWqO
 kE7W3YLVWy632dn2ogT+QpytdQIk6IPAt+D9TdXfvbi67AmHuSUMDVGuBUKG2ZiieER1c
 4qJlGFcyqIAIgK4to2j3I3RXTcUt6oVF9oCY5V/7hqSQSsJ+/FZbwj8MyhiPNh5888Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854070;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=BdysdB6D+1Gi4NZplLdPJHIiJQRJYmDuzpl/4L4+oVI=;
 b=TSYjC3Ya6S3MCz3jK5FFlJpgVMNS64Ivn/C0q+FpLb8cH0hZY38jOuIN9BHnxA5AfSqV
 6P3F0kEhiqs5q1/4s2e4+qU5BJCw9TH1z5tocVBrBQQaFnuuJatuppLgBKmUJiT31clHN
 JDI9xctD8/0u3f/zhoKEm5toQJCeCiYaClPKNDv1PsQsRay2amawewfKrQKZC1nBZU1AI
 Lef/cv+DPkqvu21J88hRz3wzfo34jq6RSHXm3JwrubF/+glE569KmbEoE46q0ZnltnCMF
 Htqi7QBFZHE6X/Tj9jTrSSuqmkfCprxl2+FqGgpvhw7FH0vbBFS+DMZmAs8vnwuv83A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IO3JJS2L; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0D238198D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:01:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAgq-1wj5Yy0luy-00ZfGm; Sat, 24
 Oct 2026 17:01:00 +0200
Message-ID: <9f78ed56-54a4-47c0-8a49-ee23e12c39c9@gmx.de>
Date: Sat, 24 Oct 2026 17:00:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Manuel Diener <manuel.diener@oss.othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:0wNhcSyiumBbOvkvYZzAhufrsY7c7k6htRO72QhKahbGdkUQgdM
 o59B/+dcJI3HzpcGPUzc4f6areiM9yT4DUGQSUaIwHsqRm5sNE/3sRmoI36N4TQH93wP45+
 zQEBdFXsSKO/yl4GFrqIBkqI2YfE07nhOjVAsqSf+8apE3FcldBLPyReMWgmoAwg1afldSg
 je5k8MJiItjBMcvqJVDfQ==
UI-OutboundReport: notjunk:1;M01:P0:puZpDWhGnzk=;hSTCn9ie3/knSyYDBcanBm2RNHd
 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
 ==
Subject: Re: [Buildroot] [PATCH v3 01/16] package/python-setuptools: bump to
 version 84.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 21.10.26 um 22:33 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thank you. I'm going to send a follow-up to 
make the dependency in U-Boot optional.

Best regards,
Fiona

> ---
> Changes v2 -> v3:
>    - Bump to version 84.2.1.
> ---
>   package/python-setuptools/python-setuptools.hash | 4 ++--
>   package/python-setuptools/python-setuptools.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index d0ed270e9c..16b4cf7bb6 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools/json
> -md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
> -sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
> +md5  251cbfc8f83414155e0e595cc4cffdd2  setuptools-84.2.1.tar.gz
> +sha256  3ff8b3b5492a0aa66960f4419365a86b84e013070d4313e4d4a6894f5d64d6bc  setuptools-84.2.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index e013000c57..a74db0e592 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 80.9.0
> +PYTHON_SETUPTOOLS_VERSION = 84.2.1
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/70/b3/c19426f783614d625699a4b247faf628ea9ab1db228674491767b417f9e1
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
