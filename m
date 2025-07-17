Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBC3C83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 453FC607E3;
	Thu, 17 Jul 2025 20:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njmQZtK8skSG; Thu, 17 Jul 2025 20:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E5A60762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E5A60762;
	Thu, 17 Jul 2025 20:40:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 680181A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EF6C40442
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgXKpSaMrwy6 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7318940142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7318940142
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7318940142
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D14CB977A8D; Thu, 17 Jul 2025 22:40:49 +0200 (CEST)
Message-ID: <a2693d07-f7ca-4dd8-9ffe-3764250089ad@rnout.be>
Date: Thu, 17 Jul 2025 22:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715221656.729769-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715221656.729769-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784849; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=p7GImBv3MJblRGNI/bnmwMO8eTGAoBLnbV3iYnbIIrI=;
 b=Qws2LiMOIevdnswxuBHqU25B12Qn92AeNoR11167A3av5KCVbWXyRjxjk50aDU1hc4pdLJ
 X567gTHOonogYiPMfHd93mZ6maTdmG0Vd6CuNgIRp34dJAC6Ivi3S2wyS+ly+pSRT6V6qH
 r2qiyd4Yd3Ejlz1PTiaiG62k2E0uqpBdGOe9IAX+l08J5gRU7dw2z++EBI9aLSWhojf0QV
 eY++9i1N2FrOfRY0pXhYjsAq3gCE2lksewxvMfDeSQ3r2oK7mcmvx1uT6y2Y7uwc+XUB02
 BjBAAQaZpHklLkGFzkBbmTQvLWFZq1qolJIUjFKrvQFKwor9wQm/X25uQLoSwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Qws2LiMO
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version
 0.9.1
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



On 16/07/2025 00:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aerich/python-aerich.hash | 4 ++--
>   package/python-aerich/python-aerich.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
> index bdbea8f66c..6e44c241f3 100644
> --- a/package/python-aerich/python-aerich.hash
> +++ b/package/python-aerich/python-aerich.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aerich/json
> -md5  031a5946dcf816e8059459204eb63b65  aerich-0.9.0.tar.gz
> -sha256  37c7ca71e947e7de3aa0e778cb193fc1faebf9136a0f1108b52b902918b85acc  aerich-0.9.0.tar.gz
> +md5  4d647c8f3829782f5770b7b120832f63  aerich-0.9.1.tar.gz
> +sha256  629afbef5902635c41f410dd05def984c02e05e62d8a2020210a29a4aae19001  aerich-0.9.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
> diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
> index 6c6cea2dfe..c7417f3179 100644
> --- a/package/python-aerich/python-aerich.mk
> +++ b/package/python-aerich/python-aerich.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AERICH_VERSION = 0.9.0
> +PYTHON_AERICH_VERSION = 0.9.1
>   PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
> -PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/2f/4b/1facb78fea47f790040035b94fdcc31630fabe1bda49ebc7a4f374da1757
> +PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/a5/98/75c6e3053a14a14ffe86e2435698b960abe0bf03c114e67f966d92ff19e7
>   PYTHON_AERICH_SETUP_TYPE = poetry
>   PYTHON_AERICH_LICENSE = Apache-2.0
>   PYTHON_AERICH_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
