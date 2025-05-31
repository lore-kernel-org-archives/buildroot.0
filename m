Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D49FC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFBEB409E8;
	Sat, 31 May 2025 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJwU9oE3NYsd; Sat, 31 May 2025 16:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB1C40A4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB1C40A4E;
	Sat, 31 May 2025 16:37:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9D74235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3D0E40A31
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMZiEFd0szUr for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03D43409D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D43409D0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03D43409D0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:37:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE8B61C00B7; Sat, 31 May 2025 18:37:47 +0200 (CEST)
Message-ID: <ffe8580e-bd4f-4451-b1a8-40319399cfb1@rnout.be>
Date: Sat, 31 May 2025 18:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250317215614.3052928-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250317215614.3052928-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709468; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kf8gcZPZW8gHykyZGE6KyRvZEgjOLLw+Wr1UU7/RBtE=;
 b=PNEjj83xcB9eq2kPiJVUTBrSXxLhDBgv6QvDU8CVszvBv4i/cW8/NApfmztZfDzCh9Mold
 3IzrNOsDgLD9Jt/voBrF9UshKbRj3PsyWR/MimyxJkqShEPM2Ep6y8QgNP276rd0J/FM3p
 2A0qX908bGjP6K/UtN1JqHSM/2mKNDIlHYp30Vfg3j8XSl2+6WJwNof5DfBgUP3fOyuuhs
 h/yxyo8O7ZRsvKKRNAdWSIvNrhG8Auh9zbCmpETr0TCM3coiey8RXiQQixZu+8MLnJQGiA
 GhHTASBuJo3SPbItK472vqeTOd9+4BTrKLCvGy+IkyWBRqvo975fUkOWO+V7HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=PNEjj83x
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to
 version 3.11.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2025 22:56, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-flit-core/python-flit-core.hash | 4 ++--
>   package/python-flit-core/python-flit-core.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
> index f8e71bf398..80f8d915fe 100644
> --- a/package/python-flit-core/python-flit-core.hash
> +++ b/package/python-flit-core/python-flit-core.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/flit_core/json
> -md5  a3381dd58e23e9826c5199b1f70318b0  flit_core-3.10.1.tar.gz
> -sha256  66e5b87874a0d6e39691f0e22f09306736b633548670ad3c09ec9db03c5662f7  flit_core-3.10.1.tar.gz
> +md5  6d677b1acef1769c4c7156c7508e0dbd  flit_core-3.11.0.tar.gz
> +sha256  6ceeee3219e9d2ea282041f3e027c441597b450b33007cb81168e887b6113a8f  flit_core-3.11.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
> diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> index bfa80af3e3..e46453443c 100644
> --- a/package/python-flit-core/python-flit-core.mk
> +++ b/package/python-flit-core/python-flit-core.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FLIT_CORE_VERSION = 3.10.1
> +PYTHON_FLIT_CORE_VERSION = 3.11.0
>   PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
> -PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/d5/ae/09427bea9227a33ec834ed5461432752fd5d02b14f93dd68406c91684622
> +PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/bc/18/b9b81cab2b8f63e6e7f72e1ba2766a0454fcd563e7a77b8299cb917ba805
>   PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
>   PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
>   PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
