Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C9BE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BEBD81366;
	Sun,  1 Oct 2023 16:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BEBD81366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmTnMwnGbTIf; Sun,  1 Oct 2023 16:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83968812E6;
	Sun,  1 Oct 2023 16:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83968812E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C04B1BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 453F2812E6
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 453F2812E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiGblIlTvrVu for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:40:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08182812DD
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08182812DD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F2851BF203;
 Sun,  1 Oct 2023 16:40:03 +0000 (UTC)
Date: Sun, 1 Oct 2023 18:40:02 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20231001184002.25f8c5d7@windsurf>
In-Reply-To: <20230725173102.543874-2-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
 <20230725173102.543874-2-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696178403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0icHjP2VlFviVYakDIhpCTaEoiU8vU+lav4Y+6A4hSk=;
 b=leojwLyafAvFkLnU4ipOvDxHe8PXD8C8/wGB9CQYcif7njK1ZCoUMaE++0tAjYO1Pi4bfm
 BujGdJxoifksZy9fnzLON0tF32aSn3pRATh9E3GKry3+6jsClqNfrFyOhf7A0WFylakUUZ
 /4GAwo49q4g6NXaEaTz9Y+m43hrYBfRQ7/6LXTuykmOhcwRR/jZ5Y3lHMaTESJTd1EogW9
 6fEi6RHUJ98uv7xHR05ZAH4e9OfLbU+RtLSeQ9Nw4zk7yPswl9AaoJH0ytZHrYVHGuNQFs
 NvfF4KIf9AaDM75wA6c5PxFQ1rrZzgRyCzFe03Qw9Qw5a3H1lLdXus+F8YSZmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=leojwLya
Subject: Re: [Buildroot] [PATCH v2 1/9] package/rust-bindgen: new host
 package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 25 Jul 2023 19:30:53 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> From: Romain Naour <romain.naour@smile.fr>
> 
> host-rust-bindgen will be required to build several different rust-based
> packages, including a Linux kernel with rust modules and mesa3d's
> rusticl which is the rust-based implementation of OpenCL.
> 
> The Cargo.toml file at the project root is a "virtual manifest". Since
> we only want to install rust-bindgen, we can specify RUST_BINDGEN_SUBDIR
> = bindgen-cli to use the Cargo.toml from this directory.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>


> diff --git a/DEVELOPERS b/DEVELOPERS
> index c690f1dac7..c9ac202de6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2602,6 +2602,9 @@ F:	support/misc/toolchainfile.cmake.in
>  N:	Sam Voss <sam.voss@gmail.com>
>  F:	package/ripgrep/
>  
> +N:	Sebastian Weyer <sebastian.weyer@smile.fr>
> +F:	package/rust-bindgen
                            ^^^ missing final slash here

Applied to master with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
