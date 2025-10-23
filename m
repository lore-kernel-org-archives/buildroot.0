Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE8CCCD1BF
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8919B84A4E;
	Thu, 23 Oct 2025 20:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZyAWdEMUPgj; Thu, 23 Oct 2025 20:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2436B84996
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2436B84996;
	Thu, 23 Oct 2025 20:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2BC19D
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F1FE61BBF
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sMzO6pN32UT for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 20:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0005461BB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0005461BB8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0005461BB8
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:31:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 469A85FF95;
 Thu, 23 Oct 2025 22:31:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Oct 2025 22:31:11 +0200
MIME-Version: 1.0
Date: Thu, 23 Oct 2025 22:31:11 +0200
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251022-bash-5-3-v2-1-adcf1223650f@gmail.com>
References: <20251022-bash-5-3-v2-1-adcf1223650f@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1de6f99f32205dfc810bd0811a6c013e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761251473;
 bh=QB0vnS2R9biLZaKwa/Kj8kQ3lZvtKEO1wipebjHfbHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eZ1LNAWPVShv+2rISdNQOFV58X4vC8GxA2l7L9xPqfGJpWqjYIbBVnSURC65WGytf
 3vL4V9PJvpaphPYJed+asIErRhoEZdfefhWWjawXVU3YB2LAYfRFkAJMxgKD56Jwdp
 uha5lquVoPvCtpgFVtyQzPIkwOxdOljnQS2IUJd7kNWYtjJzJ/DdeyYeAko+J7jSfu
 +7CMXSe3XwC1XQaj9sXPAOcLAYpdwGMWiM5ZTiRdfPVFxI0DBnRcuVK4iuQlvcsTpz
 doDhaVILkm5swJm+wSrEI/Ezs+M8r3EW0otVDkWnKpJhDHlrAOtWor18I71ZL8Dgrh
 xCFfdr5k3dqmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eZ1LNAWP
Subject: Re: [Buildroot] [PATCH v2] package/bash: bump to v5.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Joseph,

Thanks for this v2!

On 22/10/2025 22:01, Joseph Kogut wrote:
> See the relevant announcement:
> https://lists.gnu.org/archive/html/bug-bash/2025-07/msg00005.html
> 
> Changes:
> - Removed upstreamed multibyte compilation fix
> - Rebased missing include patch that remains unmerged
>   - Fixed Upstream: checkpackage warning
> - Removed build failure workarounds enforcing older C standard
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[...]
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 7fb43c52c0..ed99bbadb2 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -BASH_VERSION = 5.2.37
> +BASH_VERSION = 5.3

This new 5.3 version is introducing 3 build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2114876146

For reference, the version 5.2.37 build correctly:
https://gitlab.com/jolivain/buildroot/-/pipelines/2114892967

>  BASH_SITE = $(BR2_GNU_MIRROR)/bash
>  BASH_DEPENDENCIES = ncurses readline host-bison
>  BASH_LICENSE = GPL-3.0+
> @@ -26,15 +26,6 @@ BASH_CONF_ENV = \
>  	bash_cv_func_sigsetjmp=present \
>  	bash_cv_printf_a_format=yes
> 
> -# Can be dropped when bash is bumped to 5.3 or newer.
> -ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
> -BASH_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
> -endif
> -
> -ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
> -BASH_CONF_ENV += CFLAGS_FOR_BUILD="$(HOST_CFLAGS) -std=gnu17"
> -endif

When host-gcc is >= 15 but target-gcc < 15, the build is failing
because the buildconf.h (initially made for target) is reused for
host. So we may need to keep this previous block setting
CFLAGS_FOR_BUILD variable, after all.

> -
>  # The static build needs some trickery
>  ifeq ($(BR2_STATIC_LIBS),y)
>  BASH_CONF_OPTS += --enable-static-link
> 
> ---

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
