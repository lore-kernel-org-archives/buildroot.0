Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC586C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9BC860B14;
	Wed,  5 Feb 2025 14:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4U15evzPVNR2; Wed,  5 Feb 2025 14:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A261C60FD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A261C60FD6;
	Wed,  5 Feb 2025 14:41:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C914CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F8D680C1A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EloMrSt5rv5M for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:41:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98C1080BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C1080BD6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98C1080BD6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:41:41 +0000 (UTC)
X-CSE-ConnectionGUID: n54I8uB4QemXAAzGCdIa2g==
X-CSE-MsgGUID: g5HEj6fsT8agubFdMgiUqg==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 15:41:39 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 15:41:39 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 15:41:38 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 15:41:37 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: fyERNtWsSLuQpRcTbrIq1w==
X-CSE-MsgGUID: U8rlJIpdT5CQpXj+2wvXEQ==
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; d="scan'208";a="247659080"
Date: Wed, 5 Feb 2025 15:41:37 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z6N4oXxvmYXp3LMi@yd-6wlzhs3>
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
 <20250205135825.2310972-3-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205135825.2310972-3-fiona.klute@gmx.de>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738766501; x=1770302501;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=0Eq9Qkj7Y4KHwL3UK5pnFNlYV/RKC4HwrqI30jDNca4=;
 b=kTu2xqkWYzEmH53r2KAqiRe+ZwpNFDjq+wI6Tz94aNO5JY6rSvZxwfOH
 cwPyX5cz+tmK4BGOh/RYqo4/zg77UjwE03iTCEaqTq0oYFGoR06XxqD7W
 ZkP6FozJVl/66if6BxGZi50NhUzLQHFxjN1oEiSgpv+c1Ffp820vTeokV
 LRWgCvGD2ta9mXLg7sE+E5eiOvvo12Yl493MRWJIhEshpcwuTOinOnM5u
 Fm5tgVNiNslJEzR/6yRgGUZo0ZdeKoR7oEFAzBOfiwuTkJ/IJOvHrQ0AB
 +1kFOaygQ96LNfCQm/L7QboNGW8JogaHxemzPdMRDv/12AIkTFWf0+H5f
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=kTu2xqkW
Subject: Re: [Buildroot] [PATCH v3 3/3] package/containerd: use --no-pie on
 musl
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
Cc: Nathaniel Roach <nroach44@nroach44.id.au>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2025-02-05 14:58 +0100, Fiona Klute spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Disable PIE on musl to fix "read-only segment has dynamic relocations"
> errors during linking [1] that appeared after major version bump to v2.
> 
> [1] https://github.com/golang/go/issues/17847
> 
> Fixes: 9c2e146ca9a21f0de3c97981113a57c58c3a5bd5
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

> ---
>  package/containerd/containerd.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index ee07c22495..1f70a26ebf 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -49,6 +49,12 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
>  CONTAINERD_TAGS += no_cri
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +# Go exe build with PIE doesn't work with musl.
> +# See: https://github.com/golang/go/issues/17847
> +CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
> +endif
> +
>  define CONTAINERD_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
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
