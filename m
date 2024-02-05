Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AB8C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAD5A40162;
	Mon,  5 Feb 2024 17:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAD5A40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MbDPPtysSMwk; Mon,  5 Feb 2024 17:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 957354018B;
	Mon,  5 Feb 2024 17:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 957354018B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4871BF285
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432D741903
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 432D741903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdKHgW5JiVEd for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:59:50 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 114B141722
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114B141722
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E03BB2C800D1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:59:47 +0100 (CET)
Message-ID: <193a6600-b432-4f26-a265-fbeea0b72a34@bubu1.eu>
Date: Mon, 5 Feb 2024 18:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240205164615.510688-1-james.hilliard1@gmail.com>
 <20240205164615.510688-2-james.hilliard1@gmail.com>
In-Reply-To: <20240205164615.510688-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707155987; bh=VWEpRu4vigO6wqTU5oo9XFFq7VauzcRWp3f7O/wX+RQ=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=iHxW0jtC3y3BLVG/443lPy8OrhZ4BUHui6Pj/q/DeLEaEXO3xe6PyU1YZe5wPjDOj
 v0xo6nrTPn0y9AhuiT0U0CCw+Vn2MPL2rMW7/QRU2SwBCpU3gxxyP/QdXo8JjhiGO9
 yS/ESE3SXafxMwsGa35X7RaomnBCLfTKlqxLlghv/qNUWtHQCjhKWDS5SgLq9roz7/
 AAd9Dvffy+LPMKnMkjaYKVTcSTwlCozAZ3hiiDEH7+eLEkfNiEwcp4ztpy5ZUolT/1
 fLJkSkmFfxliB2qRg3ySZUMQCFLGfsAehyDAmG1M/F0vCQPLy/NZSm1bNjQf+OrEFC
 3sQQI58I7wUcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=iHxW0jtC
Subject: Re: [Buildroot] [PATCH 2/2] package/python-fastapi: bump to version
 0.109.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 05.02.24 17:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-fastapi/python-fastapi.hash | 4 ++--
>   package/python-fastapi/python-fastapi.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index 3dc1578cb7..c16b7d22de 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
> -sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
> +md5  b48191c0322fb5479773925af005b2c1  fastapi-0.109.2.tar.gz
> +sha256  f3817eac96fe4f65a2ebb4baa000f394e55f5fccdaf7f75250804bc58f354f73  fastapi-0.109.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index dc6d919926..a2191c73b7 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FASTAPI_VERSION = 0.105.0
> +PYTHON_FASTAPI_VERSION = 0.109.2

This misses dropping the anyio dependency, I send a patch that includes 
this: 
https://patchwork.ozlabs.org/project/buildroot/patch/170715586410.13905.2351857620201846100-0@git.sr.ht/

>   PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/01/d5/33a8992fe0e811211cd1cbc219cefa4732f9fb0555921346a59d1fec0040
>   PYTHON_FASTAPI_SETUP_TYPE = pep517
>   PYTHON_FASTAPI_LICENSE = MIT
>   PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
