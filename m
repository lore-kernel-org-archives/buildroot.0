Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D94C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:53:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C34F61B31
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C34F61B31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B903C61790;
	Sun,  3 Oct 2021 07:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4GX043bW_fO; Sun,  3 Oct 2021 07:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1658761746;
	Sun,  3 Oct 2021 07:53:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B08EE1BF5A5
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD0FB426E2
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZ7cZKFthxjN for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 07:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C49DE426DF
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 07:53:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 736DAB00565;
 Sun,  3 Oct 2021 09:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633247595;
 bh=ihxzjNF7LDJXLkbc5G/VumHK67UQqcn+4TS9sl2YfAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6m+Yo+hiDnDkZrijdCTfR+3U74OkXHzzyAEoaDzeETBzrCgNAaii4eHgj1miOZUo
 CmgfQM4H3v39J53Goe7LardEPXaSTgIvcZAuJVu9+De1sIK52qScwlKg9o2qGtwA4j
 4j7fpkdDLapwq9klZu4UdtijqFOSd8Gz3CDNvKsd7HkiCvTDWDExU/AbepdK+vkR9U
 /suUeurH/8sXBb5a3CBmC4NIcGJeR+B/m2yF6GJisrfdSLzcxY5I+VruiGnSLZE+xJ
 qzaA/9/yBhV8W7t2EpWGvwEeBuiMs/mX5OoteJoxCNGpVvR4mmwMh1qMdlECoK4QrO
 Uukpb91Jv431g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 09:53:06 +0200
Date: Sun, 3 Oct 2021 09:53:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20211003075306.GC1504958@scaer>
References: <20211001222952.670649-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001222952.670649-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/lxc: fix typo of toolchain in
 config.in
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2021-10-01 15:29 -0700, Christian Stewart via buildroot spake thusly:
> BR2_TOOLCHAN_USES_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lxc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lxc/Config.in b/package/lxc/Config.in
> index 72b675113d..a3f9be0c90 100644
> --- a/package/lxc/Config.in
> +++ b/package/lxc/Config.in
> @@ -21,4 +21,4 @@ comment "lxc needs a glibc or musl toolchain w/ threads, headers >= 3.0, dynamic
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
>  		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
>  		|| BR2_STATIC_LIBS \
> -		|| BR2_TOOLCHAN_USES_UCLIBC
> +		|| BR2_TOOLCHAIN_USES_UCLIBC
> -- 
> 2.33.0
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
