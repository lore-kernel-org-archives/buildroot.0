Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59F6C02196
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 948118109A;
	Tue,  4 Feb 2025 14:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqIXDrZgg6zJ; Tue,  4 Feb 2025 14:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A9CF81570
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9CF81570;
	Tue,  4 Feb 2025 14:47:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40FD912A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F82D40195
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAXDEG3qK6nG for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 831EA405CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 831EA405CA
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 831EA405CA
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:27 +0000 (UTC)
X-CSE-ConnectionGUID: dmd27HygRJWtoIQE1VEzRQ==
X-CSE-MsgGUID: wBCajulwQx+ixy79FQJ08g==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 15:47:20 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 15:47:19 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 4 Feb 2025 15:47:17 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 04 Feb 2025 15:47:16 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: iSrIce3xQweaacXqRTSpdA==
X-CSE-MsgGUID: W0MPAtwoRA6lRkGSa9NXag==
X-IronPort-AV: E=Sophos;i="6.13,258,1732575600"; d="scan'208";a="251275356"
Date: Tue, 4 Feb 2025 15:47:16 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z6IodGr39h7X02e1@yd-6wlzhs3>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250204143227.1233163-1-fiona.klute@gmx.de>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738680448; x=1770216448;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=wgFfgaBBAnzQL7DT5rFtl16WSwFw/51DABCMLFqxH78=;
 b=hRezc/bYTxCBBlVL6uj+vNyMlI9/McJI/b5CUEXv0puusP6tEEiPixfk
 GfJChpxlgfmK30kSUkZM5k7ULLnxXM+XSp8zz41gV3hLtjYBdRFaPlDOD
 POT01IsbPYZdD1h9iHxyx9MUNqZl1ZK9/iG0l9XIxPZZjh8TOmDUl5VV0
 m1l9iSgflGlnwhVQ85DcRgmDbXi/MlGyYXIDaroiQJuEz1cxRZ6kAjU3M
 BxUibzhEhRS91mm3hMjpU0uLLNz1AtXcyOrd2p/Ny7zf32SKSya6qgxgL
 LtB1xML7vZZlOU+ehRDNnwTlxXmBHkSb+2akHiBWplc/XOWvB8NEjBa5n
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=hRezc/bY
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2025-02-04 15:32 +0100, Fiona Klute spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
[--SNIP--]
> Additionally disable PIE on musl to fix "read-only segment has dynamic
> relocations" errors during linking [2].
[--SNIP--]
> +ifeq ($(BR2_aarch64),y)
> +# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> +# is fixed in Binutils >= 2.41 (so all versions provided by
> +# Buildroot). Forcing Gold will break with toolchains that don't
> +# provide it, so override the flag and use BFD.
> +# See: https://github.com/golang/go/issues/22040
> +CONTAINERD_EXTLDFLAGS += -fuse-ld=bfd
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +# Go exe build with PIE doesn't work with musl.
> +# See: https://github.com/golang/go/issues/17847
> +CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
> +endif
> +endif

Is the PIE issue really only hapenning on Aarch64? The upstream issue
17847 does not make it that obvious, but at least mips64 is said to have
the issue as well, and someone even mentioned amd64 (aka x86_64).

I.e. don't we need the musl workaround out of the aarch64 condition?

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
