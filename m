Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5BDC433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 18:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 466F783FF1;
	Fri, 21 Oct 2022 18:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466F783FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vYhNQAc3eFE; Fri, 21 Oct 2022 18:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 507F383F06;
	Fri, 21 Oct 2022 18:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507F383F06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9421BF25F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5763083E48
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5763083E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjCikAP0eU1w for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 18:59:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 075C283EAA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 075C283EAA
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 18:59:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e722:2033:afe6:a970])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AC9125FFAD;
 Fri, 21 Oct 2022 20:59:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Oct 2022 20:59:17 +0200
Date: Fri, 21 Oct 2022 20:59:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <20221021185917.GB2992523@scaer>
References: <27279_1663677903_6329B5CF_27279_384_1_a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27279_1663677903_6329B5CF_27279_384_1_a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666378761;
 bh=tvMpmNp3S1FGvAk1pTcEa7Zz9ReJzShYZPwBFtnr1yc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mRqTUy4C+q12RB0pvdGyVdzD6uPJMKV88CujYMjPVlxC5cfkVOLc1phonOwJW6/yZ
 0awk7DvfwVvj9bpHpdPcOAfMp+p3UIMC6DorpJTU/Vzd5iaPc75ppuK7LNwekl42Fm
 TwgObK9IqzYJOQXRzXOMfyhYe5koURMhbcGc5gFpWNsa1fHxzBIeRKcWqtk1fGCt9F
 PWNLhRfnaJhQNzpxnbuWlOusbgahoB53MpCuuBol6PxFsnh5tDCVLE10Kuj0TCfWZb
 ED4tIWLGSZ+ro2WVFytJESMT2IIm7qnNn+VRufqoFdwoaEp2KZS2BerozTBhzPB8kr
 +vqdqA4xTuPVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mRqTUy4C
Subject: Re: [Buildroot] [PATCH 1/2] package/gpsd: drop legacy cleanup
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 2022-09-20 14:45 +0200, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Since gpsd-3.22, the systemd service files no longer contain hard-coded
> paths to /usr/local/, but use @SBINDIR@ which is replaced appropriately
> at build time, and contains the correct path.
> 
> Drop the legacy fixup now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gpsd/gpsd.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 0c7018f26d..b8526c0260 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -213,14 +213,6 @@ define GPSD_INSTALL_INIT_SYSV
>  	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
>  endef
>  
> -# systemd unit files are installed automatically, but need to update the
> -# /usr/local path references in the provided files to /usr.
> -define GPSD_INSTALL_INIT_SYSTEMD
> -	$(SED) 's%/usr/local%/usr%' \
> -		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service \
> -		$(TARGET_DIR)/usr/lib/systemd/system/gpsdctl@.service
> -endef
> -
>  define GPSD_INSTALL_STAGING_CMDS
>  	(cd $(@D); \
>  		$(GPSD_SCONS_ENV) \
> -- 
> 2.25.1
> 
> 
> _________________________________________________________________________________________________________________________
> 
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
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
