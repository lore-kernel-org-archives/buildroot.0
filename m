Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870C9E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ABBD80503;
	Fri, 27 Dec 2024 14:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DynJaz6N8Mt3; Fri, 27 Dec 2024 14:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 677AF80BF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677AF80BF6;
	Fri, 27 Dec 2024 14:38:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 464B9E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26E2880E60
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xXfQFlRAfkg for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A16B480BF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A16B480BF6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A16B480BF6
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:38:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 786D260129;
 Fri, 27 Dec 2024 15:38:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:38:40 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:38:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20241223153701.1838975-1-james.hilliard1@gmail.com>
References: <20241223153701.1838975-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a1ac6353dd2d01783471541855d6bdd6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310322;
 bh=25FhdOisGMRhxOTjPAsvArvQFVjrC3DGsI6E19S9sL4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sZ32Yeg6CQsYP/+GNTSPQrdsr/vIpEnsxSqNDnXiylGKdOoMfPNBBeiG8V03RFA/o
 AR5/5DFrAe+tNegH3mVq8OyMupyqS4ibPjgEG7ZR3PkHOnndW/DNYsu7yOSUSI1Qn8
 oOIOMEP7uLGG56HDJGvclssaT4tK8Lf1g41W2rheStkVqO5du3QhDwk6dHP6MYX+cw
 KNQHHSPaLbFdmpTMKUZbvb0GHwG5GChP9CEJZubrVj8QhOI+P/QhIJadhidV4jI9tT
 eTNKP5G3247mT1A4hqcToBElDsT2F47DZ1xxWnBPWLfiRmnipplc6cEJazbIjbSL/Z
 Dzd7SFNU+Stjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sZ32Yeg6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.86
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/12/2024 16:37, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-boto3/python-boto3.hash | 4 ++--
>  package/python-boto3/python-boto3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-boto3/python-boto3.hash 
> b/package/python-boto3/python-boto3.hash
> index c274da5540..783a056312 100644
> --- a/package/python-boto3/python-boto3.hash
> +++ b/package/python-boto3/python-boto3.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/boto3/json
> -md5  ec76b10d3c22a3ff81420a3d443c3492  boto3-1.35.57.tar.gz
> -sha256  
> db58348849a5af061f0f5ec9c3b699da5221ca83354059fdccb798e3ddb6b62a  
> boto3-1.35.57.tar.gz
> +md5  5f616b5314958f132a674ee7e68608f2  boto3-1.35.86.tar.gz
> +sha256  
> d61476fdd5a5388503b72c897083310d2329ce088593c4332b571a860be5d155  
> boto3-1.35.86.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  
> LICENSE
> diff --git a/package/python-boto3/python-boto3.mk 
> b/package/python-boto3/python-boto3.mk
> index d0984f9f24..c8df598b46 100644
> --- a/package/python-boto3/python-boto3.mk
> +++ b/package/python-boto3/python-boto3.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_BOTO3_VERSION = 1.35.57
> +PYTHON_BOTO3_VERSION = 1.35.86
>  PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
> -PYTHON_BOTO3_SITE = 
> https://files.pythonhosted.org/packages/c5/73/fb880ce301129a7116ff47b1aab1ca7427c7d63a163676701abc168309eb
> +PYTHON_BOTO3_SITE = 
> https://files.pythonhosted.org/packages/b7/23/0fe81184d4c3c4f640288dce790c705a76263c1aa688f684ef1dbe9d4f7d
>  PYTHON_BOTO3_SETUP_TYPE = setuptools
>  PYTHON_BOTO3_LICENSE = Apache-2.0
>  PYTHON_BOTO3_LICENSE_FILES = LICENSE
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
