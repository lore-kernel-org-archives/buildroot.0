Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E12C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D234049E;
	Wed,  7 Feb 2024 17:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iHj5H2R5OSR; Wed,  7 Feb 2024 17:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF9DC416CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF9DC416CA;
	Wed,  7 Feb 2024 17:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8091BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A3E061452
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1D_FtkvoF6a for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1648761443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1648761443
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1648761443
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:13:38 +0000 (UTC)
Received: from [172.18.252.108] (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A0B982C83776;
 Wed,  7 Feb 2024 18:13:35 +0100 (CET)
Message-ID: <5e97bc80-0758-4685-a614-7eb9fb2f8b6b@bubu1.eu>
Date: Wed, 7 Feb 2024 18:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240205163024.500599-1-james.hilliard1@gmail.com>
In-Reply-To: <20240205163024.500599-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707326016; bh=ORWaknnpsxuYpNi3PU60oPD1KzEeq3BkK7lUPctiO08=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=G7xR9ifxPSeN3WpFZSf0M83/lPeTsUmqLMbXw1FfUYwKEDBKepAsxfDQJUSncLt3X
 0D6fqj/vntOcgEbz9xSOII5ek+jaz+jk41Qc7ihAifZZmYUhQ2ki/daOUusrbUXWum
 Cvv+lkeA7OWKsCLcaHZGWdtYATIywamodRCzHv1mgAKVDR4V0PaTyqa9rzfIM4zyhC
 V0uFKZM6X4O2tRwjDQwu2bbl/Q20FHbm8T7elUgI86dAdW/8frGElZPgId47i5AYWD
 v8JOEuHwQtFAweXNo87V/QV/qH5OWnZa6+4oejHuYvp2zG7fnxwTO9Zg+99y3EPa0+
 3vujiaH6BWhJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=G7xR9ifx
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-ruamel-yaml: bump to
 version 0.18.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05.02.24 17:30, James Hilliard wrote:
> License hash changed due to year update:
> https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - fix package hash typo > ---
>   package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
>   package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
> index 29852a51ed..b614c01d79 100644
> --- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
> +++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/rfc3987/json

This still points to the wrong package, but was wrong before.

I've resend this patch as part of 
https://patchwork.ozlabs.org/project/buildroot/list/?series=394024 as 
fixing this introduced a merge conflict.

> -md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
> -sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
> +md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
> +sha256  61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e  ruamel.yaml-0.18.5.tar.gz
>   # Locally computed sha256 checksums
> -sha256  ab837b032c5aae84503fc0c733a116a26fd272e90dc4402fa68d3c9e51aed3b0  LICENSE
> +sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  LICENSE
> diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
> index a6fed3bc2c..bbdac591ca 100644
> --- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
> +++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_RUAMEL_YAML_VERSION = 0.17.21
> +PYTHON_RUAMEL_YAML_VERSION = 0.18.5
>   PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
> -PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c
> +PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/82/43/fa976e03a4a9ae406904489119cd7dd4509752ca692b2e0a19491ca1782c
>   PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
>   PYTHON_RUAMEL_YAML_LICENSE = MIT
>   PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
