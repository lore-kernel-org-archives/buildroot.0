Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F44CCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8819A60FB1;
	Tue, 30 Sep 2025 19:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVRxmFQTSE7d; Tue, 30 Sep 2025 19:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919486101A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919486101A;
	Tue, 30 Sep 2025 19:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5305C111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 445C140DE1
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwwLRFM9oYwt for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7DA440DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7DA440DDD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7DA440DDD
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:10:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D055419F57B;
 Tue, 30 Sep 2025 21:10:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Sep 2025 21:10:29 +0200
MIME-Version: 1.0
Date: Tue, 30 Sep 2025 21:10:29 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250930103105.54262-1-titouan.christophe@mind.be>
References: <20250930103105.54262-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <1b787dd4f2150a41ff69dd921161ec48@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759259432;
 bh=tovC9YCOajorJFcBVgIIyoAg33sLFd1WPyb6Nto1oUE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T7OUAE1Bbj3zmeWmxwXB9a/63mlAmIm3GI5DquZT0DJ6VuP7ET4ezAhmoU1YhMV6+
 q9qCVeww6cx6RH7UpvcYOtUVJgDxKCedGhztedO+UoH3+DOasTm46zbFf694xs5sh8
 4NwHX8vkG+9fWsLYZcupxtdBA9E0uP7uEm2Gw0nHROQuiAvj2+Bqlcom8ODSnTRkDd
 NfC420QmIKDmX4n+6t9p/dli2YFG9k5J1fhql3IwJIVV7NkoNDa8kRcjjOnAuq/5AZ
 hWY/Q4nenuqswNhkhOhn7d7skbUY9EbOJuzXzo+OpNEaE/Bm82YFTkzHmGxbse9I1Q
 kee3j3WzbOJLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=T7OUAE1B
Subject: Re: [Buildroot] [PATCH] package/python-pip: security bump to v25.2
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

Hi Titouan,

Thanks for the patch.

On 30/09/2025 12:31, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> - CVE-2025-8869:
>     When extracting a tar archive pip may not check symbolic links 
> point
>     into the extraction directory if the tarfile module doesn't 
> implement
>     PEP 706. Note that upgrading pip to a "fixed" version for this
>     vulnerability doesn't fix all known vulnerabilities that are
>     remediated by using a Python version that implements PEP 706.  Note
>     that this is a vulnerability in pip's fallback implementation of 
> tar
>     extraction for Python versions that don't implement PEP 706 and
>     therefore are not secure to all vulnerabilities in the Python
>     'tarfile' module. If you're using a Python version that implements 
> PEP
>     706 then pip doesn't use the "vulnerable" fallback code.  
> Mitigations
>     include upgrading to a version of pip that includes the fix, 
> upgrading
>     to a Python version that implements PEP 706 (Python >=3.9.17,
>     >=3.10.12, >=3.11.4, or >=3.12), applying the linked patch, or
>     inspecting source distributions (sdists) before installation as is
>     already a best-practice.
>     https://www.cve.org/CVERecord?id=CVE-2025-8869
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/python-pip/python-pip.hash | 4 ++--
>  package/python-pip/python-pip.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pip/python-pip.hash 
> b/package/python-pip/python-pip.hash
> index f6b11ee26a..ad70f0da7b 100644
> --- a/package/python-pip/python-pip.hash
> +++ b/package/python-pip/python-pip.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pip/json
> -md5  c698f55e2015dc7dbb5b77c6df1cc88a  pip-25.0.tar.gz
> -sha256  
> 8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b  
> pip-25.0.tar.gz
> +md5  6d109857fa69274dacfc1d6528471eb5  pip-25.2.tar.gz
> +sha256  
> 578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2  
> pip-25.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  
> LICENSE.txt
> diff --git a/package/python-pip/python-pip.mk 
> b/package/python-pip/python-pip.mk
> index 9ffc0b66ea..42231e254c 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PIP_VERSION = 25.0
> +PYTHON_PIP_VERSION = 25.2

With this new version, it fails to download the package.

>  PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
>  PYTHON_PIP_SITE = 
> https://files.pythonhosted.org/packages/47/3e/68beeeeb306ea20ffd30b3ed993f531d16cd884ec4f60c9b1e238f69f2af

Maybe the PYTHON_PIP_SITE needs to be updated too?

>  PYTHON_PIP_SETUP_TYPE = setuptools
> --
> 2.51.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
