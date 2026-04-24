Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D92FED3CF
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 14:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE52084B63;
	Fri, 24 Apr 2026 14:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5eOlPculo9z; Fri, 24 Apr 2026 14:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5BC084B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777039875;
	bh=k+u/72k5URk2FkbnEILNT9NRPMOZ2vgnFoSK+E8CAww=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N6UQAtCXTVRScVw+5AwumqVZW09G60zKPD01Em0DikGmBjEqSAb+HqPkh8+wB0Y9E
	 +MX+/qTC75+hwS3sXapqLNrSyCHa+5nzHc+f50n944kqHCPn/kYFTpRywpvoZ14FRh
	 gzFUwp7adhXHnhoreyV5KWu1AnrDkJeKaBXx9hwIqDFqeBh8WoIC1QDa9kcis+4ufE
	 hBAkqzqbK//yQB9V3MJ4iVfOGdF/iK5g3ZpdKQvTXsUl8Ze5zbjRT4p14mocbCzZiB
	 CgaXO1LVqJwnk/+pE52TI//Powlfi43jnGleo6DebLoCGvl2BTbvLY9i8yjmHmLVQO
	 9fMicxFVF2tbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5BC084B7B;
	Fri, 24 Apr 2026 14:11:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86C8E206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 14:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6361A84B7B
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 14:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmpZSzMAXOzr for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 14:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A48D084B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A48D084B63
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A48D084B63
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 14:11:12 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A46F3440E97;
 Fri, 24 Apr 2026 17:11:06 +0300 (IDT)
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Ismael Luceno
 <ismael@iodev.co.uk>,  Romain Naour <romain.naour@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260424132326.825570-8-jeanmichel.hautbois@yoseli.org>
 (Jean-Michel Hautbois's message of "Fri, 24 Apr 2026 15:23:22 +0200")
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-8-jeanmichel.hautbois@yoseli.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Fri, 24 Apr 2026 17:11:07 +0300
Message-ID: <87mrys30uc.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1777039866;
 bh=hImOFwh/A3oowwAxTafrf5cfu1IC8p7Hwp2Q2KWAhRw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HDUElYehTyO7/jSEDWelOv9VnZIzsFWQ7DtPntDD8cVM3uOSE36pTIFe5FKYfnuIP
 2PbczjdzIw+G6tTGP2f+zUKiVDbCyJ4bww1431C5bsFXbcRtp+5BJZJPGDhmKg9dIf
 mSL8u3NshKQyhky3I492+na9GQqYGsc8BaYO/duh35epZmYwzI6crsJTiYayET0jca
 6UHRsCSjdfiddgHcoOdBP84h+ZgKo/W239JXshfeddHNJzzhFu2nkAJ/2poumgKmcN
 48hG8QTBZkRJhGSw1XZFGLBay1vamKq1BsgL5h+GTZ9rL0XII7r3Qs5wKvpskq6y2H
 5RsQxNnpRoZ9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=HDUElYeh
Subject: Re: [Buildroot] [PATCH 07/11] package/dropbear: disable ML-KEM768
 on m68k
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jean-Michel,

On Fri, Apr 24 2026, Jean-Michel Hautbois wrote:
> ML-KEM768 post-quantum key exchange code (in the vendored header
> src/libcrux_mlkem768_sha3.h) triggers a GCC internal compiler error
> (ICE) in cselib_record_set during the postreload CSE pass on m68k.
> Reproduced on m68k-buildroot-linux-uclibc (cf5441x, -O2) with both
> GCC 14.3.0 (the current Buildroot default for m68k) and GCC 15.2.0.
>
> The failing pass backtrace is:
>   reload_cse_regs_1
>   -> pass_postreload_cse::execute
>      -> cselib_process_insn
>         -> cselib_record_sets
>            -> cselib_record_set  (cselib.cc:2869 on gcc 15)
>
> Disable ML-KEM768 via localoptions.h on m68k until the GCC bug is
> resolved. Standard key exchange algorithms remain available.

Common practice for GCC bugs is to add a BR2_TOOLCHAIN_HAS_GCC_BUG_[id]
config symbol to toolchain/Config.in, and use that symbol to activate
bug specific workaround. [id] refers to GCC Bugzilla bug ID. This makes
it easier to track the GCC versions this bug affects.

baruch

>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  package/dropbear/dropbear.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e4e42cf994..52bc15e346 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -62,6 +62,13 @@ endef
>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
>  endif
>  
> +ifeq ($(BR2_m68k),y)
> +define DROPBEAR_DISABLE_MLKEM
> +	echo '#define DROPBEAR_MLKEM768 0'               >> $(@D)/localoptions.h
> +endef
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_MLKEM
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
>  define DROPBEAR_ENABLE_LEGACY_CRYPTO
>  	echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
