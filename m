Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E2C8302D
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 09:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF5C80FF4;
	Mon, 30 Jun 2025 09:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcbL-loOAaSO; Mon, 30 Jun 2025 09:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6C3E80E53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C3E80E53;
	Mon, 30 Jun 2025 09:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9AB41C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 09:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF3E880FF4
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 09:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gja3rD0-61b4 for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 09:29:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8710780E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8710780E22
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8710780E22
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 09:28:59 +0000 (UTC)
X-CSE-ConnectionGUID: cV2tgOtKRsa2TFK8g9+Ukw==
X-CSE-MsgGUID: FT9KdOyfSDi7Xcq/G+YANw==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 11:28:57 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2025 11:28:57 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Mon, 30 Jun 2025 11:28:56 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 30 Jun 2025 11:28:55 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 331G1Bd/QlmK6zeTLSfx3w==
X-CSE-MsgGUID: ERMIus7kS8Oh5toFi6GBLg==
X-IronPort-AV: E=Sophos;i="6.16,277,1744063200"; d="scan'208";a="307910232"
Date: Mon, 30 Jun 2025 11:28:55 +0200
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Message-ID: <aGJY1xO5eNpFV6Pr@yd-6wlzhs3>
References: <cover.1750845702.git.yann.morin@orange.com>
 <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
 <1b61fab1a3d17e9cb757e12dc9958b51@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b61fab1a3d17e9cb757e12dc9958b51@free.fr>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751275740; x=1782811740;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=BcZ8SxtULehA6cgrE/uaIQdQtmXGUIDPSqX361o7XVc=;
 b=KjNYqpmohM1sLooL5ccZcwiSz8YOeyWNqBkd6DqSWKIu9XXNCAo38aqj
 Kk8+HKkDJ0d7uB+F4a/YutC0IcK2gZDaISfNDykk5xT5G0oTWLWUHTPxL
 O9b8zhQimMaaxI//w/8RgQ+f0fl6/oyWDFpuZbmgb+CePVxzADzenZTSn
 BWJnRgsdfOOM1PWEcU3g2bpySta+2tO+tPiNTU9Vy0BtxEueMrhCsq5G0
 7f8/btTRtql9pG8xuMB/wxDDfuCxgCK53jAN8y8rgnEthAL9zTjKBPyyG
 qF7I8ZNMH1WdnON67+plDKeOeuO39NwZJDWnf1jh1Ii9Lv95YVEZIBWjj
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=KjNYqpmo
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: fix install with
 top-level parallel build
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

On 2025-06-29 12:16 +0200, Julien Olivain spake thusly:
> On 25/06/2025 12:01, yann.morin@orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > We fix that by first installing into a temporary location, as part of
> > the build step, and by then copying from there as part of the install
> > step. This ensures that the boot files are easily available, without
> > needing a dependency on the target install step, that we can't express.
[--SNIP--]
> Series applied to master, thanks.
> For info, I fixed the commit title of patch #2 (by adding the
> missing "l" to lpxelinux).

Woops, thanks! :-)

> Do you think it would be worth extending the syslinux test to cover
> this new option?
> I'm thinking about simply adding BR2_TARGET_SYSLINUX_LPXELINUX=y here:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/testing/tests/boot/test_syslinux.py#L23
> If yes, could you send a patch doing that please?

I pondered it, but that would only test whether lpxelinux builds on not;
checking that it does work would need a much more complex test. And the
build test is (suposedly) covered by the autobuilders already.

If you think that is still important to add lpxelinux to the runtime
test although it is not actually runtime-tested, then I'll cook up a
patch...

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
