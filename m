Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E960C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38E440982;
	Sun, 20 Nov 2022 09:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38E440982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLaCdNRjizst; Sun, 20 Nov 2022 09:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A4B4098C;
	Sun, 20 Nov 2022 09:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A4B4098C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5E971BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEBBF404ED
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEBBF404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGpr_VMRRM8t for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:05:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CBA840143
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CBA840143
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:05:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4A85FB0053D;
 Sun, 20 Nov 2022 10:05:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:05:46 +0100
Date: Sun, 20 Nov 2022 10:05:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221120090545.GP2123054@scaer>
References: <20221119134510.826956-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119134510.826956-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668935148;
 bh=RmtTWNsFD8MpWwJLeE+BDE/rSLZycpCW5BaHSfhtXP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=te8XTetnZeMyU+7hU6AVOaQ4v5Eni/4xblPnpJqvPA18DcFhD1eT9RlDPFdnL0ImA
 F8IPP3QK/C0khwASkhBf/5AxRliFtO2enKwecarHPih1s6qG36LQoap+E1L1Hewfyc
 CRAyx028QujDMH4qpuhSvbj6EWzoSWxVpOAXk53yigi72td2LDlZg4lh72k1kT7MLQ
 jveBIYL5wlshejGbI8d0XteZTTayBiu/EEmqFNihuvAFeezDOAOY2SH3Lm4c3lf3RZ
 6YKlY+ikjRzGJ43v9IsXIhz6PXOOZUZY6s4jD+PewMIoAd7zC3OEGrGcZ9NQSuQAO0
 xrXQcTjyuXvWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=te8XTetn
Subject: Re: [Buildroot] [PATCH] package/xterm: security bump to patch 376
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

Peter, All

On 2022-11-19 14:45 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issue:
> 
> CVE-2022-45063: xterm before 375 allows code execution via font ops, e.g.,
> because an OSC 50 response may have Ctrl-g and therefore lead to command
> execution within the vi line-editing mode of Zsh:
> 
> https://www.openwall.com/lists/oss-security/2022/11/10/1
> 
> Additionally, patch 376 fixes a null pointer access issue:
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1022942
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xterm/xterm.hash | 2 +-
>  package/xterm/xterm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
> index 3f6ec765ce..12cd2e639b 100644
> --- a/package/xterm/xterm.hash
> +++ b/package/xterm/xterm.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  32f888277b19e28ebc0a3112bff000607c07bed0679caa0beebb36f9cad484f5  xterm-371.tgz
> +sha256  1e5bb7aad068fb31d6d3cbb77f80c7ad1526cd4c956a4ddcf2c5cf28af5334e1  xterm-376.tgz
>  # Locally calculated
>  sha256  9521ef761474cd31ea406f56a751646a7b42a9287cdc6f2f8e52ed4c4d2a73e7  COPYING
> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
> index 95984f1cf9..d01b608d99 100644
> --- a/package/xterm/xterm.mk
> +++ b/package/xterm/xterm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XTERM_VERSION = 371
> +XTERM_VERSION = 376
>  XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
>  XTERM_SITE = http://invisible-mirror.net/archives/xterm
>  XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
> -- 
> 2.30.2
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
