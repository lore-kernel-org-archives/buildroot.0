Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9E2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A9B240AAD;
	Sun, 17 Jul 2022 21:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9B240AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNgC7aBzAkHv; Sun, 17 Jul 2022 21:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A292040A8F;
	Sun, 17 Jul 2022 21:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A292040A8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 686A71BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 423D8416C5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423D8416C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHHvMtDWjCyq for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:25:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1483A416BE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1483A416BE
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:25:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6518:6457:938c:3f55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 43C8413FA34;
 Sun, 17 Jul 2022 23:25:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 23:25:40 +0200
Date: Sun, 17 Jul 2022 23:25:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717212540.GB2249625@scaer>
References: <20220717210828.2592538-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220717210828.2592538-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658093143;
 bh=oXfhC4/1Mtrkc05UAY9/iLzbIg2/ufGu5wU05ctpbs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NFRBFnLbBIkHKlDGpMNC8CRCvhUSl+wM0DhIfTgaIIbIhibJuvNqu0YDiVRJL+uqB
 LrfUASfvoVh2bl4BmO7RvfDn8JVTm8rpnv9Z/v9VbKKzJvMc6G0BMuBwlAy3jcW8V6
 vUnhcTy1MAhUlOOJbMNEzVjTrWJ4z55AAFI7aeRXVIcU0gMzkhC1jEh6FH6PVCHlh1
 t/++lobKjI3oc1cjX6u1g4NRGedtIXdg0fDM7+ew7uqiYkFU+OW3BNiikH24Io0ok3
 OLs8HQT5iVEc+AudblcWGTnEO8Gd55rsHppBMWeWr/YxBgVg4ruUvi7h+LioHquC7b
 d6U/nmOmMIwtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NFRBFnLb
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: fix build without linux-pam
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

On 2022-07-17 23:08 +0200, Fabrice Fontaine spake thusly:
> Fix typo added by commit
> 86deafe8635738c3f9efcbda5b22883504d59129:
> 
> make: *** No rule to make target '--disable-pam', needed by '/nvmedata/autobuild/instance-0/output-1/build/lxc-4.0.12/.stamp_configured'.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ce1be5a8152f7c9aa0f6e59abff035f97a3fd423
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lxc/lxc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index abe4f0804a..cece27411e 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -55,7 +55,7 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  LXC_CONF_OPTS += --enable-pam
>  LXC_DEPENDENCIES += linux-pam
>  else
> -LXC_DEPENDENCIES += --disable-pam
> +LXC_CONF_OPTS += --disable-pam

Doh, I did not spot that...

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -- 
> 2.35.1
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
