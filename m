Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E8CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D64760FEC;
	Mon, 25 Sep 2023 11:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D64760FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1mlkMklVTR4; Mon, 25 Sep 2023 11:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71DC460F96;
	Mon, 25 Sep 2023 11:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71DC460F96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8148C1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6806A80E46
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6806A80E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxuF5DPO-ZfM for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:35:33 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0BA180E3F
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BA180E3F
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 13:32:22 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 13:32:22 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 13:32:21 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 25 Sep 2023 13:32:20 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.03,174,1694728800"; d="scan'208";a="44309012"
Date: Mon, 25 Sep 2023 13:32:20 +0200
To: <buildroot@buildroot.org>
Message-ID: <ZRFvxAvwNDWuBrC8@tl-lnx-nyma7486-2>
References: <9e52d2493ec60db3f2dafc9429171566b3ce4e38.1695641310.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e52d2493ec60db3f2dafc9429171566b3ce4e38.1695641310.git.yann.morin@orange.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1695641733; x=1727177733;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=jnE9MQLqVUlmnhl3o6N32x6zkNpvSvVAXRYUZQOwvhc=;
 b=tHCP+0np5ba8DbDKfqvkeR9jBULRs+923pbX+kXyBe6B9B8wuE1YMUex
 GebuwV7bU7xoo0KWj9J8ETtRqsnbDVrOcmDWCj8uCEo4KzGAHfD1PZYNH
 PgnOgYSxW/wOELMbwjg8czXzEe6xA8CAIQgadM+Xd1PEsaQvJUKgMlFl4
 oXEixFPtIx0SBRVDbKTXhw/4Y1mu2DZuYdAYW6ZLUZAb8yBwliRQj70BI
 TdMACgASMwqqJk1twEbFW1KZA6as7wTtnYyS06z8cOAoEv5h3rFh9QTEx
 sg+s1PBQRvNbv2WbkWtry/6t9DIWRIMFUDBwhDhXo9C4IMI80lZiHcuI3
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=tHCP+0np
Subject: Re: [Buildroot] [PATCH] package/go: fix installation
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-09-25 13:28 +0200, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
[--SNIP--]
> diff --git a/package/go/go.mk b/package/go/go.mk
> index aa5d7f97b5..76eaf6beb3 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -35,6 +35,9 @@ HOST_GO_COMMON_ENV = \
>  
>  ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
>  
> +# WIP: WHY?
> +HOST_GO_DEPENDENCIES += toolchain

Sorry, spurious diff in this commit...

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_arm),y)
>  GO_GOARCH = arm
>  ifeq ($(BR2_ARM_CPU_ARMV5),y)
> @@ -146,6 +149,7 @@ define HOST_GO_INSTALL_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
>  	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
>  
> +	mkdir -p $(HOST_DIR)/bin
>  	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
>  	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
>  
> -- 
> 2.34.1
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
