Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5110AC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 21:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C744E61261
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 21:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C744E61261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65175400F4;
	Sat, 21 Aug 2021 21:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VakreQokcni4; Sat, 21 Aug 2021 21:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A476A40109;
	Sat, 21 Aug 2021 21:27:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 862851BF2B6
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 21:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7561180EA2
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 21:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9XEzx67SisA for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 21:27:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8533D80E9D
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 21:27:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7191920002;
 Sat, 21 Aug 2021 21:27:05 +0000 (UTC)
Date: Sat, 21 Aug 2021 23:27:03 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bensuperpc <bensuperpc@gmail.com>
Message-ID: <20210821232703.2457edfb@windsurf>
In-Reply-To: <20210821194401.58992-1-bensuperpc@gmail.com>
References: <20210821194401.58992-1-bensuperpc@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Enable quadmath on aarch64
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, 21 Aug 2021 21:44:01 +0200
Bensuperpc <bensuperpc@gmail.com> wrote:

> Enable quadmath on aarch64
> 
> Signed-off-by: Bensuperpc <bensuperpc@gmail.com>

We do need a real name to accept contributions.

> ---
>  toolchain/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 1d0469a13e..b4cd6d511f 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -794,6 +794,6 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
>  # - When available, libquadmath requires wchar support.
>  config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>  	bool
> -	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_i386 || BR2_x86_64 || BR2_aarch64

This option is not about "enabling" something, but about saying whether
libquadmath is supported/available on a given CPU architecture. Since
when is libquadmath available/supported by gcc?

What was the motivation behind this change?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
