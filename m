Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB49C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 15:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D608418D0;
	Sat, 25 Nov 2023 15:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D608418D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3mdR8_V4N1q; Sat, 25 Nov 2023 15:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96285418CF;
	Sat, 25 Nov 2023 15:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96285418CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 655841BF423
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D19C403BE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D19C403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9ffwKHwAVr0 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 15:39:15 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6023400C6
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 15:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6023400C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 246BE13F8D5;
 Sat, 25 Nov 2023 16:39:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 16:39:08 +0100
Date: Sat, 25 Nov 2023 16:39:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231125153908.GK3177259@scaer>
References: <20230930221727.1458825-1-arnout@mind.be>
 <20230930221727.1458825-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930221727.1458825-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700926753;
 bh=MvX/D41VIFcYOkkxMq24nTCG6e2vtJIo0ruM2b0nrrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gcVGsv8c9dKBXDCUS/i/MDaJCEr+n2E3FKS7SC2BkqAZyCKyZgx4zV3ZWCXy/cb18
 QBu5THoz0vCcsRvJtipTGKgS/7TWBKw61NlodETMFLtk73GGc+3bUNPJ2bSkBPDMmm
 lr2Q5GBP0mSSyCrBPqt91xuRmV1VdMDV45zDZ4oh95tIR+l6HDcLsyUFqKzipLzpwf
 WUgyTN5I4ORFYLBv0vojpZ9Gi/RB7opZ8dt3zYMted3H4TVAsCFpRlRL2VEbATLF2H
 Ui5qi6lpRs96CmQVtPIJ3NA01UaPM2jF7aZEyRYpPni0HlJsYxuXlsT2Xtxu+DpHvJ
 LOTTastW5mXsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gcVGsv8c
Subject: Re: [Buildroot] [PATCH 01/10] package/pkg-python.mk: remove
 $(2)_PYTHON_INTERPRETER variable
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
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-10-01 00:16 +0200, Arnout Vandecappelle via buildroot spake thusly:
> This is a leftover from python 2/3. Since the interpreter is now always
> python3, we can simply call it like that - like is done in all the other
> places where python is called.
> 
> While we're at it, call python3 explicitly rather than relying on the
> symlink.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 28ee4cb85f..1fc096efb3 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -325,10 +325,6 @@ $(2)_DOWNLOAD_POST_PROCESS = cargo
>  $(2)_DOWNLOAD_DEPENDENCIES = host-rustc
>  endif # SETUP_TYPE
>  
> -# Python interpreter to use for building the package.
> -#
> -$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
> -
>  #
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
> @@ -337,7 +333,7 @@ ifndef $(2)_BUILD_CMDS
>  define $(2)_BUILD_CMDS
>  	(cd $$($$(PKG)_BUILDDIR)/; \
>  		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> -		$$($(2)_PYTHON_INTERPRETER) \
> +		$$(HOST_DIR)/bin/python3 \
>  		$$($$(PKG)_BASE_BUILD_CMD) \
>  		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
>  endef
> @@ -351,7 +347,7 @@ ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
>  	(cd $$($$(PKG)_BUILDDIR)/; \
>  		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> -		$$($(2)_PYTHON_INTERPRETER) \
> +		$$(HOST_DIR)/bin/python3 \
>  		$$($$(PKG)_BASE_INSTALL_CMD) \
>  		$$($$(PKG)_INSTALL_OPTS))
>  endef
> @@ -365,7 +361,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>  	(cd $$($$(PKG)_BUILDDIR)/; \
>  		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> -		$$($(2)_PYTHON_INTERPRETER) \
> +		$$(HOST_DIR)/bin/python3 \
>  		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
>  		$$($$(PKG)_INSTALL_TARGET_OPTS))
>  endef
> @@ -379,7 +375,7 @@ ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>  	(cd $$($$(PKG)_BUILDDIR)/; \
>  		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> -		$$($(2)_PYTHON_INTERPRETER) \
> +		$$(HOST_DIR)/bin/python3 \
>  		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
>  		$$($$(PKG)_INSTALL_STAGING_OPTS))
>  endef
> -- 
> 2.41.0
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
