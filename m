Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE57C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D4B82010;
	Tue,  1 Aug 2023 20:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D4B82010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQtJkBNIhYuU; Tue,  1 Aug 2023 20:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FE381F86;
	Tue,  1 Aug 2023 20:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63FE381F86
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 189501BF3C4
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F56880DC5
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F56880DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2q20YzLtBCq for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:02:02 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D10EF81F33
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D10EF81F33
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:aecc:7f70:551b:efac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 79D2B2003DA;
 Tue,  1 Aug 2023 22:01:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Aug 2023 22:01:54 +0200
Date: Tue, 1 Aug 2023 22:01:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230801200154.GE421096@scaer>
References: <20230731214559.99648-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731214559.99648-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690920118;
 bh=8UY1UwhpS7UdTnCEZbLE+YUCzSPAovsbTGcEtWncUPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KsgOf08Dxc8aP2hRCP67DPRYbQnOlO1ln1QOtnwB2IqfzlawWyFFNzvZqSRnvEO1B
 COTWMsbBQnicCj+3wIrveQskwluxErWuLgmBees+VL1nmJCpEgCGVPKXSVMjdyocmr
 3wjmCtp03B7RbJWpHrykDAhOUBu0NiByKFHlgltgaJKy+YCDrhni+y8ujIXaF3ZriU
 3ZQK5w97fICE3fw14FuG6r0gdd/qDQfnvPqpF10fIiSUNhVc7a4288htWLPXC2Rmar
 evV9O04veI+tkgFgQOzv3iqX2pWtHWWZGN/92sMTDvmthCvvc/J+Lvv8koSNZeDkrI
 jOHy/inJkrhDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KsgOf08D
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: select kdb
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-07-31 15:45 -0600, James Hilliard spake thusly:
> We need to select BR2_PACKAGE_KBD when building systemd with vconsole.
> 
> Fixes:
> systemd-vconsole-setup[129]: /usr/bin/loadkeys failed with exit status 1.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index bea717a456..f3e561e661 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -563,6 +563,7 @@ config BR2_PACKAGE_SYSTEMD_UTMP
>  config BR2_PACKAGE_SYSTEMD_VCONSOLE
>  	bool "enable vconsole tool"
>  	default y
> +	select BR2_PACKAGE_KBD

This is trivial to explain, indeed, but what is not trivial to explan
but most interesting, and as I did ask in my preview mail, is to explain
why:

  - in systemd 252, loadkeys was already needed and called from
    systemd-vconsole-setup (check the code, it was already there in 252
    and most probably even long before that...)

  - with systemd 252, our test cases were not failing, even though
    loadkeys was needed

  - with systemd 254, the same test case now fails.

This we need to understand.

That way, we know if our test was broken, or if the new dependency
should be backported to previous maintenance branches...

(and now I see that Thomas had the same questions).

>  	help
>  	  systemd-vconsole-setup is an early boot service that
>  	  configures the virtual console font and console keymap.
> -- 
> 2.34.1
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
