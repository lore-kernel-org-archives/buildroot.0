Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51277C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D9B8124C;
	Wed, 26 Oct 2022 13:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D9B8124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzRq3xgFUG0t; Wed, 26 Oct 2022 13:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1864C81076;
	Wed, 26 Oct 2022 13:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1864C81076
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5861BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45FB4402EF
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45FB4402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAqkgEa0I4GM for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:31:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B000401FF
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B000401FF
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:31:26 +0000 (UTC)
Received: from opfednr04.francetelecom.fr (unknown [xx.xx.xx.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr23.francetelecom.fr (ESMTP service) with ESMTPS id 4My8ph1H0hz5vxG; 
 Wed, 26 Oct 2022 15:31:24 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 26 Oct 2022 15:31:22 +0200
Date: Wed, 26 Oct 2022 15:31:22 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <7333_1666791084_635936AC_7333_90_1_20221026133122.GF1657509@tl-lnx-nyma7486>
References: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666791084;
 bh=sXI2T+vWqe77x2AaHchGVct+gQ2utRe1lyPJOQDYVM8=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=A6/Q7zsydi2OYjPQvw2n/BmxCGOZNE/VjXUIteuwO+ONMpTErY+HnyFfR/fnks0wB
 9H9dwkypqGiU1ESBZN4kylbsm3LSEMKHtkKygP2Ma8qw63yt/reKlcoHmAySjlnyjj
 LuLO8CwE8xasbh/83nAg/dcMYvdnOoEsYBp00jdD8CdZJvWh92oEZe1KrRjOYYNRnx
 cAYmy0Q2Nlu9BKxRedWWEtxG0lhtPCeRz4ugNpsyTfbD94wdngUhloVkphUF80A5qI
 YllUOxcBAwf97R53Eg1rft3kC76sIiKgRxi/EHsIOR+0ZKGM0MnYewky3Uajj196Qq
 GhAr1lpsZ5F0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=A6/Q7zsy
Subject: Re: [Buildroot] [PATCH] package/musl: fixup the dynamic loader
 symlink
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
Cc: hello.skyclo@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-10-26 14:58 +0200, Thomas Petazzoni via buildroot spake thusly:
> The musl Makefile installs the dynamic loader as a symlink to libc.so
> with the following rule:
> 
> $(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
>         $(INSTALL) -D -l $(libdir)/libc.so $@ || true
> 
> While it works, the drawback is that ld-musl-<arch>.so ends up being a
> symlink to /lib/libc.so. While it works on the target, it means we
> have a broken symlink in $(STAGING_DIR) and $(TARGET_DIR) as
> /lib/libc.so doesn't make sense on the build machine.
[--SNIP--]
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 44c79da6f7..30c3c2fbc0 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -60,12 +60,14 @@ endef
>  define MUSL_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(STAGING_DIR) install-libs install-tools install-headers
> +	ln -sf libc.so $(STAGING_DIR)/lib/ld-musl*
>  endef
>  
>  define MUSL_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR) install-libs
>  	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o rcrt1.o Scrt1.o)
> +	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl*
>  endef

What about external toolchains?

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
