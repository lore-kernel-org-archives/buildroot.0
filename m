Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A129AE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7247980ACB;
	Fri, 27 Dec 2024 14:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdvMbMdE8-SC; Fri, 27 Dec 2024 14:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FBF980B0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBF980B0F;
	Fri, 27 Dec 2024 14:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF8DFF1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAA1680BD1
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmZZFzqz_Nfr for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0C4A80ACB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C4A80ACB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0C4A80ACB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:41:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C0D1619F5C6;
 Fri, 27 Dec 2024 15:41:35 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:41:35 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:41:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223163227.1869650-1-james.hilliard1@gmail.com>
References: <20241223163227.1869650-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a576ee73147413b6cdad908e5edc6724@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310496;
 bh=Yg5syDizK0kv7NJW/Eilb4SLebMejbR1kCWhVQ301zQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B65czycsueIlTYVOhk53oBNGhbsZOxV5CL3OKYIm/XOmAWriVnWoVmfA+ZDQnDvxU
 N9UY0+RTuE42SUgI7RfJfYn1dgoju1PHOXLWaYwhwQ6jd2ZOrM6XGp0MDatTWKkn2S
 Tk2tOsxB4JVLGHjtbe4wiz9b+v1mQCumFuVVET23rSurNnyo5wKNNyntP5jnbwmLx7
 DiGKnog00E5GVTlJoMx/VDrXBF5Ixv8kSXMpOhbXh0x3DNmBtDOuJ6IqGS9gls9eEe
 8CDcQi7aSk2DFcZEUvhuUW7tFl/f0mdDnPugw7ybijj4qLsesE+x6fN2DIRBwMqbm6
 aPfxKzVLUMU3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B65czycs
Subject: Re: [Buildroot] [PATCH 1/1] package/python-engineio: bump to
 version 4.11.1
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

On 23/12/2024 17:32, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-engineio/python-engineio.hash | 4 ++--
>  package/python-engineio/python-engineio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-engineio/python-engineio.hash 
> b/package/python-engineio/python-engineio.hash
> index ecf4d2898e..427e6cea12 100644
> --- a/package/python-engineio/python-engineio.hash
> +++ b/package/python-engineio/python-engineio.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-engineio/json
> -md5  3e45a23dd8df2d611681cb6970c1fd27  python_engineio-4.10.1.tar.gz
> -sha256  
> 166cea8dd7429638c5c4e3a4895beae95196e860bc6f29ed0b9fe753d1ef2072  
> python_engineio-4.10.1.tar.gz
> +md5  cfed3d8b399a2a9889ee2e2371e5e03f  python_engineio-4.11.1.tar.gz
> +sha256  
> ff8a23a843c223ec793835f1bcf584ff89ce0f1c2bcce37dffa6436c6fa74133  
> python_engineio-4.11.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  
> LICENSE
> diff --git a/package/python-engineio/python-engineio.mk 
> b/package/python-engineio/python-engineio.mk
> index 49d5e298fe..99a7dae0a3 100644
> --- a/package/python-engineio/python-engineio.mk
> +++ b/package/python-engineio/python-engineio.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_ENGINEIO_VERSION = 4.10.1
> +PYTHON_ENGINEIO_VERSION = 4.11.1
>  PYTHON_ENGINEIO_SOURCE = 
> python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
> -PYTHON_ENGINEIO_SITE = 
> https://files.pythonhosted.org/packages/9e/d2/b985b0affc5944620e1f812969322f40204f75297c5087fc4cdd44f1a14e
> +PYTHON_ENGINEIO_SITE = 
> https://files.pythonhosted.org/packages/17/54/39e4c942296943cc79a1fd7d744a1a10ba2fc3af59293f26a8bd48c2aa74
>  PYTHON_ENGINEIO_SETUP_TYPE = setuptools
>  PYTHON_ENGINEIO_LICENSE = MIT
>  PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
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
