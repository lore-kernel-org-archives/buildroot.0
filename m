Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EE1C83F1D
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 04:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90FFF60E89;
	Tue, 15 Jul 2025 04:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrKrevVHFNOb; Tue, 15 Jul 2025 04:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E1760ECB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3E1760ECB;
	Tue, 15 Jul 2025 04:53:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D28411AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 04:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53E5160ECB
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 04:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YghXZka3Bnve for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 04:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA01C60E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA01C60E9C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA01C60E9C
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 04:53:44 +0000 (UTC)
X-CSE-ConnectionGUID: XQKzzk2qQS2Uv3tctBEEKw==
X-CSE-MsgGUID: oKzBai/cQKurCG4uWkUyiA==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:53:42 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jul 2025 06:53:42 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 15 Jul 2025 06:53:40 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 15 Jul 2025 06:53:40 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: ZRIv99HmQFmfj8KT6+5P5g==
X-CSE-MsgGUID: hyxMuIHhQE65r0gsQynJaw==
X-IronPort-AV: E=Sophos;i="6.16,312,1744063200"; d="scan'208";a="313445024"
Date: Tue, 15 Jul 2025 06:53:40 +0200
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Message-ID: <aHXe1GdHq06RsIMR@yd-6wlzhs3>
References: <c509e65797c5662315ce9316ee1c4b50e5275111.1751288710.git.yann.morin@orange.com>
 <64c23b7abfbfd647599418acd278f3a0@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64c23b7abfbfd647599418acd278f3a0@free.fr>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1752555225; x=1784091225;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=8B5tj34ihXLbtPDPhQr9+S480PGbW9FfGqGPd/utLxY=;
 b=oHRXUKTb3M0hTAafyFrG2D2MoxbnxJSJheoWMUjK5Xs/Vghu31gZanjE
 ozN6tRBAAiAlRP8WmojSm4b7E4yYL6qw6NLv3yGkKvfDar+0ML1/RXlx8
 LYFjP9/5b3Xqlx0aVIC9n2Ptj2EeWPUpUXfrEmUnAMXbV5raX4eog8OLL
 MdgrzqkgNKpR3RmoIykEuE0H8g+piKohrlYJhm2ZPIZLJlhPjZRyMoGd3
 MPiRLFgFvc1sAvUwEsdJrOJp/gsDTTQAz+iivW4nswjHkmIruSAo5Xi8o
 St/YiQufwoVPRxiMUbzs9O+jepGk6TSBhjvSWGasFya0plbEgum80spVb
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=oHRXUKTb
Subject: Re: [Buildroot] [PATCH] package/passt: needs headers >= 5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2025-06-30 21:29 +0200, Julien Olivain spake thusly:
> On 30/06/2025 15:05, yann.morin@orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
[--SNIP--]
> > Add a dependency to kernel headers, and propagate it to podman, updating
> > the previous 4.14 requirement.
[--SNIP--]
> > diff --git a/package/podman/Config.in b/package/podman/Config.in
> > index 6bfd477f38..cb7984f709 100644
> > --- a/package/podman/Config.in
> > +++ b/package/podman/Config.in
> > @@ -5,7 +5,7 @@ config BR2_PACKAGE_PODMAN
> >  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
> >  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
> >  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
> > -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
> > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
> Since podman has two network backends (passt and slirp4netns),
> exposed in a Kconfig choice, do we really need to propagate this
> dependency here? Or could it moved only to
> BR2_PACKAGE_PODMAN_NET_PASST?
> This way, we could still build podman+slirp4netns for kernel
> headers >= 4.14 and < 5.0.

Absolutely, you're right. I've just sent a patch doing what you
suggested.

Regards,
Yann E. MORIN.

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
