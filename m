Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA73CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92E461103;
	Sun, 17 Sep 2023 12:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A92E461103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gF8Om4tCE3Ck; Sun, 17 Sep 2023 12:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E006261112;
	Sun, 17 Sep 2023 12:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E006261112
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1508C1BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F04A640531
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F04A640531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Es5KN2RKTape for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:48:48 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F337940111
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F337940111
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2D848B0054E;
 Sun, 17 Sep 2023 14:48:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:48:42 +0200
Date: Sun, 17 Sep 2023 14:48:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230917124842.GW415981@scaer>
References: <20230917120613.63980-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917120613.63980-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954926;
 bh=OYLNwGTtTiUr+oF68YqpxRgRoEYplDViAfdMaSu9LdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uhCGmvCfnTOX7OeSrdT201OmeBM9hn0UuGPm+WNQcyDkt1rnG6b+6XxUCLuWXOrh1
 ca1ytUeXs3Tw7evlBWeKd2lepsHvEUS+u6FQksTQ7gNy35Z4VDQMCJW/ubt6e3P7Xb
 8G2q9nuoVqCNZe3RPcPwC1GAkRUBslZmLVRZ4/Xyuns3HWEnmGUvXG8g+Bz67gJKcb
 KED4ALzdLVUFtEmpm4J7vzj6k6lVvDtnDmDkThW9bDKNTOhOsVrzhUdEhG+C6/jyMq
 PvAFmltQATkekRAwcm7KVJRb7seZNIbSS68FXfk1t0gW9F9wAH7zg08WCbeqcS76MO
 3eJx34TuVq9Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uhCGmvCf
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.11
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-17 14:06 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2023-26463: strongSwan 5.9.8 and 5.9.9 potentially allows remote
> code execution because it uses a variable named "public" for two
> different purposes within the same function. There is initially
> incorrect access control, later followed by an expired pointer
> dereference. One attack vector is sending an untrusted client
> certificate during EAP-TLS. A server is affected only if it loads
> plugins that implement TLS-based EAP methods (EAP-TLS, EAP-TTLS,
> EAP-PEAP, or EAP-TNC). This is fixed in 5.9.10.
> 
> https://github.com/strongswan/strongswan/blob/5.9.11/NEWS
> https://www.strongswan.org/blog/2023/03/02/strongswan-vulnerability-(cve-2023-26463).html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/strongswan/strongswan.hash | 6 +++---
>  package/strongswan/strongswan.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
> index 4822f9152f..de8f18747a 100644
> --- a/package/strongswan/strongswan.hash
> +++ b/package/strongswan/strongswan.hash
> @@ -1,7 +1,7 @@
> -# From http://download.strongswan.org/strongswan-5.9.8.tar.bz2.md5
> -md5  f46b0d3e7aed88824650d0721c887443  strongswan-5.9.8.tar.bz2
> +# From http://download.strongswan.org/strongswan-5.9.11.tar.bz2.md5
> +md5  673e194cd256af77b46928179f2c81ad  strongswan-5.9.11.tar.bz2
>  # Calculated based on the hash above
> -sha256  d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c  strongswan-5.9.8.tar.bz2
> +sha256  ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d  strongswan-5.9.11.tar.bz2
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index cae1433e39..6058631696 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STRONGSWAN_VERSION = 5.9.8
> +STRONGSWAN_VERSION = 5.9.11
>  STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
>  STRONGSWAN_SITE = http://download.strongswan.org
>  STRONGSWAN_LICENSE = GPL-2.0+
> -- 
> 2.40.1
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
