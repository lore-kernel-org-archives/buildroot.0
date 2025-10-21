Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26538CCD19F
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 04:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF02660814;
	Tue, 21 Oct 2025 04:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fh6bbAC2Q7xA; Tue, 21 Oct 2025 04:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3A0B60737
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A0B60737;
	Tue, 21 Oct 2025 04:41:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7DCD43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 04:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4D6860737
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 04:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRU3IYRTYHTV for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 04:41:30 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 21 Oct 2025 04:41:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABC4A60735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC4A60735
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABC4A60735
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 04:41:28 +0000 (UTC)
X-CSE-ConnectionGUID: DzGlH1ZwTEqjii+325QxWg==
X-CSE-MsgGUID: I4EaDl/JR2WvDMH7Z2IoKA==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Oct 2025 06:34:18 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Oct 2025 06:34:17 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59;
 Tue, 21 Oct 2025 06:34:15 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Oct 2025 06:34:15 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: X8JJIoGuQKCRG7uCSNIyHA==
X-CSE-MsgGUID: yI0OB/X7SziRmI7arLhcnQ==
X-IronPort-AV: E=Sophos;i="6.19,243,1754949600"; d="scan'208";a="347867593"
Date: Tue, 21 Oct 2025 06:34:15 +0200
To: James Hilliard <james.hilliard1@gmail.com>
CC: <buildroot@buildroot.org>, Christian Stewart <christian@aperture.us>
Message-ID: <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020225424.98853-1-james.hilliard1@gmail.com>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX202.corporate.adroot.infra.ftgroup (10.115.26.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1761021688; x=1792557688;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=zCXXwJWhkEpmIqQL7Gw/XY6fh9uhn8ePdQB31DAbyCM=;
 b=EMZz7R0QO1R5LI6haWKKo1WSPWoJGAdnd9xZc2Ar32nqIcuoBcEhmTsi
 E7FAukp1MUOa2o97/hEC2c41rIMNsT0q2Q/B76VyaoDWtiQd19z/wkOsf
 fMU/KXvV2yi8eXMa+H22SW6B6aWiC+AR7u3q34VCe9DUp6K0NF4g1ywDv
 eXHywQSUugRwvbroUchFizwbGPIXFOCW+h47NZFRn3GxfGYGeaWSK1ybt
 QG0wnI0Pb0OntgYjQK7pSqTPSV2hjq9Pqh0mBoT7mClRY8+q11vdwbOTh
 5kmIKuyWHDXVDUoO5bMCy6cdc0R+ySM+cIYo16lmi1rfhcLDNVSiZoIQO
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=EMZz7R0Q
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
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

James, All,

On 2025-10-20 16:54 -0600, James Hilliard spake thusly:
> BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
> specified in project go.mod and go.sum files. By default, it uses Google's
> official Go module mirror at proxy.golang.org, falling back to direct downloads
> if the module is not found in the mirror.
> 
> This change sets the default GOPROXY value to match Go's built-in default of
> "https://proxy.golang.org,direct" which provides several benefits:
> 
> - Avoid package breakages due to missing module sources

How can sources be missing when fetched "direct"ly?

Do you have a nesxample of a package where this actually fixes the
download (barring using s.b.o.) ?

> - Better alignment with upstream Go toolchain defaults
> - Faster downloads via the proxy compared to direct Git clones
> - Maintains reproducible builds through Go's module checksum validation

In the past, we observed the reverse: the goproxy had a stale version
that was not matching the upstream one, so when we tried to vendor a
package, the hashes would not match. Using "direct" fixed the issue
(sorry, I can't remember what package that was...)

> The default value from the toolchain can be read with "go env GOPROXY"

I disagree. The default should be the same as the previous setting, that
is "direct". At least in this patch.

If you want to suggest a change of the default, please do that in a
separate patch.

Regards,
Yann E. MORIN.

> We rely on package developers to audit their dependencies in go.mod and go.sum.
> 
> The value can be configured to:
> - A comma-separated list of proxy URLs
> - "off" to disable all downloads
> - "direct" to download directly from source repositories
> 
> For more details on Go module proxies:
> https://go.dev/ref/mod#module-proxy
> 
> Discussion:
> https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
> v1 -> v2:
> 
>  - added more context and links
>  - renamed to GOPROXY instead of GOPROXY_LIST
>  - moved into the !BR2_PRIMARY_SITE_ONLY section
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  Config.in             | 16 ++++++++++++++++
>  package/pkg-golang.mk |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index d730f2034b..23717f3f97 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -335,6 +335,22 @@ config BR2_LUAROCKS_MIRROR
>  
>  	  See http://luarocks.org
>  
> +config BR2_GOPROXY
> +	string "Go module proxy"
> +	default "https://proxy.golang.org,direct"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	help
> +	  The Go module proxy URL used to download Go modules. By
> +	  default, it uses the official Go module mirror, falling back
> +	  to direct downloads if the module is not found in the mirror.
> +
> +	  The value can be one of:
> +	    - Comma-separated list of proxy URLs
> +	    - "off" to disable all downloads
> +	    - "direct" to download directly from source repositories
> +
> +	  See https://go.dev/ref/mod#module-proxy
> +
>  config BR2_CPAN_MIRROR
>  	string "CPAN mirror (Perl packages)"
>  	default "https://cpan.metacpan.org"
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index ffd50adecc..3e388cb257 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
>  $(2)_DOWNLOAD_POST_PROCESS = go
>  $(2)_DL_ENV += \
>  	$$(HOST_GO_COMMON_ENV) \
> -	GOPROXY=direct \
> +	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
>  	$$($(2)_GO_ENV)
>  
>  # If building in a sub directory, do the vendoring in there
> -- 
> 2.43.0
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
