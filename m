Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E95C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBEF0415E3;
	Fri,  2 May 2025 11:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqWzkPyKbgbR; Fri,  2 May 2025 11:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03FFB416CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FFB416CE;
	Fri,  2 May 2025 11:11:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC5DFEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 923EF61151
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqZb7whknIqF for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9297A60E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9297A60E49
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9297A60E49
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A08CB1C0FC1; Fri,  2 May 2025 13:11:12 +0200 (CEST)
Message-ID: <3e2303f9-405a-4bc0-9a23-7bfd9afdef20@rnout.be>
Date: Fri, 2 May 2025 13:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250217114853.1883872-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250217114853.1883872-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184272; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3pNw36M3EkgclF5VeHmRfa6ztXaBL5McTZH4GRoQhes=;
 b=LjT2oiCaiqkK/YGScGMu3i2NMFe+dTaqWZeC3Pjdx6F9QWjiA/JFK4nKUvYDaBlCrRECEA
 3Tk1IYTW6JJNFuRSXa+D1mTqskuFPmtbnUONhWsqPmFxW9liSXsZvvA4db7TSlubmKJaH1
 8YzwzeyruIGCCrfxrTlHqQgdqzwAJDhG5kII07Ha3ojjTT3ts2pnM4gCCz9FNSF+PuCyb8
 2Fb5nTGoPH4/vB2qfnvukDfaQv2iH6QgKRQN5dNXC603m/vrMb+9h3hX4tt/27uZ64eJen
 tcLv2xusypRkxYU2pCqPNM9SamV5ZFTNqUizMl2tOSRs4FDhEj3dcONr2XqRkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LjT2oiCa
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 44.0.1
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



On 17/02/2025 12:48, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-cryptography/python-cryptography.hash | 2 +-
>   package/python-cryptography/python-cryptography.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
> index aa7e16a043..909b702d16 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after vendoring
> -sha256  09a765af8da172785de52631fe6c626508fdc8e451b7fb01d52f58b7841a813b  python-cryptography-44.0.0-cargo2.tar.gz
> +sha256  85cb9d02cf5237881d0b62abab086acd1149d972f6f8c5aece4f8e10a37c944c  python-cryptography-44.0.1-cargo2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
>   sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index 9ae1fdbd83..fd2c3d7a50 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CRYPTOGRAPHY_VERSION = 44.0.0
> +PYTHON_CRYPTOGRAPHY_VERSION = 44.0.1
>   PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> -PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/91/4c/45dfa6829acffa344e3967d6006ee4ae8be57af746ae2eba1c431949b32c
> +PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/c7/67/545c79fe50f7af51dbad56d16b23fe33f63ee6a5d956b3cb68ea110cbe64
>   PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
>   PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
>   PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
