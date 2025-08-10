Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFFDC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6968860F35;
	Sun, 10 Aug 2025 15:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pstv720IM9Ey; Sun, 10 Aug 2025 15:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89A2960D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89A2960D50;
	Sun, 10 Aug 2025 15:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB69154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C11240AB5
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPou2ZUFhgkJ for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3ECE040A5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ECE040A5D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ECE040A5D
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:15:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7C2732003F7;
 Sun, 10 Aug 2025 17:15:29 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Aug 2025 17:15:29 +0200
MIME-Version: 1.0
Date: Sun, 10 Aug 2025 17:15:29 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250809223118.2306727-1-fiona.klute@gmx.de>
References: <20250809223118.2306727-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <d5d036f00fd07fa6cd7f063141dc4468@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754838931;
 bh=2xhGgZ+Z2L+5/JKzFybzyuYl5+nsepDe+jQ8bxs8yJw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gswiqTmrDxHK+J/LWFvPzX7soWJsgutyTD0Zq5ypl4kTdYgnYUqQnASIaycCgj258
 speHz/aU4YFOUdu/XSinRlO8Owov8W/LBNOoIsFXXXlli/zqY0ocF19/PbJcmYLb3P
 ZJ0LuFqNQytJJhNqekVI518+0AbnfwGEezKXfB2V1eddVEPpdyE5iwHUCBCCgFgw05
 FCqCURjlI6xz9/MpQY1Oc+i4+HLHlUCUnB49vV6s9qLt60psGYqEE08b1OUlR6qgL5
 8HRz01LtXuGHgA6duei3fDrcWpKJlQrsElTbI8MqWQXIa54lycFwpmC8B+NZnd1kt8
 bGKI3cWxjBRBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gswiqTmr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyroute2: bump to
 version 0.9.4
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

Hi Fiona,

Thanks for the patch!

On 10/08/2025 00:31, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> From 0.9.1 the pyroute2 core is async, the synchronous API remains
> available as a wrapper.
> 
> Upstream changelog:
> https://github.com/svinota/pyroute2/blob/0.9.4/CHANGELOG.rst
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/python-pyroute2/python-pyroute2.hash | 4 ++--
>  package/python-pyroute2/python-pyroute2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyroute2/python-pyroute2.hash 
> b/package/python-pyroute2/python-pyroute2.hash
> index 3785c9ad7f..87402b9dbb 100644
> --- a/package/python-pyroute2/python-pyroute2.hash
> +++ b/package/python-pyroute2/python-pyroute2.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/pyroute2/json
> -md5  6699294168d3051b2897a556ceeaf6c2  pyroute2-0.8.1.tar.gz
> -sha256  
> b91f4a1f7abb9824637b1fe67e6e4a0a071d98d4a1a1b47ef792304ff3adad11  
> pyroute2-0.8.1.tar.gz
> +md5  225d6899da226df8899efcff2557204a  pyroute2-0.9.4.tar.gz
> +sha256  
> 3cbccbe1af0c2b2aeae81b327e0e91aa94c81ab19f851e74b26bef70202f3070  
> pyroute2-0.9.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  
> LICENSE.Apache-2.0
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> LICENSE.GPL-2.0-or-later
> diff --git a/package/python-pyroute2/python-pyroute2.mk 
> b/package/python-pyroute2/python-pyroute2.mk
> index fea6e43979..efe8d73f52 100644
> --- a/package/python-pyroute2/python-pyroute2.mk
> +++ b/package/python-pyroute2/python-pyroute2.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYROUTE2_VERSION = 0.8.1
> +PYTHON_PYROUTE2_VERSION = 0.9.4

With that bump doing at runtime the command:

python3 -c 'from pyroute2 import IPRoute'

fails with error:

ModuleNotFoundError: No module named '_ssl'

Maybe this package now need to select for runtime:
BR2_PACKAGE_PYTHON3_SSL=y

Could you have a look please?

Also, maybe a small runtime test could help, picking few simple
commands from:
https://github.com/svinota/pyroute2/tree/0.9.4?tab=readme-ov-file#iproute----synchronous-rtnl-api

>  PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
> -PYTHON_PYROUTE2_SITE = 
> https://files.pythonhosted.org/packages/4d/04/c9060b6cb024d05467e17ea93d3ca4bd2f3b05deb2372b7f79321640e8ad
> +PYTHON_PYROUTE2_SITE = 
> https://files.pythonhosted.org/packages/b0/5e/fc64e211cce0078555c6db98aaf14348aed527565f3c4876913a290a5b2c
>  PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
>  PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 
> LICENSE.GPL-2.0-or-later README.license.rst
>  PYTHON_PYROUTE2_SETUP_TYPE = setuptools
> --
> 2.50.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
