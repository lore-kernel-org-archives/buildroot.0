Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A424BCCD184
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 08:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DBA40AA3;
	Fri, 17 Oct 2025 08:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPkVYsU5hEoZ; Fri, 17 Oct 2025 08:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCA840AA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DCA840AA5;
	Fri, 17 Oct 2025 08:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 365F0EC
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 08:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C75F812BE
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 08:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu2t_ghDx4gS for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 08:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08C44812BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C44812BD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08C44812BD
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 08:11:19 +0000 (UTC)
Received: from [192.168.243.30] (unknown [93.240.174.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B6B352C8398D;
 Fri, 17 Oct 2025 10:11:17 +0200 (CEST)
Message-ID: <30d188b1-5a62-49d3-bc2c-f7c26d3c560e@bubu1.eu>
Date: Fri, 17 Oct 2025 10:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20251017080920.28339-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20251017080920.28339-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760688677; bh=Wu5tcDW0x7IM7Nnacatbxy8GVrGpJFcoPHTVFWD7ynI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Pq2SKc139syqg2uKd50JFIwdjmKMznkscccvTzkl/N2V7XwQfe08o8w+pNDIgajag
 bPYf458rur/HrfSNf4L70KUA0lUSTivkqXJv9hXnH4NYeyeFOK768bRkf63hlRswCS
 djcPThp5zhV1DNRaeC63lTSbVsQ6y98UlWUZWyyZbHqEOkmJOvxsS1l9Fsty1DOMSZ
 eoOSUpEiy5WG1i63MASXLDM2mRUdyiuNnAIPkn9nZSONnbUW5Fc3xytnOgOb+alpMG
 /U9rYysyI14BB84fkHRMwBRfz6ira0K5Cjdp7Hkm+orbV/TH/ishytwzqawqqPTNto
 vqPCWvUMQ1x8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Pq2SKc13
Subject: Re: [Buildroot] [PATCH] package/python-uvloop: bump to v0.22.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 10/17/25 10:09, Marcus Hoffmann via buildroot wrote:
> Changelog: https://github.com/MagicStack/uvloop/releases/tag/v0.22.0

The commit title should say 0.22.1, but the release is identical to 
0.22.0, so I linked to that changelog here.

> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   package/python-uvloop/python-uvloop.hash | 7 +++----
>   package/python-uvloop/python-uvloop.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
> index 24111e759b..e6eb188739 100644
> --- a/package/python-uvloop/python-uvloop.hash
> +++ b/package/python-uvloop/python-uvloop.hash
> @@ -1,6 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/uvloop/json
> -md5  adedf20cf065ff49a96813b783ec1d29  uvloop-0.21.0.tar.gz
> -sha256  3bf12b0fda68447806a7ad847bfa591613177275d35b6724b1ee573faa3704e3  uvloop-0.21.0.tar.gz
> +md5  3fdd58ac1b7c2a520ed05e3151a64515  uvloop-0.22.1.tar.gz
> +sha256  6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f  uvloop-0.22.1.tar.gz
>   # Locally computed sha256 checksums
> -sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
> -sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
> +sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  vendor/libuv/LICENSE
> diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
> index fbdf74769e..419ee33062 100644
> --- a/package/python-uvloop/python-uvloop.mk
> +++ b/package/python-uvloop/python-uvloop.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_UVLOOP_VERSION = 0.21.0
> +PYTHON_UVLOOP_VERSION = 0.22.1
>   PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
> -PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/af/c0/854216d09d33c543f12a44b393c402e89a920b1a0a7dc634c42de91b9cf6
> +PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7
>   PYTHON_UVLOOP_SETUP_TYPE = setuptools
>   PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
>   PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
