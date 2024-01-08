Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F46BC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 13:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FBC14195F;
	Mon,  8 Jan 2024 13:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBC14195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxEKrAu4yr-8; Mon,  8 Jan 2024 13:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEF0041705;
	Mon,  8 Jan 2024 13:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEF0041705
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B22AE1BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 13:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97A784149F
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 13:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A784149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XG6rFqDyReQ6 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 13:11:00 +0000 (UTC)
X-Greylist: delayed 440 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 08 Jan 2024 13:11:00 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7BD41705
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F7BD41705
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 13:11:00 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 589972C80CDC;
 Mon,  8 Jan 2024 14:03:38 +0100 (CET)
Message-ID: <0eb549da-1140-4071-8e58-376d9dd5f434@bubu1.eu>
Date: Mon, 8 Jan 2024 14:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240108064820.3450359-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20240108064820.3450359-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1704719018; bh=KAQVVSqfVAr3RVWCqdbkIyT20zG2l3oQFb2yS+KKe2k=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To;
 b=tLaLsuBLZy0VRYZWSaNOuYwRK1ccso/5nMtAiElDpn+ZudcZdOlsAP9j00IA/b9bd
 1aHFOLBdpuQ924zVwEpgv10GxOdDqr8AZMfPMhhCpr1dxCu9W3sUu3n+GbWpGicqnQ
 vWUtzCSos8aqcEML6TEIivP0H+yBcm8uUYhzhwr7J9cacrgZUVPY1vGNz1AtU2ss3X
 lXh/AqNxlpCJaTlenT43isiH+qYbJvdrE5QYCst957FM+QDOoK8O/y6+6pedpQXnsG
 UxjFEqlDNXbg7Yf0GZxusVyfHDQ++rpBsSXzu+qaL6WB6E6Hh0eUuFYwQIwnbiK6v+
 ubO1GbBAa7h8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=tLaLsuBL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 08.01.24 07:48, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-anyio/python-anyio.hash | 4 ++--
>   package/python-anyio/python-anyio.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
> index 1cea549bc1..e77d30249c 100644
> --- a/package/python-anyio/python-anyio.hash
> +++ b/package/python-anyio/python-anyio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/anyio/json
> -md5  58d288dd84e28e2507ff9ce7e4620010  anyio-3.7.1.tar.gz
> -sha256  44a3c9aba0f5defa43261a8b3efb97891f2bd7d804e0e1f56419befa1adfc780  anyio-3.7.1.tar.gz
> +md5  22e660fff1a584e72281f0d6a083e4e0  anyio-4.2.0.tar.gz
> +sha256  e1875bb4b4e2de1669f4bc7869b6d3f54231cdced71605e6e64c9be77e3be50f  anyio-4.2.0.tar.gz

This was introduced in this version because fastapi didn't support a 
newer version.

Fastapi 0.108.0 supports starlette 0.32 now, which supports anyio 4.2.0.
So I think these should be bumped together/in the same series?


>   # Locally computed sha256 checksums
>   sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
> diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
> index 80404ac660..32c2286157 100644
> --- a/package/python-anyio/python-anyio.mk
> +++ b/package/python-anyio/python-anyio.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ANYIO_VERSION = 3.7.1
> +PYTHON_ANYIO_VERSION = 4.2.0
>   PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
> -PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/28/99/2dfd53fd55ce9838e6ff2d4dac20ce58263798bd1a0dbe18b3a9af3fcfce
> +PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/2d/b8/7333d87d5f03247215d86a86362fd3e324111788c6cdd8d2e6196a6ba833
>   PYTHON_ANYIO_SETUP_TYPE = setuptools
>   PYTHON_ANYIO_LICENSE = MIT
>   PYTHON_ANYIO_LICENSE_FILES = LICENSE

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
