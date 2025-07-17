Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCEBC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C0C4172F;
	Thu, 17 Jul 2025 20:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lak8ubV9JMyd; Thu, 17 Jul 2025 20:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A57934170B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A57934170B;
	Thu, 17 Jul 2025 20:41:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8DD11A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA78741742
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2S9Jf9xf3o8a for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4C15415FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C15415FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4C15415FC
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB112B977AA4; Thu, 17 Jul 2025 22:41:28 +0200 (CEST)
Message-ID: <e413758e-f1b2-4396-81cb-83147303c56d@rnout.be>
Date: Thu, 17 Jul 2025 22:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715230116.754529-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715230116.754529-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784888; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=nk+/OCkBu5ejiC12AzsgVZWLsAab/bICRjk8gmvpNKE=;
 b=hgujVwvg9z1gJQhXYh2E13CfAL716OMq+pkJi0/EvNpxHjzmysI2UOSIHPBerDxSP9ZQg4
 +QaMr1iFjr6cAdc55jamMEqlVairIv0bSvTbrtvd1Tv1FAxDbhMkaQywRJBbQM2Ak8YRPa
 yUDzeGxDG6/cJaXeO7pmH9O69AIaU/DaBgjQQmLqnhEYLp4IGCoc0IxJxOIdol1SL3gHym
 dy/NPeSh7Rf26zApfAGa4ulx0DNRwdox99fsfMfWqem1oiRGrHtN2C3gmeror2MrUNNZPg
 Gbb+6tKUUyln61ASq+v2sLpz1891+GoNLvVcnqNKEu0JzuFct4LJlGNcvg843Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hgujVwvg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.9.1
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



On 16/07/2025 01:01, James Hilliard wrote:
> Drop no longer required host-python-tomli dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-maturin/python-maturin.hash | 2 +-
>   package/python-maturin/python-maturin.mk   | 5 ++---
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
> index baa8d4b2e6..fd7ef77adf 100644
> --- a/package/python-maturin/python-maturin.hash
> +++ b/package/python-maturin/python-maturin.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after vendoring
> -sha256  c5e19df8566f9c15b6178a6312f1d7071c7a91efb0f578151439b5fcdb517176  python-maturin-1.8.3-cargo4.tar.gz
> +sha256  344b213648e4954b157132ba8a3b5158576af7499bbd68712f42c5d314a13b40  python-maturin-1.9.1-cargo4.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
>   sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
> diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
> index af6cf44b68..313dedf114 100644
> --- a/package/python-maturin/python-maturin.mk
> +++ b/package/python-maturin/python-maturin.mk
> @@ -4,13 +4,12 @@
>   #
>   ################################################################################
>   
> -PYTHON_MATURIN_VERSION = 1.8.3
> +PYTHON_MATURIN_VERSION = 1.9.1
>   PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
> -PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/30/0b/3fd746cf5cfa3c8d7e20ea08c0dbc2c2c765ae051d0fc43d808a38bc9548
> +PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/94/f7/73cf2ae0d6db943a627d28c09f5368735fce6b8b2ad1e1f6bcda2632c80a
>   PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
>   PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
>   PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
>   PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
> -HOST_PYTHON_MATURIN_DEPENDENCIES = host-python-tomli
>   
>   $(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
