Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEBCC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 12:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 183B04054C;
	Sun,  4 Jan 2026 12:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WyhGB6NSZut; Sun,  4 Jan 2026 12:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D8E140553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767528861;
	bh=44OHdpJmXr1kywcExDAHXuI1BteJOpOKFlhg/kNUFRo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kDTM5kx21W3Teg8QjSM3cMSucO6v+v7tJj7+bPltpGEy73VDb8d6rpxpAyjAShIe9
	 utSQEBPnsD3s0p9jd9bJZu2G5FUr5EllJ8waB1sroHvHIu4Sb3z3JG0rJnQRLPlrT8
	 NSGGvA371RlzsXVyhmlBx5+rKnqWblqGPqDOcNegZDFrVZW7vSS7rbbJStCm5VwNZp
	 nGVQ0Z5DCPpvnDXHCwax7Rh3K2GQgenCuOHef1DGpv8ZABFNwY4wKOgRB11C7pTXH9
	 BfFaf5NDtGaUcKOR4dvz3rvJe4uyQFP+UiZr0V+iwupj8JAfSfYrbgoxJzZaolGqyL
	 B2rs9X759FBqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D8E140553;
	Sun,  4 Jan 2026 12:14:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA1A229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01BF780E70
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-fOXoAZMoxX for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 12:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0D2B80E6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0D2B80E6F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0D2B80E6F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:14:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C9FB160129;
 Sun,  4 Jan 2026 13:14:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 13:14:13 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 13:14:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260102002626.2690432-2-james.hilliard1@gmail.com>
References: <20260102002626.2690432-1-james.hilliard1@gmail.com>
 <20260102002626.2690432-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <bec9ecc1bdd6aba80a0c7a7b87eec96c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767528856;
 bh=73+FxmRIEhlte58ELkau/78Gr/HskpQkfGnPQN+jh1U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aZiqqnD1Q+9vUc0i6basWXxW1Z9ZaG6kM0q8pQU9zRjqSSYkH/iyNRMr+0eov5/NZ
 YuD+jVCWWXtnUACcl+eETn+KVFz6aWzyfV1yKUODFQQoZ5N/qt3dRFuMNm/JynCvWy
 ei+xH+u62b8Efarltw9PybvG1MPx3oE7DxV0N6C5ZQnVZwjIQbjWBMBISuJhxPNZMI
 QKA7hKbjYrkI5uXSuDAicw4QigJt8ygruMTv0DfR6x2pr+ySIOGD/KqM04o8EQXBj4
 w6XNfxmrjFk15F3+cmLb3mClLaGuaTmQznXbrRCdbnNQFNg/ien0u20xxWnU1VSOty
 +M6CS+9X3PyeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aZiqqnD1
Subject: Re: [Buildroot] [PATCH 2/2] package/python-mypy: bump to version
 1.19.1
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

Hi James,

Thanks for the patch.

On 02/01/2026 01:26, James Hilliard wrote:
> License hash changed due to addition of base64 license which
> is BSD-2-Clause:
> https://github.com/python/mypy/commit/8f922b3d879f31e4c52c1c643de70e27b5720654
> 
> Add new python-librt build/runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[...]
> diff --git a/package/python-mypy/python-mypy.mk 
> b/package/python-mypy/python-mypy.mk
> index ba07ef5b9c..4b02753978 100644
> --- a/package/python-mypy/python-mypy.mk
> +++ b/package/python-mypy/python-mypy.mk
> @@ -4,19 +4,21 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_MYPY_VERSION = 1.18.2
> +PYTHON_MYPY_VERSION = 1.19.1

This new version seems to break the python-charset-normalizer
package. You can reproduce the issue with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER=y
EOF
make olddefconfig
make python-charset-normalizer

Which shows the error:

ERROR Missing dependencies:
	mypy<=1.18.2,>=1.4.1

Could you have a look to fix this issue before we merge this
series, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
