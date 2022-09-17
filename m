Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00775ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E76540297;
	Sat, 17 Sep 2022 20:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E76540297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAECPO-wzfxe; Sat, 17 Sep 2022 20:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A51940119;
	Sat, 17 Sep 2022 20:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A51940119
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5221BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 610DC83260
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610DC83260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vorubNp1eRs7 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:40:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D522F823C0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D522F823C0
 for <buildroot@busybox.net>; Sat, 17 Sep 2022 20:40:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC6C41C0004;
 Sat, 17 Sep 2022 20:40:29 +0000 (UTC)
Date: Sat, 17 Sep 2022 22:40:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220917224028.51d3c07a@windsurf>
In-Reply-To: <20220822080923.31060-1-mf@go-sys.de>
References: <20220822080923.31060-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663447229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMcukfGPa7TZKpS7Ei6ePKRCpJuXSbKnSM57uG/uKD0=;
 b=m4CTn06letqpm5G1veB/pj6wv6d5Dbxr6M2MbjyZ+4wuGRW6qO9KYm2z01iYlXyxU4W5Yw
 irTeMeJt24UfxsD3J/6WtdcMBoRypLwqqduPPIUgThAgwQz+nAMaWhNYSMGXHtZFiug/+e
 SqKgtDRUiMhE2JlAC8reMyFaZGVhfzlQ/ODbrXyArvQ7/UnFjUwFXPxNWg83j0Y6sE7yxj
 7Ezbc+SIthKckdyxjnMVHLHPxdREIhR/S/QICmgmR93s/swR95wDIEGaY0qrSq8L+xBNSY
 On5BfnpQiXwmeh6QK7wH73E9usaVNlz4S59pM0RNAUfY/naupi8+xc0Vbc2VvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m4CTn06l
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
 2.6.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Aug 2022 10:09:23 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Fixed a number of security issues

As discussed, I dropped this part from the commit log.

> -sha256  bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0  SDL2_image-2.0.5.tar.gz
> -sha256  45079362e2230154205413a6940544ca94e3479ccf76205c71c4f542a6815d25  COPYING.txt
> +# Locally calculated after checking https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.6.2.tar.gz.sig
> +sha256  48355fb4d8d00bac639cd1c4f4a7661c4afef2c212af60b340e06b7059814777  SDL2_image-2.6.2.tar.gz
> +sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt

So indeed, COPYING.txt is gone, and LICENSE.txt is now there, but you
had forgotten to update the SDL2_IMAGE_LICENSE_FILES variable, causing
a build failure when doing "make legal-info".

I fixed both aspects, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
