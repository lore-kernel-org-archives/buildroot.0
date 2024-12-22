Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8B3E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ADAB605F9;
	Sun, 22 Dec 2024 14:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id debaKp8LyIZF; Sun, 22 Dec 2024 14:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD3F60606
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD3F60606;
	Sun, 22 Dec 2024 14:13:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B02A6D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD0D80C6D
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTx0E9u5-5_S for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 914DF80BFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 914DF80BFE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 914DF80BFE
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:13:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5F4A96012F;
 Sun, 22 Dec 2024 15:13:39 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41734])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:13:39 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:13:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20241219023155.286991-1-james.hilliard1@gmail.com>
References: <20241219023155.286991-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4acd6cf1e2b0d2faaaa2c1261158e9cf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876821;
 bh=RN9tD58jt2AIS4u9N0NR3FOCdn0e5+GKly1Dmir/+VQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZOwhoXHzchgnvNcL6xVBBTJwYuX+5dw9IsfMCnD9TOFuQKhIgt0cPCjvlCr3aAsmp
 FwLzBTYfR27G4iQbWiWGbx+kr0lp/Vf/m4vwAha7Yv0Bp2/7L8GG/ar59v+zJzZGWX
 mzBj0eCzl6M7PCjJnky7w9HIwWi5oEzBGmevA+rQjbnOBBUsOxvy/GYaD3Ec4W7hLG
 huz/4h7HbryQjN6XEMKYuxS95ZEb7lwzxFVv3A9rTZXJ+z2XHuUqCMXMxN3yXpuAsk
 dtwBUouFt5psrHbBDb1d0Ujxb/mrPVu2RckDXQpGcEXOQFJ+epj5fB3dyzDE2m/JPR
 Dv2nMWxFuxfZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZOwhoXHz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 2.19.2
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

On 19/12/2024 03:31, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
>  package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash 
> b/package/python-sentry-sdk/python-sentry-sdk.hash
> index 6243632685..5d65087a6d 100644
> --- a/package/python-sentry-sdk/python-sentry-sdk.hash
> +++ b/package/python-sentry-sdk/python-sentry-sdk.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
> -md5  d68e388f9a261c00515e0f758303240f  sentry_sdk-2.18.0.tar.gz
> -sha256  
> 0dc21febd1ab35c648391c664df96f5f79fb0d92d7d4225cd9832e53a617cafd  
> sentry_sdk-2.18.0.tar.gz
> +md5  235bf9f6e317e809673bedf9dd5d5c4f  sentry_sdk-2.19.2.tar.gz
> +sha256  
> 467df6e126ba242d39952375dd816fbee0f217d119bf454a8ce74cf1e7909e8d  
> sentry_sdk-2.19.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  
> LICENSE
> diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk 
> b/package/python-sentry-sdk/python-sentry-sdk.mk
> index e2cbdcf405..0ccfd7ecd3 100644
> --- a/package/python-sentry-sdk/python-sentry-sdk.mk
> +++ b/package/python-sentry-sdk/python-sentry-sdk.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_SENTRY_SDK_VERSION = 2.18.0
> +PYTHON_SENTRY_SDK_VERSION = 2.19.2
>  PYTHON_SENTRY_SDK_SOURCE = 
> sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
> -PYTHON_SENTRY_SDK_SITE = 
> https://files.pythonhosted.org/packages/24/cc/0d87cc8246f52d92228aa6718a24e1988a2893f4abe2f64ec5a8bcba4185
> +PYTHON_SENTRY_SDK_SITE = 
> https://files.pythonhosted.org/packages/36/4a/eccdcb8c2649d53440ae1902447b86e2e2ad1bc84207c80af9696fa07614
>  PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
>  PYTHON_SENTRY_SDK_LICENSE = MIT
>  PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
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
