Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2734FC433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A75374097B;
	Sun, 20 Nov 2022 09:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75374097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hNe_VIJ2cOW; Sun, 20 Nov 2022 09:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA654097E;
	Sun, 20 Nov 2022 09:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA654097E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 309C31BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BCB460ABD
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BCB460ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DzhK-5_6TtPD for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:05:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E37CA60ABB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E37CA60ABB
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:05:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C3BDFB0058E;
 Sun, 20 Nov 2022 10:05:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:05:23 +0100
Date: Sun, 20 Nov 2022 10:05:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221120090523.GO2123054@scaer>
References: <20221119105035.415243-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119105035.415243-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668935128;
 bh=UFQ3L6D+OtyK5q0Mou0yzuROz3DKrVexeOaS8yI+Bow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WRrPgmvPmpEbygs/jAxb2RR2hEX+j22MzSQhqd+svlg0caFvaYaSVnUcaXf8FcZDC
 KHpirSl83lLNP0bMFGpqqd19c+zmCE8/Ke9E6bcm6Qncbf8x1qiu1tvPO3Bcp9Vc2G
 jIruD84710u4gEjBQDpM6ATUmNzp5r25o1K+BSyr2NxNOdtVrDfgB70z2CWchmabse
 T/Elg7uW8IpC1PGv0BLh01ujAi0mq3A+YxZFUFyGm6Yhj1eaJNspiLMkDeBhfrInn1
 J2qDccjfm6GOmYaZJC/6fM/ATIgnSqAtT0pOIVo+6vye/rUkOsJFb00maOJxnY316b
 1JHMRVdmswQQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WRrPgmvP
Subject: Re: [Buildroot] [PATCH] package/xen: security bump to version 4.14.5
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-11-19 11:50 +0100, Peter Korsgaard spake thusly:
> Includes a number of bugfixes and the security fixes up to xsa-400:
> https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-5/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xen/xen.hash | 2 +-
>  package/xen/xen.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> index a81d05e3f7..5637f0e8d9 100644
> --- a/package/xen/xen.hash
> +++ b/package/xen/xen.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  e76d56dfcdabf5d80aa06819f44472de49526a518dbb483eb08e7ff9aec2c669  xen-4.14.4.tar.gz
> +sha256  a1a24092ad14658eed420b7d56b67d0d9d5b314e96c30a799b45f3a721f98bf0  xen-4.14.5.tar.gz
>  sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 03341d4275..169753e89f 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XEN_VERSION = 4.14.4
> +XEN_VERSION = 4.14.5
>  XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>  XEN_LICENSE = GPL-2.0
>  XEN_LICENSE_FILES = COPYING
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
