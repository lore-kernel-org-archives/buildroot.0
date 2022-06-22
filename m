Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24816C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B497F409BC;
	Wed, 22 Jun 2022 20:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B497F409BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_2mM8engyRx; Wed, 22 Jun 2022 20:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 401B440942;
	Wed, 22 Jun 2022 20:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 401B440942
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6919D1BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4359660F26
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4359660F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RdErXmYApyC for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:23:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD07360C1D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD07360C1D
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:23:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d108:8c48:c119:a22b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 17D4FB004EE;
 Wed, 22 Jun 2022 22:23:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 22:23:23 +0200
Date: Wed, 22 Jun 2022 22:23:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas POIROT <ni.poirot@laposte.net>
Message-ID: <20220622202323.GB2608@scaer>
References: <20220622100804.810-1-ni.poirot@laposte.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622100804.810-1-ni.poirot@laposte.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1655929406;
 bh=W1+mDHve0FgtUoeBTIvUFCI81ly8+k1JxKesbnKYjE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RnFLS2YaL/LgSCV8eLTKQbM8EAsyGZn7na/nazEo9dCbv4k0Mhvz58BH6Mjfyj72j
 87nykP+XJyTR7CHhsaSpQuqvDj4b3QEC3E1NvvuSY2EhCLa2ZEloVOa1a1jmsQvYam
 VS1TAeMvE5lI6GKJgL4VHRludcjhgaKbqFDG01GLiVLG78P0GjkTMelp6T/nMMfCc1
 ZbQPUYWK+8TEBf5gnVekjv5q5F3y+j+o+oDkzA53kPHDnUyRRS4tQZNtP9ManGghVA
 emSbR8dtLEXaPQpFuzwcLae/V5kwYfMNx0thIt8M686U0rwWWXjfHquwNn90zuL+9G
 ty2J0vcEHIZUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RnFLS2Ya
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/br2-external: add
 kernel extensions
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

Nicolas, All,

On 2022-06-22 12:08 +0200, Nicolas POIROT via buildroot spake thusly:
> Buildroot documentation section 9.2.1.6 "Additional kernel extensions"
> indicates support for kernel extensions defined in external buildroot
> trees but unfortunately, there didn't seem to be any support in
> br2-external script.
> This patch copies 'init' code support to include external kernel
> extensions defined in 'linux' dir at the br2-external root directory as
> explained in documentation.
> 
> Signed-off-by: Nicolas POIROT <ni.poirot@laposte.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.ext.in          | 3 +++
>  support/scripts/br2-external | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 5b968b0bcb..3cbf42d344 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -148,4 +148,7 @@ config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
>  
>  endif # aufs
>  
> +# kernel extensions from br2-external trees, if any
> +source "$BR2_BASE_DIR/.br2-external.in.linux"
> +
>  endmenu
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 56dc6f53ca..2c33e6eacc 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -163,6 +163,7 @@ do_kconfig() {
>          openssl
>          skeleton
>          init
> +        linux
>      )
>  
>      for br2 in "${items[@]}"; do
> @@ -242,6 +243,14 @@ do_kconfig() {
>          else
>              printf '# No init from: %s\n\n' "${br2_desc}"
>          fi >>"${outputdir}/.br2-external.in.init"
> +
> +        if [ -f "${br2_ext}/linux/Config.ext.in" ]; then
> +            printf 'comment "linux extension from: %s"\n' "${br2_desc}"
> +            printf 'source "%s/linux/Config.ext.in"\n' "${br2_ext}"
> +            printf '\n'
> +        else
> +            printf '# No linux extension from: %s\n\n' "${br2_desc}"
> +        fi >>"${outputdir}/.br2-external.in.linux"
>      done
>  
>      printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
> -- 
> 2.36.1
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
