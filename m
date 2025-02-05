Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C1C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8406F60FD6;
	Wed,  5 Feb 2025 14:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjKgxjxYvNYI; Wed,  5 Feb 2025 14:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72C0D60FEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72C0D60FEB;
	Wed,  5 Feb 2025 14:40:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3877812F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D17B83B5A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GD8wa3yf4Roi for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD38383B56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD38383B56
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD38383B56
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:40:37 +0000 (UTC)
X-CSE-ConnectionGUID: rIzbjtIIQtuNoMRcRhmSbg==
X-CSE-MsgGUID: h7wQ7WWgRB+BYb8pPJY5kQ==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 15:40:35 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 15:40:34 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 15:40:33 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 15:40:33 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: n4A0FDJOSja0/RyMDYEHvw==
X-CSE-MsgGUID: J1JesO+AQ/mFEEkh4M4njA==
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; d="scan'208";a="247658093"
Date: Wed, 5 Feb 2025 15:40:33 +0100
To: Fiona Klute <fiona.klute@gmx.de>
CC: <buildroot@buildroot.org>, Nathaniel Roach <nroach44@nroach44.id.au>,
 Christian Stewart <christian@aperture.us>, Thomas Perale
 <thomas.perale@mind.be>
Message-ID: <Z6N4YY7HZJzMJoJF@yd-6wlzhs3>
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
 <20250205135825.2310972-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205135825.2310972-2-fiona.klute@gmx.de>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738766438; x=1770302438;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=zG7DyKFijXmTqdB6yQBxIkZa6tmscrKHsrRThIZ+lQE=;
 b=FO6sin6ierJ3R72wlE1bQudEkWHc4R8mt2nMiP+rrcgw+VIvziPJyQDa
 iDdapI8Wp/uJ92Df7kUsehOxCRaRVnT7PjEiV4u+DIUqWI7VZoOf6Wf+3
 jWGf+5fzG2ef58tpvWy1DH3MQ0uKzyNaJu3naCukoXucea0WAGAp8FV21
 Nf95rMgrvlfC40IvWZyl27PCtY0BOPdHdKqvvYGU9HzUJUGhUo2IctAdT
 1lPcisWPM1e8lZWfvdoU6h921nueKirDuQkIN7pHMbuXlF6OWWNSDM9EH
 4fSGkITWathCSxCJ20fWyurUc3lhM7wI6geYtXNOl2T36bGR+0X0E4PHw
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=FO6sin6i
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-golang: use ld.bfd
 instead of ld.gold on aarch64
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

On 2025-02-05 14:58 +0100, Fiona Klute via buildroot spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> is fixed in Binutils >= 2.41 (that includes all versions provided by
> Buildroot). Forcing Gold will break with toolchains that don't provide
> it (like the Buildroot toolchains), so override the flag and use BFD.
> 
> This override should be removed if Go stops forcing Gold, and may have
> to be adapted if the set of available linkers changes (e.g. with a
> future Binutils update).

Yes, perfect, thanks!

> See: https://github.com/golang/go/issues/22040
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
> * Note in commit message that changes to the override may be required
>   with Go or Binutils updates
> 
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
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
