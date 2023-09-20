Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23498C04AA7
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 15:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A608175C;
	Wed, 20 Sep 2023 15:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A608175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wng7TXbyRakv; Wed, 20 Sep 2023 15:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B3A81760;
	Wed, 20 Sep 2023 15:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B3A81760
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BEF71BF395
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 15:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D95FA60BBA
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 15:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D95FA60BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWMCjepFbzfC for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 15:55:03 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B008E60AF4
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 15:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B008E60AF4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f63:9bfc:8d71:54af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AA9FE13F8A9;
 Wed, 20 Sep 2023 17:54:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 17:54:58 +0200
Date: Wed, 20 Sep 2023 17:54:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230920155458.GB512384@scaer>
References: <20230920130754.2258-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920130754.2258-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695225300;
 bh=LklAQM11hCT0pZqJmL3JfIWZFBrAYHvgEXwlGBFN3DE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwFUzj4T0lretuN7gqNGmPrPTVFfg5TFetVwc7YuODCPab3CMy242AK5GlbYHpt3/
 sGjJypldb7JaK8xFKW1VrvaeZwGJfp7lQ4S3/0vSUsJYfIMdGe6N1hvmACnNfKfry+
 ZM444UDRD1M35VVM6M6GEYSQ+pxYpDrkcTLnfjjudp0SzTBU0Q2ssuSa/+dtSdxdCg
 H1Uyq+SjO5LgV6/oCtclKH4EvutyGlb2NT45JfFmO8j6thylcoaMD6/CDAktyP0ebB
 fM2xufn8Pr6hYERy/re0DmT5q5JJTNKQmx8EZVd7T0s4iEWfogJg1ECglXdW+uzdop
 Re8zgkR8HBglg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FwFUzj4T
Subject: Re: [Buildroot] [PATCH 1/1] package/nftables: install libnftables
 to staging
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

Yuanhao, All,

On 2023-09-20 13:07 +0000, TIAN Yuanhao spake thusly:
> Needed for network-config-manager:
> https://github.com/vmware/network-config-manager/blob/v0.6.4/meson.build#L119
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/nftables/nftables.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index b0a14bd429..564c08c1b4 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -10,6 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
>  NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>  NFTABLES_LICENSE = GPL-2.0
>  NFTABLES_LICENSE_FILES = COPYING
> +NFTABLES_INSTALL_STAGING = YES
>  NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc

This seems to be based off an old branch, as it applies neither to master,
nor to 2023.08.

Can you rebase and respin, please?

Regards,
Yann E. MORIN.

>  NFTABLES_SELINUX_MODULES = iptables
>  
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
