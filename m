Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E73C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 06:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF9541B39;
	Tue, 26 Jul 2022 06:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF9541B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeUzslGQvKaM; Tue, 26 Jul 2022 06:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD02419E1;
	Tue, 26 Jul 2022 06:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD02419E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBA281BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ABDC419DA
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ABDC419DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLdP8qEGG1ja for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 06:25:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D109B419A1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D109B419A1
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:25:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 468A520008;
 Tue, 26 Jul 2022 06:25:04 +0000 (UTC)
Date: Tue, 26 Jul 2022 08:25:03 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220726082503.48ce118f@windsurf>
In-Reply-To: <20220726044425.72570-2-james.hilliard1@gmail.com>
References: <20220726044425.72570-1-james.hilliard1@gmail.com>
 <20220726044425.72570-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658816705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIPQ6WSYQyOrNAI8gcB+yXnCtzqqidyKr8rTeG7HAAA=;
 b=GijXNLOauSeLCUFKTMo5+ZZ9or0QGf3Yv4LhqpfhTl5iet7N3NcChjS5w+W1ZsHwCIQrcs
 WkyfqSzMVn8MBRNVvL0M8XqKEXdI/rcep3rqcd7SeC3Hu1GwG8X6fZBiD3YYH/SOI83EwB
 OGlgaOwe1hoGbQhZesUa9/wcsIdM6p0Lc5fFDt0EGH1Co1n3bCA+lU24Ly0/6ay5B5szSw
 zjUiwK7bK4DuMTRAeUpi5X84nkPLHi0I670cwfkYd1H19QfELOGqpMLxcsSgRrecZ5nYvZ
 bAVH0WP9FiE3DdQzYC3Un051Qp5Wm0d8FVIxv3kaEtTh1Zxsr0P50tsGkIkCmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GijXNLOa
Subject: Re: [Buildroot] [PATCH v4 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 25 Jul 2022 22:44:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Note that we need to avoid setting HOST_DIR in paths when configuring
> as these will get appended to the destdir during installation which
> will result in incorrect paths.

I *think* this is wrong, at least in the classical autotools sense of
prefix vs. DESTDIR.

> @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
>  	mkdir -p $$($$(PKG)_SRCDIR)/build
>  	$$(HOST_CONFIGURE_OPTS) \
>  	$$($$(PKG)_CONF_ENV) $$(MESON) \
> -		--prefix=$$(HOST_DIR) \

	--prefix=$$(HOST_DIR)

should stay here.

>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +	$$(HOST_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		install \
> +		$$(MESON_INSTALL_OPTS) \
> +		--destdir $$(HOST_DIR) \

And you should drop --destdir $$(HOST_DIR) here.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
