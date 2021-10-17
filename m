Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F90C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:22:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB0660F59
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAB0660F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8090A4029F;
	Sun, 17 Oct 2021 20:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKXN0jCOM4iP; Sun, 17 Oct 2021 20:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC01402B7;
	Sun, 17 Oct 2021 20:22:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1BF21BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD76D606E7
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOIByhxKRaSS for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:22:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A3A605D6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:22:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 179F978031A;
 Sun, 17 Oct 2021 22:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634502167;
 bh=hBWgsAsv93DFXoc1SiL0yepZd1HUV8XUbH1oGDyDuG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I07/pYjRZH+S2+YaH4k6k0guZbXXkM8nn+TaYQmKh7KQ3qqJ5VVoCItjzw4UiIkEa
 er37m3+tXzoLz+tg5VOh+OfH3ubKJXmmPxMLhHrZbf1Rv3x62UdVsQU1/2w9+AWtNI
 uIG/qSlvURvo9Im3CT9JmG+UtMHR87mUf5T7ghw6J7EgYhZVTvwIMY+V0+8xlT8BIW
 7qXpkMJRAd+x28COaTFmeklkXynp2jE7J6P8Cg9GAq0Jhe3cK/qcUmMoU606FsR012
 LhzIcVtHz5fVcUUpyr9PuYkSrR05+Xbj3tdVlr4BCXNTFmM2U71BBpXrxGTtTuqGiA
 kbmF88kNeOWjQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 22:22:36 +0200
Date: Sun, 17 Oct 2021 22:22:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211017202236.GP2400@scaer>
References: <20210921202137.7092-1-ps.report@gmx.net>
 <20210921202137.7092-5-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921202137.7092-5-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 5/6] package/rpi-firmware: convert dtb
 overlay install loop to make-level foreach loop
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
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-09-21 22:21 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - new patch
> 
> Changes v3 -> v4:
>   - no changes
> 
> Changes v4 -> v5:
>   - rebased
> ---
>  package/rpi-firmware/rpi-firmware.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index f9568ba50f..13ca3c23a2 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -43,9 +43,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
>  define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> -	for ovldtb in  $(@D)/boot/overlays/*.dtbo; do \
> -		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
> -	done
> +	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
> +		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
> +	)
>  endef
>  else
>  # Still create the directory, so a genimage.cfg can include it independently of
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
