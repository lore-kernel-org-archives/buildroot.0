Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF910C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A4940715;
	Wed,  5 Feb 2025 12:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX_nCWH6X4l8; Wed,  5 Feb 2025 12:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8A484066E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8A484066E;
	Wed,  5 Feb 2025 12:02:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4336812F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2783B60FB5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puFpX44N8Q1U for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2AE860BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2AE860BCC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2AE860BCC
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:02:18 +0000 (UTC)
X-CSE-ConnectionGUID: UTo0nVKZSoq5zvYCPfgSeA==
X-CSE-MsgGUID: UgTXz9oPTimhyzoFu/5Bgw==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 13:02:16 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 13:02:15 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 13:02:14 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 13:02:13 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: buz+p/8QQeGcPSeL03X/dQ==
X-CSE-MsgGUID: AVAIDVAaQEieMBMlPy0iog==
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; d="scan'208";a="251681923"
Date: Wed, 5 Feb 2025 13:02:13 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z6NTRZe6pNcyMvRn@yd-6wlzhs3>
References: <20250205113531.4161633-1-fiona.klute@gmx.de>
 <20250205113531.4161633-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205113531.4161633-2-fiona.klute@gmx.de>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX306.corporate.adroot.infra.ftgroup
 (10.115.27.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738756939; x=1770292939;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=PcLKkvR2P5ozhB2rl1//7tZxXn12UOZz2aIilvsTq1U=;
 b=j9e/uX9wOG0p57LS+S1dkSU+nYOpXI3wT7reE4ff66wspF6RFFevyCFU
 hNEgV+VBGfWx5QBFXW5nJe1AhI4lxt/Uhug1qcVBjbvytOL5XSz+eXGtM
 oHUpoQ5FeKo6WyTpQaxWkmaP/E6lcQ56IlhBrc6i3RodpPClS937Ozkov
 vE2Atm2D/tNO+eNaUftkGZ1C5UUgWdnmm4lQc8s/e4Qy4+YCw5AsbbCFE
 eHtcpeaQsCsW6EnWf7ZmQdTrt2Pzwz9xzhE3mtoQ103ZlpzBG62hM4zYH
 GIuZ3txs7ZQP8sn+gZh0m7UjKDiLbTL0e6yEXRZiVdcbRJPhJ2kLT1D07
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=j9e/uX9w
Subject: Re: [Buildroot] [PATCH v2 2/3] package/pkg-golang: do not force
 ld.gold on aarch64
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

On 2025-02-05 12:35 +0100, Fiona Klute spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> is fixed in Binutils >= 2.41 (that includes all versions provided by
> Buildroot). Forcing Gold will break with toolchains that don't provide
> it (like the Buildroot toolchains), so override the flag and use BFD.

It is worth mentionning that toolchains using a binutils version where
gold does not even exist (e.g. old versions of binutils, or future ones
where it got dropped) would lack 'ld.bfd' as well, and would only have
'ld'. That change would break for those toolchains; for the old
versions, that would not be an issue in practice, as they would be
broken because binutils had an issue anyway; for future versions, we'll
handle that at times, as usual! ;-)

Regards,
Yann E. MORIN.

> See: https://github.com/golang/go/issues/22040
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/pkg-golang.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index a3421af288..bdf8de4d66 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -118,6 +118,16 @@ $(2)_EXTLDFLAGS += -static
>  $(2)_TAGS += osusergo netgo
>  endif
>  
> +ifeq ($(BR2_aarch64),y)
> +# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> +# is fixed in Binutils >= 2.41 (that includes all versions provided by
> +# Buildroot). Forcing Gold will break with toolchains that don't
> +# provide it (like the Buildroot toolchains), so override the flag and
> +# use BFD.
> +# See: https://github.com/golang/go/issues/22040
> +$(2)_EXTLDFLAGS += -fuse-ld=bfd
> +endif
> +
>  ifneq ($$($(2)_EXTLDFLAGS),)
>  $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
>  endif
> -- 
> 2.47.2
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
