Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9248FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38AE660C27;
	Tue, 19 Jul 2022 16:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38AE660C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCatL3lCPguI; Tue, 19 Jul 2022 16:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D3C960B3A;
	Tue, 19 Jul 2022 16:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3C960B3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E16831BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9A058268F
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A058268F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKVZ3HNxB6Zc for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:33:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71198247F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B71198247F
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:33:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C584113FA3C;
 Tue, 19 Jul 2022 18:33:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Jul 2022 18:33:50 +0200
Date: Tue, 19 Jul 2022 18:33:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220719163350.GN2249625@scaer>
References: <20220719133144.2787205-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719133144.2787205-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658248433;
 bh=0NWPQR4agJ49n50MDv0webyzuyXKs1+uAG2Dg8HZ7DQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Psr97KEVI/8gaEaEqREUqKiMPI72m/B/0dMrMG9919LaEWvLOFZQinKEW1HCqhXby
 hjMsnwmX0K8HR4VKEudPqiDswhZ12O8LYOkQH8DOqYRxnwfDHWbzYt4BT4LPCU7JcP
 uO233HK243dyuSBw//JDqsjtYI6arCFnx7UTjZ844qSerDkz384vNBwYkpRVSvfrxv
 IdHTrt7r2uq/NsPizFYV6LbeKYNwynvYUlwkuxJFvU4EIDGHTxAPRBAOHAFzww2RJ8
 xZSZNFy+D3N1Cod26/rC9wFevhDYNDBoE61O/AGhWekNRMFNRx5541GsFbWN32SqUE
 F47qWd0/6WCMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Psr97KEV
Subject: Re: [Buildroot] [PATCH] package: pcsc-lite: pcsc_demo is under
 BSD-3-Clause and not GPL-3.0-or-later
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-07-19 15:31 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Since commit b01f19fb9361 ("pcsc_demo: change licence from GPLv3 to
> BSD") in pcsclite, the license of pcsc_demo is BSD-3-Clause and not
> GPL-3.0-or-later, so let's update the package license information.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Cc'ing Peter as maintainer of stable branches since this commit can be
> backported to 2022.02.x and 2022.05.x branches since the commit in
> pcsclite is in the tree since 1.9.2 (and 2022.02.x has 1.9.5).
> 
>  package/pcsc-lite/pcsc-lite.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
> index ad34bb4b90..d007d8da2f 100644
> --- a/package/pcsc-lite/pcsc-lite.mk
> +++ b/package/pcsc-lite/pcsc-lite.mk
> @@ -9,7 +9,7 @@ PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
>  PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
>  PCSC_LITE_INSTALL_STAGING = YES
>  PCSC_LITE_DEPENDENCIES = host-pkgconf host-flex
> -PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist)
> +PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (spy, tests), ISC (simclist)
>  PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
>  PCSC_LITE_SELINUX_MODULES = pcscd
>  PCSC_LITE_CONF_OPTS = --disable-strict
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
