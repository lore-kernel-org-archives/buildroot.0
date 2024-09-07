Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5E1EB64CF
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 19:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77D37400D2;
	Sat,  7 Sep 2024 19:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myHZcMZvQkxn; Sat,  7 Sep 2024 19:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A4794023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A4794023F;
	Sat,  7 Sep 2024 19:32:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F43A1BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB0740256
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziRep4yUmQX0 for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 19:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 567994022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567994022A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 567994022A
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 19:32:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8562A13F879;
 Sat,  7 Sep 2024 21:32:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 21:32:00 +0200
Date: Sat, 7 Sep 2024 21:32:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <ZtyqMEeVKgFMJwIw@landeda>
References: <20240828124440.3882-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240828124440.3882-1-tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725737525;
 bh=anyMx5PBwErxY9dlQFrk3+DhP6THKC6LSXUObEPW8HM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gEo7sQojgg7cfldyjM+SFmMilTeaZJJnmqiWn7MWdhlXWSRmLsa5AC48SP6DlytEU
 +iNDZsEHeczzUCNl0dqveTLKyQbrUIhY3Q+G/GI0Rjp+xDgy6wHWus8nt6L7N+2pjX
 I9Bi4BZmvVfziDdnHHlPbdNDeEOJC+GWGvvMKsqEPC/g8NW+G2KqzJKH6I+ndIokxx
 PHC4BIz0Gl9MFumJqC9DL78gHQIGpH7rynEd07zbojK7xfwEqR+9VOzEubWbJ2dNtO
 AyPUEYPY6p/ZK/cfcKx6ksLIL5W4T75z0jgwmQrPs0baFjQdz6Al/oG1g0Io0bPecq
 BXWjuD6M13J0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gEo7sQoj
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: move 'ppd-fixup-paths' to
 'host-finalize'
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2024-08-28 05:44 -0700, TIAN Yuanhao spake thusly:
> When using 'per-package', some python shebang in the host directory
> will point to the per-package directory. However, the python modules
> that are runtime dependencies will not be rsynced to the corresponding
> per-package directory, which may cause the python script to fail to
> find the python module.
> 
> For example, when enabling BR2_PER_PACKAGE_DIRECTORIES and
> BR2_PACKAGE_HOST_BMAP_TOOLS, the following error will occur:
> 
>   ModuleNotFoundError: No module named 'six'
> 
> output/host/bin/bmaptool detects the presence of host-python-six in
> output/per-package/host-bmap-tools/host. However, host-python-six is
> not a required compile-time dependency for host-bmap-tools. Therefore,
> it will not be rsynced to output/per-package/host-bmap-tools/host, but
> only to output/host. This is the reason for the error.
> 
> Move the 'ppd-fixup-paths' to 'host-finalize' to allow the host python
> script to search for python modules in output/host.

Thankyou for this patch.

As you already noticed [1], there was a more generic patch pending [1],
so I've marked yours as "Not applicable" in patchwork.

Thank you for th effedback on my previous patch! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Brandon Maier <Brandon.Maier@collins.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 55aeafde23..f1fc3a4a52 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -604,7 +604,6 @@ prepare-sdk: world
>  	PARALLEL_JOBS=$(PARALLEL_JOBS) \
>  		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
>  		$(TOPDIR)/support/scripts/fix-rpath staging
> -	$(call ppd-fixup-paths,$(BASE_DIR))
>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>  	mkdir -p $(HOST_DIR)/share/buildroot
>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> @@ -722,6 +721,7 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
>  host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>  	@$(call MESSAGE,"Finalizing host directory")
>  	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
> +	$(call ppd-fixup-paths,$(BASE_DIR))
>  
>  .PHONY: staging-finalize
>  staging-finalize: $(STAGING_DIR_SYMLINK)
> -- 
> 2.45.1
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
