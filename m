Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BB5C61D97
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 11:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 336324059B;
	Wed, 22 Nov 2023 11:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 336324059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5JWpq1HX6_A; Wed, 22 Nov 2023 11:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 300B640374;
	Wed, 22 Nov 2023 11:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 300B640374
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B744F1BF20D
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 11:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FF8481386
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 11:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF8481386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBoPp7KjHqpe for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 11:46:12 +0000 (UTC)
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 334F081379
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 11:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 334F081379
Received: from [192.168.50.162] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5lgFr47YG9W4O5lgFrpQtw; Wed, 22 Nov 2023 12:46:08 +0100
Message-ID: <d55f0a0d-7190-4e92-bf7e-bf1cb1b710b9@benettiengineering.com>
Date: Wed, 22 Nov 2023 12:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231121220706.506553-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231121220706.506553-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfBBn4PUd+ngMgx2OkYrR3LwaSFaNWpjxAEm4w+HuQRaCsg2sQnma/jJTFsGQBTY7bOzwtrKe10sGDsRXr6CQCycoh4FIMcq4G6K44XCZCPeGJaaqui37
 fNc/IgHXJm8vH9OLCJiiXumRW1u9xT2lCbGaLp5lVSlPxs1FiflMuloDBCfnyjFlHHmPU7TOiO9ed1i5AFOnELkVZXHCc/dSymtpguLZvx7PUqYaa+kcm07c
 +L3/NGuRIRmaq/QSkKSCuA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700653568; bh=NZXSkCfOgLJcI5OxDTvSK9IIlusslcVN8r1REM1VJ+U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jeujB75K/RWY+Eg0Nem6PctjqqOJJ+jssBHqhN/e+LN1GOH+aPNnLcwMzbPSbYhXN
 h3cIkNJaVzr/CcuC44LbD5vBpNWLrSssiCVQkTHuPyWKFsOdDSaJiqY+tQMH1S+aLU
 UXwtqPw//yysXyjSQgE0Tueu+7mwqNKyDD2/L8FST0g4N51B2l9A+C1mbEavFl/UxJ
 LYUxmbBU/5+mMGq6kDxMgdw94X92EVPhbrwZgqjHVPxy5zWRn+Rs+w416NyFg2qbfP
 sQWdLoD4c4tbq0LWaeRXRVRG+LqlLqvFrU9d/mIdIlw9WuvNHwzUgMxpDN5iaOh//c
 MbQHx9CPez+Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jeujB75K
Subject: Re: [Buildroot] [PATCH 1/1] package/libblockdev: drop unrecognized
 options
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 21/11/23 23:07, Fabrice Fontaine wrote:
> The following options were wrongly kept when bumping to version 3.0.3 in
> commit 18420d9b6b424492741cba495cc2e7a28a409e8b:
>   - dmraid (dropped since
>     https://github.com/storaged-project/libblockdev/commit/d174944a85169efae3bac0b6e76498e3d0c6c240)
>   - bcache and kbd (dropped since
>     https://github.com/storaged-project/libblockdev/commit/c1ff1c87e31fb2820a5694637eb221f590eb9451)
>   - python2 (dropped since
>     https://github.com/storaged-project/libblockdev/commit/8fc33b834529d3d18a73112e4c77ea0a5d26d62c)
>   - vdo (dropped since
>     https://github.com/storaged-project/libblockdev/commit/e51faac2a952da33925e3ccab0f4f0fdf3986cd3)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   package/libblockdev/libblockdev.mk | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
> index 3bbc221cc5..e0fca2b95c 100644
> --- a/package/libblockdev/libblockdev.mk
> +++ b/package/libblockdev/libblockdev.mk
> @@ -16,20 +16,15 @@ LIBBLOCKDEV_AUTORECONF = YES
>   LIBBLOCKDEV_CONF_OPTS = \
>   	--disable-introspection \
>   	--with-loop \
> -	--without-bcache \
>   	--without-btrfs \
>   	--without-dm \
> -	--without-dmraid \
>   	--without-escrow \
> -	--without-kbd \
>   	--without-lvm_dbus \
>   	--without-mpath \
>   	--without-nvdimm \
> -	--without-python2 \
>   	--without-python3 \
>   	--without-s390 \
> -	--without-tools \
> -	--without-vdo
> +	--without-tools
>   
>   ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
>   LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
