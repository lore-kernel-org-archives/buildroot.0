Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C033BE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 10:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F836402FA;
	Fri, 10 Jan 2025 10:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivdLDDTlkWbs; Fri, 10 Jan 2025 10:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F77540534
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F77540534;
	Fri, 10 Jan 2025 10:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E889940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 10:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CCDF80D8C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 10:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdeh-rNjcZZe for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 10:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 656E680DCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656E680DCA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 656E680DCA
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 10:49:10 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E45D32C83834
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:49:07 +0100 (CET)
Message-ID: <30c31a56-1853-47f3-8545-fdd92ed5cc65@bubu1.eu>
Date: Fri, 10 Jan 2025 11:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250109212235.2403294-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20250109212235.2403294-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1736506148; bh=CW/ooQpRudNHJ6WA/C9yE4qXPHoI2N0rEkMccOuu0BE=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=VheZ+ybAYqnNWl74CJ+37YKvbKm3nNm5qkSu8qimvXgwiU5XQq3vMFL7BKzTUFJPl
 uAT70igRSu3mpIb1nNXuR3DPMjgUQcVgjrKEbzmP2lRdJRFVnoe65pTO6red8IHc7v
 n7DiBuKWY4mHEZnEYyaAkUr3UCZTU2GsmNR4ja0j65J4vnAUGcbpNjzx6+QFRDQbwX
 ueEeXABed+F3mbyoJrk9PP/W/XP4PeqJH8tHlwhMrUjBCofOU8IfYfb0y76tAFdMuu
 jkJUfZcocxOLGW7cObpQxHGs54SqmlMEMuEgUATjiY7FuQ8sNHTOcGu8xBM6RLX9hF
 HPtLCTAHFDvJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=VheZ+ybA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-immutabledict: bump to
 version 4.2.1
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



On 09.01.25 22:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/python-immutabledict/python-immutabledict.hash | 4 ++--
>   package/python-immutabledict/python-immutabledict.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-immutabledict/python-immutabledict.hash b/package/python-immutabledict/python-immutabledict.hash
> index 8232bc6e0e..1dd4a79597 100644
> --- a/package/python-immutabledict/python-immutabledict.hash
> +++ b/package/python-immutabledict/python-immutabledict.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/immutabledict/json
> -md5  6796be00860cc5cf45ae839b9ed2de52  immutabledict-4.2.0.tar.gz
> -sha256  e003fd81aad2377a5a758bf7e1086cf3b70b63e9a5cc2f46bce8d0a2b4727c5f  immutabledict-4.2.0.tar.gz
> +md5  ac3ce87a7507d3e7d44a24a6b6bdb4a7  immutabledict-4.2.1.tar.gz
> +sha256  d91017248981c72eb66c8ff9834e99c2f53562346f23e7f51e7a5ebcf66a3bcc  immutabledict-4.2.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  347f918d37d4e0556a0695d34b9fb87fa9bbe808d54949851789c6c1fc91c61f  LICENSE
> diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
> index 99089f0d6a..902352a5d0 100644
> --- a/package/python-immutabledict/python-immutabledict.mk
> +++ b/package/python-immutabledict/python-immutabledict.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_IMMUTABLEDICT_VERSION = 4.2.0
> +PYTHON_IMMUTABLEDICT_VERSION = 4.2.1
>   PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
> -PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/55/f4/710c84db4d77767176342913ac6b25f43aaed6d0a0bdb9168a8d2936d9c7
> +PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/e0/c5/4240186fbabc58fba41bbe17c5f0cd37ffd4c0b85a5029ab104f946df175
>   PYTHON_IMMUTABLEDICT_SETUP_TYPE = poetry
>   PYTHON_IMMUTABLEDICT_LICENSE = MIT
>   PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
