Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90764EB64CF
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 19:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF96403B8;
	Sat,  7 Sep 2024 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oa71_FjWWeD; Sat,  7 Sep 2024 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAD094023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAD094023F;
	Sat,  7 Sep 2024 19:35:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 401141BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A6AE4023F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22fgdGzXWy-B for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 19:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9C14400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9C14400D2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9C14400D2
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 19:35:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D1B5913F8A9;
 Sat,  7 Sep 2024 21:35:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 21:35:19 +0200
Date: Sat, 7 Sep 2024 21:35:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <Ztyq96caTNvUf7Ge@landeda>
References: <20240609075444.747339-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240609075444.747339-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725737724;
 bh=WXp8G6at1DHPy0fQ6Kwocix2xVORA9TuE2Df5mMavf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/3XCpDnZlK4AaXFzXGIQ7RiDt3rK4DrahH4zC+xgSvH8kRex18UeoKLa0gya55fh
 X/1SlOZpKcHTdom2Gmv8r6Htvr0NZkjznsBjQPEGIMcBSmCJF4KXGjoJFaTwobcGuU
 crLhguYLuGBvG/wV2JPBQ2E0jphqXnnHIqb7LpVbw1X2d8t/EVOTdEiiSN5gy/KcTZ
 rRm5aSqJQqjKSWU7+F/6KzWlILUWm+INFSFScbivz3csxCnBvqhZ8w5SdnHc8uOXRg
 PRowYe0xscwnPDkFPmUDFXI7ym3th0HqGwEA2EEudJxOybOvyYsKwH3mLd2GvhGelT
 X0zWMSyLxnwJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n/3XCpDn
Subject: Re: [Buildroot] [PATCH] Makefile: run PPD and RPATH fixup in
 host-fialize
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
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-09 09:54 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> As such, move the PPD fixups to the host-finalize step, and while at it,
> also move the RPATH fixups.
[--SNIP--]
> Reported-by: Casey Reeves <casey@xogium.me>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: Casey Reeves <casey@xogium.me>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Brandon Maier <Brandon.Maier@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3bef434466..6c2a2ccddb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -594,14 +594,7 @@ world: target-post-image
>  
>  .PHONY: prepare-sdk
>  prepare-sdk: world
> -	@$(call MESSAGE,"Rendering the SDK relocatable")
> -	PARALLEL_JOBS=$(PARALLEL_JOBS) \
> -		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> -		$(TOPDIR)/support/scripts/fix-rpath host
> -	PARALLEL_JOBS=$(PARALLEL_JOBS) \
> -		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> -		$(TOPDIR)/support/scripts/fix-rpath staging
> -	$(call ppd-fixup-paths,$(BASE_DIR))
> +	@$(call MESSAGE,"Preparing the SDK")
>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>  	mkdir -p $(HOST_DIR)/share/buildroot
>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> @@ -719,6 +712,13 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
>  host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>  	@$(call MESSAGE,"Finalizing host directory")
>  	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
> +	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
> +		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> +		$(TOPDIR)/support/scripts/fix-rpath host
> +	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
> +		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> +		$(TOPDIR)/support/scripts/fix-rpath staging
> +	$(call ppd-fixup-paths,$(BASE_DIR))
>  
>  .PHONY: staging-finalize
>  staging-finalize: $(STAGING_DIR_SYMLINK)
> -- 
> 2.45.1
> 

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
