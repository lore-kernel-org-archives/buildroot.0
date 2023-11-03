Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64670C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FA360BE5;
	Fri,  3 Nov 2023 22:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11FA360BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_Xvsqu3QS8g; Fri,  3 Nov 2023 22:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29AAB60BD8;
	Fri,  3 Nov 2023 22:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29AAB60BD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3633F1BF5F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F17E41B88
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F17E41B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjQ38fuxzxjf for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:16:50 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E451A41B58
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E451A41B58
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:207e:5629:5034:6d7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C5501B00548;
 Fri,  3 Nov 2023 23:16:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Nov 2023 23:16:44 +0100
Date: Fri, 3 Nov 2023 23:16:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103221644.GE2875@scaer>
References: <20231103215345.25210-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103215345.25210-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699049807;
 bh=5xdwfuU7oh6KnUTHRJVbzxiorgOaFIYBmsKya1tctNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iR7o4Hq1msk6p+ALDrRCvyS463MYnoJmtUEv+lHZUu6hJ2hnVJxCMa/mPzPHnnrps
 Z9B8lF0/0vH8vuTPvjbfkaC1LBXVmRrv49CeeNFbiCZYPRpK57nC1YmtN1ce0l3RZK
 UFMXxkTY2BTqr8yGtliWD+PdTZZKn3q+u2TrxEA5raUHAQWRC3thAYw2S/QAisSTqV
 toOxcYp5gZ6Ams81tcGbENEslbbFW/MSR6SxGVDkxjXyw770lAhA0oy0oH7i0EnLsd
 vBjV5sQ0wHlBDLXI1OBgAcPRE+shbZPE/W4MPdj0TN9d1LqCIGCkbpX6vtS7fgZY2Q
 RgiRuG6ZLqGCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iR7o4Hq1
Subject: Re: [Buildroot] [PATCH 1/1] package/mender: add MENDER_CPE_ID_VENDOR
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-03 22:53 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:northern.tech:mender is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/F90CE0C3-FCE6-40AA-8C0D-EDE2C81BD67B
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mender/mender.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index 724295f784..ee1398244b 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -7,6 +7,7 @@
>  MENDER_VERSION = 3.4.0
>  MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
>  MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
> +MENDER_CPE_ID_VENDOR = northern.tech
>  
>  # Vendor license paths generated with:
>  #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
> -- 
> 2.42.0
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
