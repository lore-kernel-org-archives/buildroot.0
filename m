Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C048C7EE39
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 11:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 214E784851;
	Mon, 30 Jun 2025 11:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvaijZhuVtWc; Mon, 30 Jun 2025 11:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B6280D5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B6280D5C;
	Mon, 30 Jun 2025 11:25:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B90D11C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 11:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F35140276
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 11:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ic5YVwThvwgd for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 11:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A3E440224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3E440224
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A3E440224
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 11:25:00 +0000 (UTC)
X-CSE-ConnectionGUID: zcfsFgqBSwq2/BuaIvkWBw==
X-CSE-MsgGUID: 5cFUPSF5Ri+Rcb+OLAQNMg==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 13:24:59 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2025 13:24:58 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Mon, 30 Jun 2025 13:24:56 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 30 Jun 2025 13:24:56 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: eeUTQ3NVQvej1XjfNqYqfQ==
X-CSE-MsgGUID: V1FUWjwcSqCfJWqlGTcuIQ==
X-IronPort-AV: E=Sophos;i="6.16,277,1744063200"; d="scan'208";a="303724687"
Date: Mon, 30 Jun 2025 13:24:56 +0200
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aGJ0COHYseTAS9iW@yd-6wlzhs3>
References: <cover.1750318763.git.yann.morin@orange.com>
 <026284a73a78b0273882e10fc31b16b5bac5c566.1750318763.git.yann.morin@orange.com>
 <1125bc629f55efa54f7a31010f5643b7@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1125bc629f55efa54f7a31010f5643b7@free.fr>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751282702; x=1782818702;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=QY48nzjOCv5OtoKjQFqzuTVqyFrqEJnl4uVdo9UgtLI=;
 b=ZFb68zalEy+cvuI1fyikAj/KxV6r6h2NoedoKsWXlGVY+DZHCZnEFiXO
 /v9lCxWRGR/jMYrR3UlTx/Jn6YhBE6nvKSkz5yveCGXlk3mM4bF1KUV1o
 Sl+vKVLuEoNDHpuhULKT/vvp0Pze+RFm9fHT1750KyqzRddvPc/lWxi84
 y4QK/jx/5jrZfmS8CFbx8Mwo9csyLhDfGPECaBAmkHsPuifiLPU74WS/b
 MDffvqAiYSlZZivRtBdeh+JnclcKY6AP/hoNayMqk0uvHPPLZpqiwkpYZ
 2u+A4pvu1ME5xkh+NMmcHMbp85uaTGCu0DsR5NGDDwWF9Rh9nubvZ7OTn
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ZFb68zal
Subject: Re: [Buildroot] [PATCH 1/3 v2] package/containers-image-config: new
 package
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

On 2025-06-29 18:58 +0200, Julien Olivain spake thusly:
> On 19/06/2025 09:39, yann.morin@orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > The container/image repository is the standards regpository that drives
> > the image management in container tools, like podman or skopeo. Besides
> > a Go library, it also prodvides the template configuration files used
> > by those tools; those files can also serve as default ones.
[--SNIP--]
> Series applied to master, thanks.

\o/

> While testing this series, I encountered a build issue which
> is not introduced by those changes, which is why I applied it.
[--SNIP--]
>     In file included from vhost_user.h:14,
>                      from passt.h:29,
>                      from qrap.c:36:
>     virtio.h:13:10: fatal error: linux/vhost_types.h: No such file or
> directory
>        13 | #include <linux/vhost_types.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~
[--SNIP--]
> So maybe passt needs a dependency on
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0? I'm a bit surprised as the
> https://passt.top/passt/about/ website mention a kernel 3.13 and
> 4.18 compatibility. So maybe it's an upstream bug which just needs
> to test for the presence of this header.

Nothing in passt/pasta is configurable; they just build everything.
So if there's a bug, it's a documentation bug; they even mention a
kernel 3.8 [0]. However, those requirements are, as I read them, runtime
requirements, not build-time ones.

So I will send a patch to add a dependency on headers >= 5.0.

[0] https://passt.top/passt/about/#interfaces-and-environment

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
