Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326C5C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CA5C40A02;
	Thu, 17 Jul 2025 20:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rc7XxXUztevM; Thu, 17 Jul 2025 20:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E75E40797
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E75E40797;
	Thu, 17 Jul 2025 20:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2231D1A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC3F60762
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohreCeDDAB0s for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C1736066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C1736066A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C1736066A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 566DCB977A8D; Thu, 17 Jul 2025 22:41:02 +0200 (CEST)
Message-ID: <ed606ebb-1303-49b7-a486-0365b6befa26@rnout.be>
Date: Thu, 17 Jul 2025 22:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715222213.733224-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715222213.733224-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784862; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=6lUuGC/oP6+Baj4T81z+uanYd9nkSVqkWsqUb9RKrnk=;
 b=BucM8rkNsJB6xEIaK+2s34Dkq9oWhstdjlOfEvVrPJbSX4xgqrlJ/pkNuQBGXzhvMBgSP+
 oW8JLY835V1IVpUWV4+JrxMWyzRHpVHJGcN2ULL22F1ru9x1sM/Dsj07Ed4INVonpmCqs3
 k+gUp0daT85+5AV9WnAUqSrqaQkQVhg0jbawamSwrf2RF9P7kHt1rA1d26A03VbZrG6nhs
 98mnI0rA/w9jw9zgVzmjs0Q0uRxgbC5SAO8tsho8Mgd8OzWpVD9wxJFiH7P869YlAKPmVz
 B/UURm9FStFhVaEgP+dumQmwXuZdb+joqQHZaJ1gMZUr6YUVi1oWwG+j8ykjng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BucM8rkN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.25.1
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



On 16/07/2025 00:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
>   package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
> index 7538056cd0..8e99e815df 100644
> --- a/package/python-tortoise-orm/python-tortoise-orm.hash
> +++ b/package/python-tortoise-orm/python-tortoise-orm.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
> -md5  4ae41f379c4ede60df7705d1c7fe71b5  tortoise_orm-0.25.0.tar.gz
> -sha256  7d0aaf31c33a25a9efad8f94b44ee50febae15889f4da119cf184ffe98002673  tortoise_orm-0.25.0.tar.gz
> +md5  ef8df163a207f40230c618efa18ca32b  tortoise_orm-0.25.1.tar.gz
> +sha256  4d5bfd13d5750935ffe636a6b25597c5c8f51c47e5b72d7509d712eda1a239fe  tortoise_orm-0.25.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
> diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
> index bf250007ce..32327bae38 100644
> --- a/package/python-tortoise-orm/python-tortoise-orm.mk
> +++ b/package/python-tortoise-orm/python-tortoise-orm.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TORTOISE_ORM_VERSION = 0.25.0
> +PYTHON_TORTOISE_ORM_VERSION = 0.25.1
>   PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
> -PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/d8/02/89777797d2c74386e21fca4a879d15eef6a0a789e4b9564355e94c367e6e
> +PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/d7/9b/de966810021fa773fead258efd8deea2bb73bb12479e27f288bd8ceb8763
>   PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
>   PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
>   PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
