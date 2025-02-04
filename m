Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B6C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 11:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 107E560FB2;
	Tue,  4 Feb 2025 11:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4X0efhz-yK0y; Tue,  4 Feb 2025 11:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0160260FAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0160260FAF;
	Tue,  4 Feb 2025 11:13:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 643D1185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4805D827B5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYQyOt8Bay5F for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 11:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B591826B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B591826B4
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B591826B4
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:13:37 +0000 (UTC)
X-CSE-ConnectionGUID: J8TS+/bFQqe8XtsGw6NKeQ==
X-CSE-MsgGUID: A3BZItb+Tke9UkTi9RLiYw==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 12:13:35 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 12:13:35 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 4 Feb 2025 12:13:33 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 04 Feb 2025 12:13:31 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: N+bZRP75TRe3I47yFTPLWQ==
X-CSE-MsgGUID: +FHEwuTvQwivsjvft2p44w==
X-IronPort-AV: E=Sophos;i="6.13,258,1732575600"; d="scan'208";a="247291308"
Date: Tue, 4 Feb 2025 12:13:31 +0100
To: Fiona Klute <fiona.klute@gmx.de>
CC: <buildroot@buildroot.org>, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Message-ID: <Z6H2W96MX4oQFoOx@yd-6wlzhs3>
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <Z6GzCbcs9k0Rul1a@yd-6wlzhs3>
 <c3a16cbe-ae5b-4b68-9713-0fe3bf5888d4@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3a16cbe-ae5b-4b68-9713-0fe3bf5888d4@gmx.de>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX306.corporate.adroot.infra.ftgroup
 (10.115.27.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738667619; x=1770203619;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ptXjtr2Lnq0JhOR3OfK6R3TUniaNIkFYMnvpV24vk2c=;
 b=YcMPJt9KC22tdoqoSxKNutS5voxYE8msh6cOdbQrdvLTqIHiDsoKfREm
 8DxJfgmQx23fEzwxv3D26R1WaN8KVrw/KP+pIdGLDI3eYk43H1Hc2M+HU
 9p5dzjPCENF+rv4ezl00AxRlHl6k8SkFlMPMV9FpFY94jFy7wQtu0DXYp
 40KTHOkBazyrBjWQBigfDIJU2vNRex9edEC1qI8lWSj4XxlRT3XDg+im8
 oRt2KW6ReqOvWCSlU57wFqjMoL23pi9eDgclUiMNxB1KgL/AjTG8kiyBP
 Z8UtsroHEc5EaL3JeH7ICNsy4T6kk3Rkf7aokNTjqmDSmj+r6p5BNr/n7
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=YcMPJt9K
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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

Fiona, All,

On 2025-02-04 11:52 +0100, Fiona Klute spake thusly:
> Am 04.02.25 um 07:26 schrieb yann.morin@orange.com:
> > > Go forces the GOLD linker when dynamically linking Go code, because
> > > old versions of BFD caused errors. The issue has been fixed in
> > > Binutils since at least 2.41 according to the upstream description of
> > > the patch added with this commit [1], and now forcing GOLD causes
> > > linking failure if ld.gold is not available. The associated Golang
> > > issue [2] is still open.
> > I have send a patch back a while ago, that allowed to at least work
> > around the issue for affected packages:
> > https://patchwork.ozlabs.org/project/buildroot/patch/876f3a7bb6a2375193fc8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com/
[--SNIP--]
> One question though: Is there an existing way to check the Binutils
> version of an external toolchain? For people with Binutils < 2.41 with
> ld.gold forcing BFD might actually break things, so ideally I'd want to
> make the flag conditional on Binutils >= 2.41 (all Buildroot-built
> toolchains meet that anyway). Or would it be acceptable to simply say
> that people with old external toolchains are on their own?

As noted in my filebeat package patch [0], the ld.bfd issue is
supposedly fixed since binutils 2.36, AFAIUI.

There, I took the approach that the workaround would not be conditional
on the binutils version. First, because there is no way in Buildroot to
get that information, especially for external toolchains. Second,
because using ld.bfd should always work, using ld.gold only being an
optimnisation at build time.

I also considered that toolchains too old to even have ld.bfd would just
be ignored anyway. ld.bfd was introduced with ld.gold, which was "quite
a long time ago" (at least 2011 I believe), so we can assume any rdecent
toolchain would be recent enough to have it.

So, packages that need to specify "-fuse-ld=bfd" would do so
unconditionaly, just maybe for the AArch64 case, which is the only one I
know can cause the build failure (not all packages have the issue, as
can be explamplified by the fact that we have no such failures in the
autobuilders).

[0] https://patchwork.ozlabs.org/project/buildroot/patch/46f20e86fa6c17ada33ede672ffe4229d8bf26a3.1699547993.git.yann.morin@orange.com/

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
