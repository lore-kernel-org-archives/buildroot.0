Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ADEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0215813BE;
	Sat, 16 Jul 2022 22:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0215813BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDRqArEV0JzZ; Sat, 16 Jul 2022 22:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC0081301;
	Sat, 16 Jul 2022 22:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC0081301
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 499571BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23C6140223
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C6140223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Mrb2wc1kb0Q for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:22:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDB5940239
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDB5940239
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:22:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E38BC780346;
 Sun, 17 Jul 2022 00:22:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:22:15 +0200
Date: Sun, 17 Jul 2022 00:22:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716222215.GQ2543@scaer>
References: <20220716130707.390985-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716130707.390985-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658010140;
 bh=v0KjU/Jm3zRSz3KwZgM6syZPDnhRlcpxFHcNVVYe8tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBdtfna9Pxh5TwxuDK0gNaZZXQ6mziT04Rmq8kBxODnmsF3xh5vsgykUhEMxZhgka
 clBLibXUfy4z8Y1asrH+l2guiTFBIir/dggRLTXUmH4hhg0R1NTZ7QCmH1bcSajhcv
 yLa612oOD9M6zK+QefYqGHtahabTfDEMRHH05Q9nwBS2c/dRFBJ3koNF5SXCJDhrcU
 46WmFjTAxE3EThYiAFE5HXhyCfWiAsg6EWUiXh3vLjJgCg5yx4t0KydGYNzrYS7sUA
 sV2CTXbeyHp4dyU0vj0uiH34ahImr11vvjPmQvoJKJitiehpAKOu9xTPUSCpxw4WnH
 MzAQE1ugAyBLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SBdtfna9
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix
 ifupdown-scripts build
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-16 15:07 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with ifupdown-scripts and
> BR2_PER_PACKAGE_DIRECTORIES raised since commit
> eed183e67e02a35e98fbf6baead9c9ee559b493e:
> 
> ln -sf ../if-up.d/wpasupplicant /nvmedata/autobuild/instance-11/output-1/per-package/wpa_supplicant/target/etc/network/if-down.d/wpasupplicant
> ln: failed to create symbolic link '/nvmedata/autobuild/instance-11/output-1/per-package/wpa_supplicant/target/etc/network/if-down.d/wpasupplicant': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fb35c29a966e21a29df5923e6d27ca372a4b4909
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index afcd6502e3..e5e3938be1 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -260,7 +260,9 @@ ifeq ($(BR2_PACKAGE_IFUPDOWN_SCRIPTS),y)
>  define WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS
>  	$(INSTALL) -m 0755 -D package/wpa_supplicant/ifupdown.sh \
>  		$(TARGET_DIR)/etc/network/if-up.d/wpasupplicant
> -	ln -sf ../if-up.d/wpasupplicant $(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
> +	mkdir -p $(TARGET_DIR)/etc/network/if-down.d
> +	ln -sf ../if-up.d/wpasupplicant \
> +		$(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
>  endef
>  endif
>  
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
