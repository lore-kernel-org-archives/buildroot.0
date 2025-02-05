Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22914C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C399B60B14;
	Wed,  5 Feb 2025 14:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_ckaLOSkEi2; Wed,  5 Feb 2025 14:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A359360FD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A359360FD6;
	Wed,  5 Feb 2025 14:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E7D12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6D580BD9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uno26hGU8gMH for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 820F0834AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 820F0834AE
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 820F0834AE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:39:44 +0000 (UTC)
X-CSE-ConnectionGUID: eYHBOoMuTYySK9182hO8cg==
X-CSE-MsgGUID: R74c3jL4SoyKpd9UmI9Ckg==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 15:39:40 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 15:39:40 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 15:39:38 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 15:39:38 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: npmB0qQMR4erLhc0ctcVxQ==
X-CSE-MsgGUID: yEdLN0aZS0eAjD57C3sUrQ==
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; d="scan'208";a="251773151"
Date: Wed, 5 Feb 2025 15:39:38 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z6N4KpdTeYI3pRck@yd-6wlzhs3>
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205135825.2310972-1-fiona.klute@gmx.de>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738766385; x=1770302385;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=F73NvYC0ms29QAyYZIH0HaiAOjEuRIfdC4AovM3HXzU=;
 b=jmdo3mWBqy8TUBNw+VLt8ALD2Qtxri7mWaAn/H+JnJ0xVW6OaP3sHfmG
 J1ZF3wtLr2ZCkxS8OYMdSu6/Gr38BmwNKXLK4rf6oDj6MQIRdHH1mrOIs
 VJh7keX8dfAXvjcll9ZR365ms1oJc64iq3xBS3phS8zVL0xEd+Bnu4hzY
 K1ouljqrS/a71kZgeyVMisFyWXr8afD8Ij0A0ZWQcUrUJvK8wm8gpdkEw
 L2O2gfrTfvjyBh/5NBAivpWDQ7B6I7q9MsqMFkOomts8dFphknJITiquI
 uAWlFiLVVRe8qIbFsi4vej4wl34OYa2l45EgA1ftEMAIZ7XOSGNc+je2m
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=jmdo3mWB
Subject: Re: [Buildroot] [PATCH v3 1/3] package/pkg-golang: allow packages
 to provide extldflags
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
> From: "Yann E. MORIN" <yann.morin@orange.com>
> Currently, only the -static extldflags may be set in the
> golang-package infra. However, in some cases, it might be necessary to
> pass other flags, either because they are needed on a specific
> architecture, or a specific C library; packages may also have a need
> to pass arbitrary linker flags when they use CGO linking.
> 
> For example, on AArch64, go forcibly uses ld.gold, but it is not
> available in all toolchains, and ld.bfd works nowadays (following
> patch); another case is musl, where PIE is not supported with go.
> 
> Introduce FOO_EXTLDFLAGS, which we use to set those flags, and that
> packages can set to pass such flags.
> 
> Migrate the current setting of -static to use that new variable.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Thank you for the rewrite! :-)

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3 (Fiona):
> * Update commit message as provided by Yann via Buildroot ML
> 
>  docs/manual/adding-packages-golang.adoc | 6 ++++--
>  package/pkg-golang.mk                   | 6 +++++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
> index aa25426591..6de0916a83 100644
> --- a/docs/manual/adding-packages-golang.adoc
> +++ b/docs/manual/adding-packages-golang.adoc
> @@ -84,8 +84,10 @@ therefore only use a few of them, or none.
>    infrastructure will automatically generate a minimal +go.mod+ file
>    in the package source tree if it doesn't exist.
>  
> -* +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the
> -  +LDFLAGS+ or the +TAGS+ to the +go+ build command.
> +* +FOO_LDFLAGS+, +FOO_EXTLDFLAGS+, and +FOO_TAGS+ can be used to pass
> +  respectively the go +LDFLAGS+ (via the `-ldflags` command line flag),
> +  the external linker flags +EXTLDFLAGS+ (via the `-extldflags`
> +  command line flag), or the +TAGS+ to the +go+ build command.
>  
>  * +FOO_BUILD_TARGETS+ can be used to pass the list of targets that
>    should be built. If +FOO_BUILD_TARGETS+ is not specified, it
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 33cf9bfb1a..a3421af288 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -114,10 +114,14 @@ ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
> -$(2)_LDFLAGS += -extldflags '-static'
> +$(2)_EXTLDFLAGS += -static
>  $(2)_TAGS += osusergo netgo
>  endif
>  
> +ifneq ($$($(2)_EXTLDFLAGS),)
> +$(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
> +endif
> +
>  # Build package for target
>  define $(2)_BUILD_CMDS
>  	$$(foreach d,$$($(2)_BUILD_TARGETS),\
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
