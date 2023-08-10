Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB65C04A94
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 22:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D56417F5;
	Thu, 10 Aug 2023 22:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D56417F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEdOOfJgbvhA; Thu, 10 Aug 2023 22:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFFF8417F8;
	Thu, 10 Aug 2023 22:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFF8417F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A99F71BF83B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A42960ADA
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A42960ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6UOszUtCwnP for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 22:07:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E51960AD5
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E51960AD5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CA0C40002;
 Thu, 10 Aug 2023 22:07:39 +0000 (UTC)
Date: Fri, 11 Aug 2023 00:07:38 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230811000738.0c613b1e@windsurf>
In-Reply-To: <20230211163422.25944-1-ps.report@gmx.net>
References: <20230211163422.25944-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691705260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npGoUgDYDx9pGerIxo12H32vsIl80b6X2xdx++XMMLY=;
 b=W2aVuRWbaaxmNZ8LBnnafeGoA9C8IgBLlihP7ggUJSIxVdtcmaLhhNkJJqWoYpf6aVO8Fe
 xGvr7VkKjJxZgyaCMaDpfCZPuXxp1pyyi0iGtOLqERZwOZRUq06Eo6H+/TCwQvSziORwta
 edaRkBlrMVjB0JkHdpInX3dABoUnossfPba/2coILOOUxhXBlGzixXzGvLLtRtXH99wHcR
 cOuXjlGAdM6z42/G7RrdkLrUt9hiKZzndgOtyErMvnxreXvm/hGPzAKbT6s5aVcU606dQ5
 EnN82I9ZOZWtYs+pWoDNKs0mw/+plTW5Gu2uYrL+8insfAnhiFXaIG4yLa4HPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W2aVuRWb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Sat, 11 Feb 2023 17:34:22 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I have finally reviewed your patch and applied to next, with some changes. See below.

> ---
>  package/Config.in              |  1 +
>  package/fft_eval/Config.in     | 13 ++++++++++++
>  package/fft_eval/fft_eval.hash |  5 +++++
>  package/fft_eval/fft_eval.mk   | 36 ++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+)
>  create mode 100644 package/fft_eval/Config.in
>  create mode 100644 package/fft_eval/fft_eval.hash
>  create mode 100644 package/fft_eval/fft_eval.mk

I've renamed from fft_eval to fft-eval, as we prefer - as the separator
in package names these days.

I've added an entry in the DEVELOPERS file as well.


> diff --git a/package/fft_eval/Config.in b/package/fft_eval/Config.in
> new file mode 100644
> index 0000000000..4b6aa9b388
> --- /dev/null
> +++ b/package/fft_eval/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_FFT_EVAL
> +	bool "fft_eval"
> +	help
> +	  Pogram to aid open source spectrum analyzer development

          ^^ Program

> +	  for Qualcomm/Atheros AR92xx and AR93xx based chipsets.
> +
> +	  It visualizes the FFT data reported by the chips to help
> +	  interpreting and understanding the data.
> +
> +	  Enabel sdl2 and sdl2_ttf for the graphic output tool

          ^^ Enable

> +FFT_EVAL_VERSION = 6a82b383ce79afc4c1ba26ffcf34b15d3e95894b
> +FFT_EVAL_SITE = $(call github,simonwunderlich,FFT_eval,$(FFT_EVAL_VERSION))
> +FFT_EVAL_LICENSE = CC0-1.0 (doc), GPL-2.0-only, OFL-1.1 (LiberationSans-Regular.ttf)
> +FFT_EVAL_LICENSE_FILES = \
> +	LICENSES/CC0-1.0.txt \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/OFL-1.1.txt
> +
> +FFT_EVAL_CONV_OPTS = CONFIG_fft_eval_json=y
> +FFT_EVAL_TARGETS = fft_eval_json
> +
> +ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_TTF),yy)
> +FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=y
> +FFT_EVAL_DEPENDENCIES += sdl2 sdl2_ttf
> +FFT_EVAL_TARGETS += fft_eval_sdl
> +else
> +FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=n
> +endif
> +
> +define FFT_EVAL_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS=$(STAGING_DIR)/usr/bin/ $(FFT_EVAL_CONV_OPTS) -C $(@D) all
> +endef
> +
> +define FFT_EVAL_INSTALL_TARGET_CMDS
> +	for i in $(FFT_EVAL_TARGETS); do \
> +		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin || exit 1; \
> +	done
> +endef

I've use "make install" instead of doing the manual installation here.

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
