Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F146C001DE
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 19:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5781613CD;
	Fri, 11 Aug 2023 19:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5781613CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFDTted3VFaY; Fri, 11 Aug 2023 19:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE26613C1;
	Fri, 11 Aug 2023 19:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE26613C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24A6C1BF616
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 19:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21D6613C1
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 19:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21D6613C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-j2Mt3JR_RP for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 19:22:25 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22FE160E03
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 19:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FE160E03
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.174]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hzj-1pl8ig0hTr-011mY8; Fri, 11
 Aug 2023 21:22:21 +0200
Date: Fri, 11 Aug 2023 21:22:20 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230811212220.52d4ffb9@gmx.net>
In-Reply-To: <20230811000738.0c613b1e@windsurf>
References: <20230211163422.25944-1-ps.report@gmx.net>
 <20230811000738.0c613b1e@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:E4HlA+C1m3S5kbbGbksXW3WkgvYg4PuU+KVWDHku7DlcqD/rcBM
 Qv+SmKvMqX7C6t97Y9s9QRIuzqKE0doEhRVzUUaEXT41XaH9YnthlNPP/xwpbflMV5M5KIe
 TAHXpFp0Uk9pI3f+U24k5S6Iy1AIrSIojhKo/LS3cUzH9PKD+00U3qTYiOkWUNJ5R0WAhPy
 1mBYjVS1mhxZL10h3yWqQ==
UI-OutboundReport: notjunk:1;M01:P0:QmG2SOPlQlA=;dZchgcwJhqQq4MYRW/NWETrVQaV
 nDbf5+Meahc9wwLzz8YboLDrpvyAkU+K+fykmQxSfA8v384l/mgNEbiAYyzgkH/l3HTUfM20I
 p4Z96VtGP4pHpPEaX7++1hmhMyL3kNYu2/Dg9HlARByj3u4W6ZLHuAOCdEz9k/gulHaouaKq5
 9xADUmLd90HtZKqvpLXoE80Mrop6DbQ+oyPply7pyHuvi/PuK2XOjt0W3hqnVIWLyvlsfWBbm
 MlWBG/KgsQCcY/nQpG2p0CeQRn547IMIINZ0F29Ty/9eDQS7Qm8ez+oBylGw50tsdKrOqeiyG
 bytFLFD74PW/iD8qMcRZP3y8ppPp5ZPMbUVd7wjjlkz7WTR9tZqhXGhftrS5pPmGIkaNrNUg3
 T/KOGmnxkAaClmmEjcPiaOnVdpKjU7x31zG1j/9jnN4QRHwGkuLK9gnqw1ql5WhK/9+z3+81B
 hx23esqAsVSj+bX/IU5hRsSwFqFeJX93SWhiLFV2Q8wPt2/o0nKmSh3nsESSL/OopB2Rowywj
 aKBr8BqjhdxLt0GkxUqbd02pbiUtFeu2JmKA8UXPbaAFtt06i2XrR85GzescMnmpquKRjP/5p
 6tHSmWWUp0i5htEUU4DAFsVZXoI4QcpTh71NhYeVNFoFgHaVeeWo9LoRxQanS4den2fm/FcDp
 Se+Ojf7p0VJXdJ7/12TQN1hRnShVLVIvT3ykvtIAr/eS0RfU7ERGKDbTq3R23ChOxkrDng9JO
 2hwJCbZEZYaLIPO1RPiC7KNxu6Yb/364rKn0+EdLayJIM/1PAgjVi7qsYPm8KUfuCSSHyyGU2
 mu1T6aDmYUUooYovXps7L3IJGujIyg8kmqSvcy0CfXwbSvrqUQKEiMMt4rCqVm7UL4dA0djHR
 i2Qi9tme337WBaHq0C16te8Gu8uOPYof0reNpzmXedVJzX/DeA10Fl0kKlrEm1wYP8K5k1Qbh
 V47Q6ah9KGip6JV0+/bzeqkWRuM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691781741; x=1692386541; i=ps.report@gmx.net;
 bh=na17d13K/CNoBeHOsP0uBLk0F2N8n5fbfUxAIZNiCOU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SN8VCiEiLiocymR3sxgqTEPBrH41NlmvDI51k495l5XnJ120yt3QXj/q/ZzjsdU4EogpE59
 4pIkIOcEGwNeK/sHUtqzM69g4AqxA6VZyHOAbzK400uTGZCYcw1urnh0aXamRw6ILYIRODd7W
 HC6RXWhufCAEkVITfWFygLntS3EQPtzDNod1vK5ofesoSNyr87UNcTnC3I/kkMBh3JBAAPdLd
 DkV07unuTAFUBx09HAFXlXVq5ciNBrkh/sX2P+IEiytkj301AoXFNnfvC2MPgVG32wwivDzaV
 yZI5ijmVlzLfQ5XoQFHlZKIxm5dyjFdn+hd4kmZIlJnkxXk8xD/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=SN8VCiEi
