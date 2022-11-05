Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41136C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B2460AC6;
	Sat,  5 Nov 2022 18:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B2460AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUH41oehQxiL; Sat,  5 Nov 2022 18:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA3060A94;
	Sat,  5 Nov 2022 18:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA3060A94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1521BF3D6
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49C2981DF5
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C2981DF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0w3Y9X19X0hD for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:47:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C86B81DF4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C86B81DF4
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:47:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8758F5FFA7;
 Sat,  5 Nov 2022 19:47:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 19:47:16 +0100
Date: Sat, 5 Nov 2022 19:47:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221105184716.GN3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-3-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031174632.377586-3-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667674038;
 bh=3Ak5sNkcaCumjDFutHX19LBCOnDJOS1xG1pfVYGvSMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n5Dm+qYkH7V3VRr38e1/EK/GwMiwZxEaReUrfgeDhkIUsBZ5S35s8JL67UeV9UhQy
 OCV2s6LBwB2RbD1Gko+x+ddYV+ZolK7Wc/FQX1mdT85K+YAhHDLwGchde480ek+yGG
 LLIilpfweaFjr6nPmp69o9LfGIDZnL0dp9+3poEfYIcjazYdEC9u/L5S5Mv4dCw3mm
 5GqN+ku6xhBoZq4qORsFgOj/FEN3Py4X6/bVPWoE4Z/6K5+qHiY99wi7Jzu+SBwhqc
 wWpPvApS0llPFDhFhoosBl2Vo4ot7vd7f+ltz7vdxq27ZuDkOsImJX7YfvDZejJbMv
 52TNc+DWiZCOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n5Dm+qYk
Subject: Re: [Buildroot] [PATCH 2/3] package/ssdp-responder: minor update of
 help text
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

Joachim, All,

On 2022-10-31 18:46 +0100, Joachim Wiberg spake thusly:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ssdp-responder/Config.in | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/package/ssdp-responder/Config.in b/package/ssdp-responder/Config.in
> index df57546eed..8b5dfe67a6 100644
> --- a/package/ssdp-responder/Config.in
> +++ b/package/ssdp-responder/Config.in
> @@ -7,14 +7,16 @@ config BR2_PACKAGE_SSDP_RESPONDER
>  	  targeted more at embedded systems that need to announce
>  	  themselves to Windows systems.
>  
> -	  ssdpd is a stand-alone UNIX, no external dependencies but the
> -	  standard C library.  It has a built-in web server for serving
> -	  the UPnP XML description which Windows use to present the
> -	  icon, by default an InternetGatewayDevice is announced.
> +	  The project consists of ssdpd and ssdp-scan.  The former is a
> +	  stand-alone UNIX daemon, it has no dependencies but a standard
> +	  C library.  It comes with built-in web server for serving the
> +	  UPnP XML description on port 1901, the XML is used by Windows
> +	  to present the icon, by default an InternetGatewayDevice is
> +	  announced.
>  
> -	  Also included is ssdp-scan, a tool similar to mdns-scan, which
> -	  continuously scans for SSDP capable hosts on the network.
> -	  Take care only to use for debugging since it scans the network
> -	  quite aggressively.
> +	  ssdp-scan is a tool, similar to mdns-scan, to find other SSDP
> +	  capable hosts on the network.  Take care to only use it for
> +	  debugging, or quicker device discovery operations, since it
> +	  scans the network quite aggressively.
>  
>  	  https://github.com/troglobit/ssdp-responder/
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
