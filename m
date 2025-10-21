Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDCACCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 07:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 409BE60847;
	Tue, 21 Oct 2025 07:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-Hv465iXV6W; Tue, 21 Oct 2025 07:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2326081F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A2326081F;
	Tue, 21 Oct 2025 07:40:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97243277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 07:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 885DE6081F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 07:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MivUmU1HX5W for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 07:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF8DF60819
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF8DF60819
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF8DF60819
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 07:40:46 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E518A2C80CE3;
 Tue, 21 Oct 2025 09:40:43 +0200 (CEST)
Message-ID: <2238c48e-068e-4215-8c19-c41f1a17998e@bubu1.eu>
Date: Tue, 21 Oct 2025 09:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>
References: <20251015071659.CE0248710B@busybox.osuosl.org>
Content-Language: en-US
In-Reply-To: <20251015071659.CE0248710B@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761032444; bh=jQSMc7E2MEItpDHZAf7vEFh+W4qt4MbQxwTspmJaA/0=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=QSbZ3LmJvzBCO/LRs6wxJWnW8vScVn4jD61OR5kBKH3EX8u3Wl9ZZ1P1aR4sVW8/A
 CIy7nLWx3v5WSlGYk67uxthQZ29xrPx69EDGDLQ0caBbAAlr1MRw6gWDGmRgu4iO5X
 upPNCIoYxhO8kCmXxcIu22FIxj9KdALiqQ0o2HLLo9y4y5dWWyqfTh8PmyXEUn6PeS
 icm/Yu8Iq2WL4UYHZBuWvSVzSyEBDOSeFwvX0dNHGaUwepSMbJZ/MiARB/OBO6VSLh
 JdyVBxsgBEcEJWBWF0GI2vb5u7uM/bwnVk34p5A9jN/KkA7xBsexjIFCOcSReUKL4y
 xbJu8YeWfvVPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=QSbZ3LmJ
Subject: Re: [Buildroot] [git commit] package/python-wrapt: bump version to
 1.17.2
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

Hi,

On 10/15/25 08:41, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=1519659b42323ee0dccd3b4642258b756a968396
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

For the record: the commit message is off by one version here and this 
should have said 1.17.3.

> ---
>   package/python-wrapt/python-wrapt.hash | 4 ++--
>   package/python-wrapt/python-wrapt.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
> index 199de265a5..ae1fb94a2b 100644
> --- a/package/python-wrapt/python-wrapt.hash
> +++ b/package/python-wrapt/python-wrapt.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/wrapt/json
> -md5  f4db93e73e5c70a59955f0ec162d585d  wrapt-1.17.2.tar.gz
> -sha256  41388e9d4d1522446fe79d3213196bd9e3b301a336965b9e27ca2788ebd122f3  wrapt-1.17.2.tar.gz
> +md5  5e7d9b1296ef5dc87339acc951a52d18  wrapt-1.17.3.tar.gz
> +sha256  f66eb08feaa410fe4eebd17f2a2c8e2e46d3476e9f8c783daa8e09e0faa666d0  wrapt-1.17.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  5974efbbc8b626b2050810d63c3a907ee21c92bf64b3740fc623ad05eb3448ab  LICENSE
> diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
> index 9048f7010e..d1871a7e2e 100644
> --- a/package/python-wrapt/python-wrapt.mk
> +++ b/package/python-wrapt/python-wrapt.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_WRAPT_VERSION = 1.17.2
> +PYTHON_WRAPT_VERSION = 1.17.3
>   PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
> -PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/c3/fc/e91cc220803d7bc4db93fb02facd8461c37364151b8494762cc88b0fbcef
> +PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/95/8f/aeb76c5b46e273670962298c23e7ddde79916cb74db802131d49a85e4b7d
>   PYTHON_WRAPT_SETUP_TYPE = setuptools
>   PYTHON_WRAPT_LICENSE = BSD-2-Clause
>   PYTHON_WRAPT_LICENSE_FILES = LICENSE


Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
