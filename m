Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3E5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 08:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A85381A6F;
	Tue,  4 Jan 2022 08:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9-3WlaqMNaN; Tue,  4 Jan 2022 08:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9088081916;
	Tue,  4 Jan 2022 08:29:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90E7E1BF28B
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 08:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FBFB60B71
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 08:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDzB4uyrgMbm for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 08:29:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C47860B20
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 08:29:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3C4CA13F814;
 Tue,  4 Jan 2022 09:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641284986;
 bh=OcEanPZrmPA+R5glpqU+EFl0+JBdBRt/G5WUr7aB328=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nL1+DQg/JsDaKb7P+EUNBoZnbtLPn3kADf9NUWj08p/xcEsKQEXcTJGBCfjlFGCf+
 gTb/FUvol49tDrSrCX5Ea1b8XCq2gvVCVw+F2RweMvy933njOEnM4TQew+LiwLZiZt
 qu4O/1Kj1u8NxfYXOCAZAfAMB4ZK05Ar2MpyplW/L4O4C075AU8DawjT6Vfrc89Sdu
 Y7lHzcEQJ7LOX/YEQyADKe7Mf2jLg/NV4/RATw8dvc9z62aTCNFjEOtDl9U/lteA5u
 krzdZ87iwAS8U0oPIBDLlPzQ/FmlJRx3cMw3wMFkt6x5A0vKDNPs2T3UIdguBrpUif
 CMzOqGF4UZbVg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jan 2022 09:29:41 +0100
Date: Tue, 4 Jan 2022 09:29:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220104082941.GQ69135@scaer>
References: <20220103215619.4580-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103215619.4580-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/pkg-waf.mk: enable verbose
 compile
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-01-03 22:56 +0100, Peter Seiderer spake thusly:
> Honour the buildroot verbose flag ('V=1') for the waf compile step by
> adding '-v' to the build command.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/pkg-waf.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
> index a593476a69..0239862ac6 100644
> --- a/package/pkg-waf.mk
> +++ b/package/pkg-waf.mk
> @@ -20,6 +20,8 @@
>  #
>  ################################################################################
>  
> +WAF_OPTS	= $(if $(VERBOSE),-v) -j $(PARALLEL_JOBS)

s/\t=/ =/

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  ################################################################################
>  # inner-waf-package -- defines how the configuration, compilation and
>  # installation of a waf package should be done, implements a few hooks
> @@ -74,7 +76,7 @@ ifndef $(2)_BUILD_CMDS
>  define $(2)_BUILD_CMDS
>  	cd $$($$(PKG)_SRCDIR) && \
>  	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
> -		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
> +		build $$(WAF_OPTS) $$($(2)_BUILD_OPTS) \
>  		$$($(2)_WAF_OPTS)
>  endef
>  endif
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
