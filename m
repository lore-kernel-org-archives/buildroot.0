Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7101CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 18:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0B7140C59;
	Mon, 30 May 2022 18:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXTMCj2LRCIb; Mon, 30 May 2022 18:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 123E440A63;
	Mon, 30 May 2022 18:59:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E279A1BF289
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1A5A84079
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rervHZRDBclL for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 18:59:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE24B84078
 for <buildroot@buildroot.org>; Mon, 30 May 2022 18:59:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5886C0002;
 Mon, 30 May 2022 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653937175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2c3WotJHxPzCkPn7zBBsRMYA1zS4Q7cdQ0DrJwk7gw=;
 b=nlljd0zzzhkVJN558SXyomNuVqtlrat76YH/MEoPqB0uzONfccC6WCk4ClnSpi9cTIS4Jh
 0kGlM6N7eGaZev/cr1A67oDqyJfAsI98wVYLWiXQqFS4kmizIQPl6PFWQKjf7R9p/sN/P9
 895x3g6xH8Tp1hIAwZWLONUk2UkD982x74M9CGMRN6rv0D6h5Op+QGCB3Bup/AZmStstpR
 IlHYcKXn5s2yh4cxuZlg4H54VCTPv+zViFWewplCav8jvykKcBAHL31av8RIxCFT+VqcEO
 yJ0Dcy97prEJNMwWOHU6OY8uQQTb/fv7rl9qoIGK88DPvmHeImsJK0/L+LBD8g==
Date: Mon, 30 May 2022 20:59:33 +0200
To: Damien Le Moal via buildroot <buildroot@buildroot.org>
Message-ID: <20220530205933.5ad527f5@windsurf>
In-Reply-To: <20220530033836.474926-2-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-2-damien.lemoal@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 01/11] package: elf2flt: fix config menu
 entry description
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alistair Francis <alistair@alistair23.me>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Damien,

On Mon, 30 May 2022 12:38:26 +0900
Damien Le Moal via buildroot <buildroot@buildroot.org> wrote:

> From: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Keep the same style as other config menu entries by removing the
> question mark at the end of the elf2flt enable config option
> description.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>

Thanks for the patch, however I think that the correct fix is in fact
to drop this option entirely. Indeed, it doesn't do anything, and it
shouldn't do anything.

What decides whether host-elf2flt should be built or not is the
BR2_BINFMT_FLAT option in arch/Config.in. It is depending on this
option that the gcc package decides to build host-elf2flt:

package/gcc/gcc.mk:     $(if $(BR2_BINFMT_FLAT),host-elf2flt)

BR2_PACKAGE_HOST_ELF2FLT is only used in the definition of
BR2_STRIP_strip:

config BR2_STRIP_strip
        bool "strip target binaries"
        default y
        depends on !BR2_PACKAGE_HOST_ELF2FLT

and this should be replaced by:

	depends on BR2_BINFMT_ELF

So I think we should really get rid of package/elf2flt/Config.in.host
entirely.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
