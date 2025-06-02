Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4091C54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 06:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E8980AFB;
	Mon,  2 Jun 2025 06:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68Pp1jxG7_5V; Mon,  2 Jun 2025 06:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E2B80AF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E2B80AF7;
	Mon,  2 Jun 2025 06:55:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 662D51F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 06:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5799480AF6
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 06:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbCJSNpSXaGe for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 06:55:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21EE980AF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21EE980AF7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21EE980AF7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 06:55:23 +0000 (UTC)
X-CSE-ConnectionGUID: OVBVYMXWTii27CPhOJZTUw==
X-CSE-MsgGUID: YBBT7goDQz2z+HHBodu8JQ==
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:55:21 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jun 2025 08:55:20 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 2 Jun 2025 08:55:19 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 02 Jun 2025 08:55:18 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: AcBP/Y2SRniPTVI8pIvfZw==
X-CSE-MsgGUID: TpgxB9AcSwC1PPpORlfjPA==
X-IronPort-AV: E=Sophos;i="6.16,202,1744063200"; d="scan'208";a="295704924"
Date: Mon, 2 Jun 2025 08:55:18 +0200
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Message-ID: <aD1K1vCLJt7/3/i4@yd-6wlzhs3>
References: <0cc8c132abc7f2117de95906fc1ae4729100c564.1748355369.git.yann.morin@orange.com>
 <7c0c1993b8789a5c5e2af275c8dc9882@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c0c1993b8789a5c5e2af275c8dc9882@free.fr>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX401.corporate.adroot.infra.ftgroup
 (10.115.26.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1748847324; x=1780383324;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=CUlWrFaHdgw3xgCGl2k5AFtweAWJwgpfTXfEruSSMWo=;
 b=IAEA0YiY/DH6p7Kxa4O3J/STYZY8koRu4TEU7p850/i7AvsrsWaAtnRd
 Z7RxL5xJtdp78YV4VSJhsoBaKh38Db4b3+6WeM0xvk9JhXdzu456vfeKf
 becRc9v0za9/uAT5cKwt3KjwPo/OAhyPGAeBOYg8N7epr3/0DJmpuYq/Q
 zZQvadcUDajR6NCmt7sFqwr2vXv8Gs0BYl0eEvOsTpuBaIhW2kTGHcQt5
 wSAF6Pmh0vxayirUoOv/DjSp34NUKMZkTn3Ap3d9hjI+BMqaT2i4yTZYv
 E32qDK6DyKk4yuUyZ6vANXG3lDPSCpSS5kE2GGW+0kHu3HixbhwpQXEU1
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=IAEA0YiY
Subject: Re: [Buildroot] [PATCH] package/gpsd: bump to 3.26.1
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

On 2025-05-28 22:56 +0200, Julien Olivain spake thusly:
> On 27/05/2025 16:16, yann.morin@orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
[--SNIP--]
> > -GPSD_VERSION = 3.25
> > +GPSD_VERSION = 3.26.1
> This new version fails in the gpsd runtime test.

Damned... I forgot about that runtime test...

> There is
> apparently a change of behavior in "gpsfake" in UDP mode, which works
> for the first client connection, but fails for subsequent calls.
> I bisected this behavior change to upstream commit:
> https://gitlab.com/gpsd/gpsd/-/commit/5c080c35fc3d981172a5e4af34d0d92854a5433a
[--SNIP--]
> Do you think this behavior change is an upstream bug?

Definitely.

> If yes, it would be nice to fix this upstream. Otherwise, we should
> slightly modify the runtime test (like removing the gpsctl invocation,
> if gpsfake udp does not support more that one client connection).
> What do you think?

I'll open an issue upstream, but last time I did, err.. Let's say the
experience was far from thrilling... But thanks for your simple and
obvious reproducer; that will hopefully help.

We can switch the runtime test over to TCP mode (if it's not broken...)
to workaround the issue in the meantime...

I'll look at that as soon as possible.

Thank you for the feedback!

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
