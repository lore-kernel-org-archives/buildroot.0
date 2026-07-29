Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1F1C54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F0480F0D;
	Wed, 29 Jul 2026 20:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVcE-HFbOIVa; Wed, 29 Jul 2026 20:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70BE180F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785358421;
	bh=4A2Li26K2ES0KtV1cwxFprT2PLoWXiN8qB30b7UvUa0=;
	h=Date:From:To:cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fr+oFAJZGoGk8bFhd1olQX1P2hYYEwdZDBovTIstYNjuKvbZoNkj2Lz6LVy8vhW6d
	 mDE7dl5WwIfMbdaP/eJFzDQmZWasLRk+GCdXH88137MBeNkY5XlIMgEAYl71gufLOG
	 sH002qbgIdbZbiMl2ZHKj2qs8gkZHY+tElOxg6IJONF2Muzo1oIDkziLaOsLFG1zFp
	 /2x0WtFKoEPag2f5FUb0QZhLFvBIA9w6lQ00JtthUtbuaurXYmEqe7Hr/UeW/nyzjG
	 Xh6L7XIeDWbX0+R58Q0frcK9rlUtxp24uIhE5+AzyMYYk6YEPZ3d1V8hBFkGHZiExi
	 j0lXsgGwoZg5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70BE180F03;
	Wed, 29 Jul 2026 20:53:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A18026E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 300A96062B
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMwe-zivMw-k for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC2E160601
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC2E160601
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC2E160601
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:53:38 +0000 (UTC)
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com
 ([174.115.41.146]:47934 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.5) (envelope-from <rpjday@crashcourse.ca>)
 id 1wpBHR-0000000GwdG-3vIk; Wed, 29 Jul 2026 16:53:36 -0400
Date: Wed, 29 Jul 2026 16:52:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Julien Olivain <ju.o@free.fr>
cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260729202520.1568463-1-ju.o@free.fr>
Message-ID: <392d9bae-0944-88f7-3312-89d089335596@crashcourse.ca>
References: <20260729202520.1568463-1-ju.o@free.fr>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aosXxyCx0LrBru3e2txDU9FLqAu3aFoSroGXzBbD6cM=; b=y4Q7BLL9fu27qktmKwkKVQpSwd
 LbvIZXzVfqrNolE6o9GDDNU7H/+tqD3LnOfr9+loyYzJYT0a62Ue5QZ0uM3Hvx1PirLN5WwLmQLqw
 uel2vme+FINZ4z+W8S6pbuNPJA9o+r712n7m9kXIGlZxkX54LZQyMzd6owWoyq5wxQTl8pbLHeuVJ
 RHp7brHOyExVxNQB+rJVY65xx0JM6vEREmdLdHGTMy8ZAYxWCs67AYvPFEXL2NrFBQAEtyQJLFD9I
 +MKdaCeyDE89QcjcqXDlVei7eq0pyMpDl8gi1NnWVSsvRytJqq/D9d3eifUUZt0iJnOMXV+Nz4OuH
 gxue3QYw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=y4Q7BLL9
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix host build
 without FIT support
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

On Wed, 29 Jul 2026, Julien Olivain wrote:

> Commit [1] "package/uboot-tools: fix host FIT signature support"
> slightly changed the logic in which the file
> $(@D)/include/generated/autoconf.h is created.
>
> When there is no Kconfig sub-option selected, the file is no longer
> created and the build fails with error:
>
>     include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: No such file or directory
>
> The issue can be reproduced with the with the simple commands:
>
>     cat >.config <<EOF
>     BR2_aarch64=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>     EOF
>     make olddefconfig
>     make host-uboot-tools
>
> This commit fixes the issue by simply adding a touch of the file
> at the beginning to make sure it will always exist.
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/928cc5dc5cb82e6f2cb43f853488309eb806ef89
>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/uboot-tools/uboot-tools.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index ef8bcabbd9..8a2877333c 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -124,6 +124,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
>  	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
>  	touch $(@D)/include/config/auto.conf
>  	mkdir -p $(@D)/include/generated
> +	touch $(@D)/include/generated/autoconf.h
>  	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
>  	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
>  	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
> --
> 2.55.0
>
  for what little it's worth:

Tested-by: Robert P. J. Day <rpjday@crashcourse.ca>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
