Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A61EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 08:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98EC340463;
	Sun, 20 Nov 2022 08:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98EC340463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5C7pzuz7Eh30; Sun, 20 Nov 2022 08:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B276440143;
	Sun, 20 Nov 2022 08:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B276440143
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE8F11BF20D
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 08:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 971198145D
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 08:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 971198145D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAFM7i8g_oxO for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 08:59:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 752F9813F6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 752F9813F6
 for <buildroot@busybox.net>; Sun, 20 Nov 2022 08:59:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 28CE8B00579;
 Sun, 20 Nov 2022 09:59:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 09:59:17 +0100
Date: Sun, 20 Nov 2022 09:59:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20221120085917.GM2123054@scaer>
References: <20221115162705.27235-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115162705.27235-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668934760;
 bh=MubJ5tlZNVwMRxNsNHY9Ae2eBy4Gm1JwifpZ7Saakvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hN6JeAvjLOJr/6mCEsJUOxWnozfAfHiVjZg6V3Sdcm35oZ4vSVYMv70Z+e+CguXcm
 ZvTEfVthT+5e0gAaIDHHqyvbSmvGCIe3QvsCpmkOnUrUYce1NW2KYZKZ1EBbZVZehc
 OFONHtuArtX1djD6FAWmJpfEOMVBs1PAjngL5kw78mqS00vubg4gsD9sCqvGy+fUKD
 3EuQeN4WUOXUpNvWiJw/KBYbftH5OhvDyAMZSRt+UvpG6tcE09vvAMaPJq8qStSSMj
 0kjuePDwTGHvyOLBG9PCQDpz8IBIAUSePvNkS2Vknt8bCBa5sMDsGU4iXsGlQVrGx2
 YydZB2Zcln8ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hN6JeAvj
Subject: Re: [Buildroot] [PATCH 1/1] package/libksba: security bump to
 version 1.6.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-11-15 17:27 +0100, Michael Fischer spake thusly:
> A severe bug has been found in Libksba , the library used by GnuPG for parsing
> the ASN.1 structures as used by S/MIME. The bug affects all versions of Libksba
> before 1.6.2 and may be used for remote code execution.
> 
> Fix CVE-2022-3515

This CVE is still marked as "RESERVED" in the CVE database:
    https://www.cve.org/CVERecord?id=CVE-2022-3515

But the explanations (as you quoted) are now public:
    https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3515
    https://gnupg.org/blog/20221017-pepe-left-the-ksba.html
    https://dev.gnupg.org/T6230

Funny. :-)

> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libksba/libksba.hash | 2 +-
>  package/libksba/libksba.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
> index 422048be5f..77485c0cb6 100644
> --- a/package/libksba/libksba.hash
> +++ b/package/libksba/libksba.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b  libksba-1.6.0.tar.bz2
> +sha256  fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971  libksba-1.6.2.tar.bz2
>  
>  # Hash for license files:
>  sha256  8f1b87e551d97b2b23b6d3403a5d598c63ea89824cb8ee351f631f6cab2beaa5  AUTHORS
> diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
> index ca5fc1d749..3a8b3fa502 100644
> --- a/package/libksba/libksba.mk
> +++ b/package/libksba/libksba.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBKSBA_VERSION = 1.6.0
> +LIBKSBA_VERSION = 1.6.2
>  LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
>  LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
>  LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
> -- 
> 2.20.1
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