Subject: Re: [Buildroot] [PATCH v1] package/fft_eval: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Fri, 11 Aug 2023 00:07:38 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Sat, 11 Feb 2023 17:34:22 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> I have finally reviewed your patch and applied to next, with some changes. See below.
>
> > ---
> >  package/Config.in              |  1 +
> >  package/fft_eval/Config.in     | 13 ++++++++++++
> >  package/fft_eval/fft_eval.hash |  5 +++++
> >  package/fft_eval/fft_eval.mk   | 36 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 55 insertions(+)
> >  create mode 100644 package/fft_eval/Config.in
> >  create mode 100644 package/fft_eval/fft_eval.hash
> >  create mode 100644 package/fft_eval/fft_eval.mk
>
> I've renamed from fft_eval to fft-eval, as we prefer - as the separator
> in package names these days.

O.k.

>
> I've added an entry in the DEVELOPERS file as well.

O.k.

>
>
> > diff --git a/package/fft_eval/Config.in b/package/fft_eval/Config.in
> > new file mode 100644
> > index 0000000000..4b6aa9b388
> > --- /dev/null
> > +++ b/package/fft_eval/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_FFT_EVAL
> > +	bool "fft_eval"
> > +	help
> > +	  Pogram to aid open source spectrum analyzer development
>
>           ^^ Program
>
> > +	  for Qualcomm/Atheros AR92xx and AR93xx based chipsets.
> > +
> > +	  It visualizes the FFT data reported by the chips to help
> > +	  interpreting and understanding the data.
> > +
> > +	  Enabel sdl2 and sdl2_ttf for the graphic output tool
>
>           ^^ Enable

Thanks for fixing my typos ;-)

>
> > +FFT_EVAL_VERSION = 6a82b383ce79afc4c1ba26ffcf34b15d3e95894b
> > +FFT_EVAL_SITE = $(call github,simonwunderlich,FFT_eval,$(FFT_EVAL_VERSION))
> > +FFT_EVAL_LICENSE = CC0-1.0 (doc), GPL-2.0-only, OFL-1.1 (LiberationSans-Regular.ttf)
> > +FFT_EVAL_LICENSE_FILES = \
> > +	LICENSES/CC0-1.0.txt \
> > +	LICENSES/GPL-2.0-only.txt \
> > +	LICENSES/OFL-1.1.txt
> > +
> > +FFT_EVAL_CONV_OPTS = CONFIG_fft_eval_json=y
> > +FFT_EVAL_TARGETS = fft_eval_json
> > +
> > +ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_TTF),yy)
> > +FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=y
> > +FFT_EVAL_DEPENDENCIES += sdl2 sdl2_ttf
> > +FFT_EVAL_TARGETS += fft_eval_sdl
> > +else
> > +FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=n
> > +endif
> > +
> > +define FFT_EVAL_BUILD_CMDS
> > +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS=$(STAGING_DIR)/usr/bin/ $(FFT_EVAL_CONV_OPTS) -C $(@D) all
> > +endef
> > +
> > +define FFT_EVAL_INSTALL_TARGET_CMDS
> > +	for i in $(FFT_EVAL_TARGETS); do \
> > +		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin || exit 1; \
> > +	done
> > +endef
>
> I've use "make install" instead of doing the manual installation here.

Looks nicer..., but now the variable FFT_EVAL_TARGETS is unused?

Regards,
Peter

>
> Applied to next with those changes. Thanks!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
