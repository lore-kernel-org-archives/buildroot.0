Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A610C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECB5340519;
	Fri, 12 Apr 2024 15:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhNxaHuU-cE0; Fri, 12 Apr 2024 15:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA64740534
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA64740534;
	Fri, 12 Apr 2024 15:18:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 666031BF397
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5350E40534
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyEAGiHN-T9d for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 289EA40519
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 289EA40519
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 289EA40519
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:18:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43CFIBLj098063;
 Fri, 12 Apr 2024 10:18:11 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43CFIBdW010072
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Apr 2024 10:18:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Apr 2024 10:18:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Apr 2024 10:18:11 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43CFIBrn031070;
 Fri, 12 Apr 2024 10:18:11 -0500
Date: Fri, 12 Apr 2024 10:18:11 -0500
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20240412151811.cty2f2uiwig2hiyd@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
 <20240412055358.1354293-3-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412055358.1354293-3-heiko.thiery@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712935091;
 bh=ApbR2scyh+wFrmkwTu+Q4EOPRIb9Ij1OgbjeeINz0K4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gyUELEzyNHJmT2mHspdmwi/7tnaa3Z4t89Zan9JOs6Yi1tKiSYGEMU4mQmlvIQg54
 qfzIf1RFmbe/72mxuBsuTQoBeXm5SStWfVpA9hVBJ8wd48DNPyPkyN63+CHWm80WvB
 ts2XcDZlhvVXw5qwGBxEsG1lAortMIXwdel/fX4s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=gyUELEzy
Subject: Re: [Buildroot] [PATCH v3 3/3] uboot/uboot: add new dependency to
 yamllint
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On April 12, 2024 thus sayeth Heiko Thiery:
> Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
> [2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> 
> v2: accidentally resend this series as v2
>     (it's too early in the morning and no coffee yet)
> 
> v3:
>  - update URLs in the comment
> 
>  boot/uboot/uboot.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Bryan Brattlof <bb@ti.com>

Thanks for this. I successfully built v2024.04 U-Boot for all of TI's K3 
SoCs. One step closer for K3 :)

~Bryan

> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index a894654698..0ee63cabdb 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -276,10 +276,12 @@ UBOOT_DEPENDENCIES += host-vim
>  endif
> 
>  ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
> -# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
> +# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/binman/binman.rst?plain=1#L377
> +# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
>  UBOOT_DEPENDENCIES += \
>  	host-python-jsonschema \
> -	host-python-pyyaml
> +	host-python-pyyaml \
> +	host-python-yamllint
>  UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
>  endif
> 
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
